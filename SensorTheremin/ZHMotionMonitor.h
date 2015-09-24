//
//  MotionMonitor.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHMotionMonitor : NSObject

+(ZHMotionMonitor*)sharedInstance;

-(void)start;
-(void)stop;

// KVO observable
//@property (nonatomic, strong, readonly) ZHSensor *accelerometer;
//@property (nonatomic, strong, readonly) ZHSensor *gyroscope;
//@property (nonatomic, strong, readonly) ZHSensor *magnetometer;
@end
