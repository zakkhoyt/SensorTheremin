//
//  Sensor.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "Sensor.h"

@implementation Sensor

- (instancetype)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z {
    self = [super init];
    if (self) {
        self.x = x;
        self.y = y;
        self.z = z;
    }
    return self;
}

- (instancetype)initWithRoll:(CGFloat)roll pitch:(CGFloat)pitch yaw:(CGFloat)yaw{
    self = [super init];
    if (self) {
        _x = roll;
        _y = pitch;
        _z = yaw;
    }
    return self;
}

-(void)setX:(CGFloat)x{
    [self setXAxis:x];
}

-(void)setY:(CGFloat)y{
    [self setYAxis:y];
}

-(void)setZ:(CGFloat)z{
    [self setZAxis:z];
}


-(void)setRoll:(CGFloat)roll{
    [self setXAxis:roll];
}
-(void)setPitch:(CGFloat)pitch{
    [self setYAxis:pitch];
}

-(void)setYaw:(CGFloat)yaw{
    [self setZAxis:yaw];
}


-(void)setXAxis:(CGFloat)x{
    _x = x;
    _roll = x;
}

-(void)setYAxis:(CGFloat)y{
    _y = y;
    _pitch = y;
}

-(void)setZAxis:(CGFloat)z{
    _z = z;
    _yaw = z;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"x: %.2f\n"
            @"y: %.2f\n"
            @"x: %.2f\n",
            _x, _y, _z];
}
@end
