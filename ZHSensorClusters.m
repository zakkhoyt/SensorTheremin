//
//  ZHSensorClusters.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/23/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHSensorClusters.h"

@implementation ZHSensorClusters
+(ZHSensorClusters*)sharedInstance{
    static ZHSensorClusters *instance;
    if(instance == nil){
        instance = [[ZHSensorClusters alloc]initSensorClusters];
    }
    return instance;
}

- (instancetype)init {
    NSAssert(NO, @"Use designated singleton (sharedInstance)");
    return nil;
}

- (instancetype)initSensorClusters{
    self = [super init];
    if (self) {
        _touchScreen = [[ZHSensorCluster alloc]initWithSensorClusterName:@"touchScreen"];
        _accelerometer = [[ZHSensorCluster alloc]initWithSensorClusterName:@"device.userAcceleration"];
    }
    return self;
}

@end
