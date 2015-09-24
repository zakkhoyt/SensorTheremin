//
//  SensorInput.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHSensor.h"
#import "ZHUtilities.h"

CGFloat const ZHSensorUnused = -111111111.1;

@implementation ZHSensor

- (instancetype)init {
    NSAssert(NO, @"Use designated initializer");
    return nil;
}

- (instancetype)initWithSensorName:(NSString*)sensorName{
    self = [super init];
    if (self) {
        _sensorName = sensorName;
        _expectedInputMax = 1.0;
        _expectedInputMin = -1.0;
    }
    return self;
}


-(void)setInputValue:(CGFloat)inputValue{
    _inputValue = inputValue;
    
    // Set raw outputs
    self.outputRaw = inputValue;
    self.outputRawMax = MAX(self.outputRawMax, self.outputRaw);
    self.outputRawMin = MIN(self.outputRawMin, self.outputRaw);
    
    // Set normalized outputs
    self.outputNormalized = [ZHUtilities mapNormalizedValue:inputValue minimum:_expectedInputMin maximum:_expectedInputMax];
    self.outputNormalizedMax = MAX(self.outputNormalizedMax, self.outputNormalized);
    self.outputNormalizedMin = MIN(self.outputNormalizedMin, self.outputNormalized);

//    NSLog(@"%@ Raw: %.2f|%.2f|%.2f", _sensorName, _outputRawMin, _outputRaw, _outputRawMax);
//    NSLog(@"%@ Nor: %.2f|%.2f|%.2f", _sensorName, _outputNormalizedMin, _outputNormalized, _outputNormalizedMax);
}
@end
