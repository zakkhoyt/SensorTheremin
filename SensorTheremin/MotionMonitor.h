//
//  MotionMonitor.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sensor.h"

@interface MotionMonitor : NSObject

+(MotionMonitor*)sharedInstance;

-(void)start;
-(void)stop;

// KVO observable
@property (nonatomic, strong, readonly) Sensor *sensor;
@end
