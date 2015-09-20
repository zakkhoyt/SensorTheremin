//
//  NewInstrument.m
//  MotionTheremin
//
//  Created by Zakk Hoyt on 9/19/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "NewInstrument.h"
#import "AKFoundation.h"


@interface NewInstrument ()

//@property (nonatomic, strong) AKParameter *frequencyParameter;
@property (nonatomic, strong) AKInstrumentProperty *frequencyValue;
@property (nonatomic, strong) AKInstrumentProperty *carrierMultValue;
@property (nonatomic, strong) AKInstrumentProperty *modIndexValue;
@property (nonatomic, strong) AKInstrumentProperty *amplitudeValue;
@end

@implementation NewInstrument 

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

    }
    return self;
}

-(void)setFrequency:(float)frequency{
    _frequencyValue.value = frequency;
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