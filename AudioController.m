//
//  AudioController.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "AudioController.h"

@interface AudioController ()

@end

@implementation AudioController

+(AudioController*)sharedInstance{
    static AudioController *instance;
    if(instance == nil){
        instance = [[AudioController alloc]init];
    }
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.oscillator = [[Oscillator alloc] init];
        [AKOrchestra addInstrument:self.oscillator];

        
        //    self.osc = [[OscillatorInstrument alloc]init];
        //    [AKOrchestra addInstrument:self.osc];

        self.touchX = [[Instrument alloc]init];
        self.touchX.minFrequency = 55.0;
        self.touchX.maxFrequency = 440;
        
    }
    return self;
}


-(void)setFrequency:(float)frequency{
    //    _frequencyValue.value = frequency;
    _frequencyValue.floatValue = frequency;
}

-(void)setAmplitude:(float)amplitude{
    _amplitudeValue.value = amplitude;
}

-(void)setModulation:(float)modulation{
    _modIndexValue.value = modulation;
}

-(void)setCarrier:(float)carrier{
    _carrierMultValue.value = carrier;
}


@end

