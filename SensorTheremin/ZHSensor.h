//
//  SensorInput.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat const ZHSensorUnused;

@interface ZHSensor : NSObject

- (instancetype)initWithSensorName:(NSString*)sensorName;
@property (nonatomic, strong, readonly) NSString *sensorName;

// Input
@property (nonatomic) CGFloat expectedInputMax;
@property (nonatomic) CGFloat expectedInputMin;
@property (nonatomic) CGFloat inputValue;


// Output
@property (nonatomic) CGFloat outputRaw;
@property (nonatomic) CGFloat outputRawMax;
@property (nonatomic) CGFloat outputRawMin;

@property (nonatomic) CGFloat outputNormalized;
@property (nonatomic) CGFloat outputNormalizedMax;
@property (nonatomic) CGFloat outputNormalizedMin;




@end
