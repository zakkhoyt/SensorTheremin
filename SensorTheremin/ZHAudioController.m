
//
//  AudioController.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHAudioController.h"
#import "ZHSensorClusters.h"
#import "ZHUtilities.h"


@interface ZHAudioController ()
@property (nonatomic, strong) AKAmplifier *amp;
@property (nonatomic, strong) ZHSensorClusters *sensorClusters;
@end

@implementation ZHAudioController

+(ZHAudioController*)sharedInstance{
    static ZHAudioController *instance;
    if(instance == nil){
        instance = [[ZHAudioController alloc]init];
    }
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.oscillator = [[ZHOscillator alloc] init];
        [AKOrchestra addInstrument:self.oscillator];
        [self.oscillator play];

        self.sensorClusters = [ZHSensorClusters sharedInstance];
        [self.sensorClusters addObserver:self forKeyPath:@"accelerometer.x.outputNormalized" options:NSKeyValueObservingOptionNew context:nil];
        [self.sensorClusters addObserver:self forKeyPath:@"accelerometer.z.outputNormalized" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)dealloc{
    // TODO: clean up KVO
    [self.sensorClusters removeObserver:self forKeyPath:@""];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    NSLog(@"%@ changed", keyPath);
    ZHSensorClusters *sensorClusters = nil;
    if([object isKindOfClass:[ZHSensorClusters class]]){
        sensorClusters = object;
    }

    NSNumber *outputNormalizedNumber = change[NSKeyValueChangeNewKey];
    CGFloat outputNormalized = outputNormalizedNumber.doubleValue;
    if([keyPath isEqualToString:@"accelerometer.x.outputNormalized"]){
        CGFloat freq = [ZHUtilities mapInValue:outputNormalized inMinimum:-1.0 inMaximum:1.0 outMinimum:200 outMaximum:2000];
        NSLog(@"freq: %.2f", freq);
        [self.oscillator setFrequency:freq];
    } else if([keyPath isEqualToString:@"accelerometer.y.outputNormalized"]){
        
    } else if([keyPath isEqualToString:@"accelerometer.z.outputNormalized"]){
        CGFloat freq = [ZHUtilities mapInValue:outputNormalized inMinimum:-1.0 inMaximum:1.0 outMinimum:0 outMaximum:1.0];
        [self.oscillator setAmplitude:freq];
        
    }
    
}


@end

