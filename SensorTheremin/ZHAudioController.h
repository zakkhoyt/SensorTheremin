//
//  AudioController.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKFoundation.h"



#import "Instrument.h"
//#import "OscillatorInstrument.h"
#import "ZHOscillator.h"

@interface ZHAudioController : NSObject
+(ZHAudioController*)sharedInstance;

@property (nonatomic, strong) Instrument *touchX;
@property (nonatomic, strong) Instrument *touchY;
@property (nonatomic, strong) ZHOscillator *oscillator;
@property (nonatomic, strong) AKTambourineInstrument *tambourine;
@end
