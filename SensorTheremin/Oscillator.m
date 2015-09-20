//
//  NewInstrument.m
//  MotionTheremin
//
//  Created by Zakk Hoyt on 9/19/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//
//  http://audiokit.io/tutorials/user-interaction/

#import "Oscillator.h"
#import "AKFoundation.h"


@interface Oscillator ()

//@property (nonatomic, strong) AKParameter *frequencyParameter;
@property (nonatomic, strong) AKInstrumentProperty *frequencyValue;
@property (nonatomic, strong) AKInstrumentProperty *carrierMultValue;
@property (nonatomic, strong) AKInstrumentProperty *modIndexValue;
@property (nonatomic, strong) AKInstrumentProperty *amplitudeValue;
@end

@implementation Oscillator 

- (instancetype)init
{
    self = [super init];
    if (self) {
        AKFMOscillator *fmOscillator;
        fmOscillator = [[AKFMOscillator alloc] init];
        
        _frequencyValue = [self createPropertyWithValue:550 minimum:0 maximum:1000];
        _carrierMultValue = [self createPropertyWithValue:0.5  minimum:0.0 maximum:1.0];
        _modIndexValue = [self createPropertyWithValue:0.5  minimum:0.0 maximum:1.0];
        _amplitudeValue = [self createPropertyWithValue:0.5 minimum:0.0 maximum:1.0];
        
        
        fmOscillator.baseFrequency = _frequencyValue;
        fmOscillator.amplitude = _amplitudeValue;
        fmOscillator.modulationIndex = _modIndexValue;
        fmOscillator.carrierMultiplier = _carrierMultValue;
        [self setAudioOutput:fmOscillator];
        
        
        
//        AKFlanger *flanger = [[AKFlanger alloc]initWithInput:fmOscillator delayTime:0.245];


        
        
////
//        AKDelay *delay = [[AKDelay alloc]initWithInput:fmOscillator delayTime:[AKConstant constantWithFloat:0.5]];
////        [self setAudioOutput:delay];
//        [self appendOutput:delay withInput:fmOscillator];

        
//        AKOrchestra *orchestra = [[AKOrchestra alloc]init];
//        [orchestra addInstrument:fmOscillator];
//        [orchestra addInstrument:delay];
//        
        
        

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
