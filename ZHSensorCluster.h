//
//  ZHSensorCluster.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/23/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHSensor;

@interface ZHSensorCluster : NSObject

@property (nonatomic, strong, readonly) NSString *sensorClusterName;

@property (nonatomic, strong) ZHSensor *x;
@property (nonatomic, strong) ZHSensor *y;
@property (nonatomic, strong) ZHSensor *z;

-(instancetype)initWithSensorClusterName:(NSString*)sensorClusterName;
-(instancetype)initWithSensorClusterName:(NSString*)sensorClusterName expectedInputMax:(CGFloat)expectedInputMax expectedInputMin:(CGFloat)expectedInputMin;

-(void)setExpectedInputMax:(CGFloat)expectedInputMax expectedInputMin:(CGFloat)expectedInputMin;
-(void)updateSensorInputsForX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z;

@end
