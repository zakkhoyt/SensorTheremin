//
//  Utilities.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHUtilities : NSObject

+(CGFloat)mapNormalizedValue:(CGFloat)normalizedValue
                     minimum:(CGFloat)minimum
                     maximum:(CGFloat)maximum;

+(CGFloat)mapInValue:(CGFloat)inValue
           inMinimum:(CGFloat)inMinimum
           inMaximum:(CGFloat)inMaximum
          outMinimum:(CGFloat)outMinimum
          outMaximum:(CGFloat)outMaximum;
@end
