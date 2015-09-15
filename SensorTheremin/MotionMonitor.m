//
//  MotionMonitor.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "MotionMonitor.h"
@import CoreMotion;

@interface MotionMonitor ()
@property (nonatomic, strong) CMMotionManager *motion;
@property (nonatomic, strong, readwrite) Sensor *sensor;
@end

@implementation MotionMonitor

+(MotionMonitor*)sharedInstance{
    static MotionMonitor *instance;
    if(instance == nil){
        instance = [[MotionMonitor alloc]init];
    }
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.motion = [[CMMotionManager alloc]init];
        
    }
    return self;
}

-(void)start{
    [self.motion startDeviceMotionUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        Sensor *sensor = [[Sensor alloc]initWithX:motion.userAcceleration.x Y:motion.userAcceleration.y Z:motion.userAcceleration.z];
        self.sensor = sensor;
    }];
    
}
-(void)stop{
    [self.motion stopDeviceMotionUpdates];
}

@end
