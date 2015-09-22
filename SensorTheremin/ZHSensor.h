//
//  Sensor.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ZHSensor : NSObject

- (instancetype)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z;
- (instancetype)initWithRoll:(CGFloat)roll pitch:(CGFloat)pitch yaw:(CGFloat)yaw;

@property (nonatomic, readonly) CGFloat x;
@property (nonatomic, readonly) CGFloat y;
@property (nonatomic, readonly) CGFloat z;
@property (nonatomic, readonly) CGFloat roll;
@property (nonatomic, readonly) CGFloat pitch;
@property (nonatomic, readonly) CGFloat yaw;


@end
