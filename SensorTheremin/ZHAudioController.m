//
//  AudioController.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHAudioController.h"



@interface ZHAudioController ()
@property (nonatomic, strong) AKAmplifier *amp;
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
    }
    return self;
}




@end

