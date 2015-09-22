//
//  AudioController.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "AudioController.h"



@interface AudioController ()
@property (nonatomic, strong) AKAmplifier *amp;
@end

@implementation AudioController{
    
    
//    AKTambourineInstrument *tambourine;
}

+(AudioController*)sharedInstance{
    static AudioController *instance;
    if(instance == nil){
//        instance = [[AudioController alloc]init];
    }
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
//        self.oscillator = [[Oscillator alloc] init];
//        [AKOrchestra addInstrument:self.oscillator];
        
        
        
         self.tambourine = [[AKTambourineInstrument alloc] init];
//        self.tambourine.amplitude = 1.0;
        self.amp = [[AKAmplifier alloc] initWithInput:self.tambourine.output];
        [AKOrchestra addInstrument:self.amp];
        [self.amp start];
//
//        self.touchX = [[Instrument alloc]init];
//        self.touchX.minFrequency = 55.0;
//        self.touchX.maxFrequency = 440;
        
        
        
        
        
        
        
        
//        AKMandolin *mandolin = [[AKMandolin alloc]init];
//        
//        AKOrchestra *orchestra = [[AKOrchestra alloc]init];
//        [orchestra addInstrument:mandolin];

        
        
        
//        AKInstrument *instrument = [AKInstrument instrument];
//        [instrument setAudioOutput:[[Mandolin alloc]init]];
//        [AKOrchestra addInstrument:instrument];
//        [instrument play];
        
        
//        tambourine = [[AKTambourineInstrument alloc] init];
//        [AKOrchestra addInstrument:tambourine];
//        
//        AKAmplifier *amp = [[AKAmplifier alloc] initWithInput:tambourine.output];
//        [AKOrchestra addInstrument:amp];
//        [amp start];
//        
//        AKTambourineNote *n = [[AKTambourineNote alloc] initWithIntensity:128 dampingFactor:0.5];
//        [tambourine playNote:n];
        
    }
    return self;
}




@end

