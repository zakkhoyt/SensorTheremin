//
//  ZHSensorClusters.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/23/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHSensorCluster.h"

@interface ZHSensorClusters : NSObject
@property (nonatomic, strong) ZHSensorCluster *touchScreen;
@property (nonatomic, strong) ZHSensorCluster *accelerometer;
+(ZHSensorClusters*)sharedInstance;


@end
