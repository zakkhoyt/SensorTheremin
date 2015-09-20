//
//  NewInstrument.h
//  MotionTheremin
//
//  Created by Zakk Hoyt on 9/19/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "AKInstrument.h"

@interface NewInstrument : AKInstrument

-(void)setFrequency:(float)frequency;
-(void)setAmplitude:(float)amplitude;
-(void)setModulation:(float)modulation;
-(void)setCarrier:(float)carrier;
@end
