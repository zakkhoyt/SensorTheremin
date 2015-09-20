//
//  Instrument.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "Instrument.h"
#import "Utilities.h"

#import "AKFoundation.h"
#import "Conductor.h"
#import "NSTimer+Blocks.h"


@interface Instrument ()
@property (nonatomic, strong) Conductor *conductor;
@end

@implementation Instrument

- (instancetype)init {
    self = [super init];
    if (self) {
        self.conductor = [[Conductor alloc] init];
    }
    return self;
}

- (instancetype)initWithMinFrequency:(CGFloat)minFrequency maxFrequency:(CGFloat)maxFrequency{
    self = [self init];
    self.minFrequency = minFrequency;
    self.maxFrequency = maxFrequency;
    return self;
}

-(void)setFrequencyFromNormalizedValue:(CGFloat)normalizedValue{

    CGFloat currentFrequency = [Utilities mapInValue:normalizedValue inMinimum:0.0 inMaximum:1.0 outMinimum:self.minFrequency outMaximum:self.maxFrequency];
    self.currentFrequency = currentFrequency;
    [self.conductor playFrequency:self.currentFrequency];
}

-(void)stop{
    [self.conductor stop];
}
@end
