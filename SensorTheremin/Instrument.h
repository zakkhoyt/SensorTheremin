//
//  Instrument.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Instrument : NSObject
@property (nonatomic, strong) id instrument;
@property (nonatomic) CGFloat minFrequency;
@property (nonatomic) CGFloat maxFrequency;
@property (nonatomic) CGFloat currentFrequency;


-(void)setFrequencyFromNormalizedValue:(CGFloat)normalizedValue;
@end
