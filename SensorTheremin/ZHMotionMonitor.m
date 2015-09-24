//
//  MotionMonitor.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHMotionMonitor.h"
#import "ZHSensorClusters.h"

@import CoreMotion;

@interface ZHMotionMonitor ()
@property (nonatomic, strong) CMMotionManager *motion;
@property (nonatomic, strong) ZHSensorClusters *sensorClusters;
@end

@implementation ZHMotionMonitor

+(ZHMotionMonitor*)sharedInstance{
    static ZHMotionMonitor *instance;
    if(instance == nil){
        instance = [[ZHMotionMonitor alloc]init];
    }
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _sensorClusters = [ZHSensorClusters sharedInstance];
        _motion = [[CMMotionManager alloc]init];
    }
    return self;
}

-(void)start{
    [self.motion startDeviceMotionUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        // Acceleration
        [self.sensorClusters.accelerometer updateSensorInputsForX:motion.userAcceleration.x y:motion.userAcceleration.y z:motion.userAcceleration.z];
    }];
    
}
-(void)stop{
    [self.motion stopDeviceMotionUpdates];
}

@end
