//
//  SensorInput.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZHSensorInput : NSObject

@property (nonatomic) CGFloat maximumValue;
@property (nonatomic) CGFloat value;
@property (nonatomic) CGFloat minimumValue;


// Somewhere between
@property (nonatomic) CGFloat outputValue;
@end
