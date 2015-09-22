//
//  SensorInput.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SensorInput : NSObject
@property (nonatomic) CGFloat minimumValue;
@property (nonatomic) CGFloat maximumValue;

// Somewhere between
@property (nonatomic) CGFloat outputValue;
@end
