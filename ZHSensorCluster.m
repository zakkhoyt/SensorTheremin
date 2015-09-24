//
//  ZHSensorCluster.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/23/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHSensorCluster.h"
#import "ZHSensor.h"

@implementation ZHSensorCluster

- (instancetype)init {
    NSAssert(NO, @"Use designated initializer");
    return nil;
}

-(instancetype)initWithSensorClusterName:(NSString*)sensorClusterName {
    self = [super init];
    if (self) {
        _sensorClusterName = sensorClusterName;
        _x = [[ZHSensor alloc]initWithSensorName:[NSString stringWithFormat:@"%@.x", _sensorClusterName]];
        _y = [[ZHSensor alloc]initWithSensorName:[NSString stringWithFormat:@"%@.y", _sensorClusterName]];
        _z = [[ZHSensor alloc]initWithSensorName:[NSString stringWithFormat:@"%@.z", _sensorClusterName]];
    }
    return self;
}

-(instancetype)initWithSensorClusterName:(NSString*)sensorClusterName expectedInputMax:(CGFloat)expectedInputMax expectedInputMin:(CGFloat)expectedInputMin{
    self = [super init];
    if (self) {
        _x = [[ZHSensor alloc]initWithSensorName:[NSString stringWithFormat:@"%@.x", _sensorClusterName]];
        _y = [[ZHSensor alloc]initWithSensorName:[NSString stringWithFormat:@"%@.y", _sensorClusterName]];
        _z = [[ZHSensor alloc]initWithSensorName:[NSString stringWithFormat:@"%@.z", _sensorClusterName]];
        _sensorClusterName = sensorClusterName;
        [self setExpectedInputMax:expectedInputMax expectedInputMin:expectedInputMin];
    }
    return self;
}

-(void)setExpectedInputMax:(CGFloat)expectedInputMax expectedInputMin:(CGFloat)expectedInputMin{
    _x.expectedInputMax = expectedInputMax;
    _y.expectedInputMax = expectedInputMax;
    _z.expectedInputMax = expectedInputMax;
    
    _x.expectedInputMin = expectedInputMin;
    _y.expectedInputMin = expectedInputMin;
    _z.expectedInputMin = expectedInputMin;
}

-(void)updateSensorInputsForX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z{
    _x.inputValue = x;
    _y.inputValue = y;
    if(z != ZHSensorUnused){
        _z.inputValue = z;
    }
}
@end
