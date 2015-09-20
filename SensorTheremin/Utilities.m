//
//  Utilities.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//
//  Tests
//  CGFloat z = [Utilities mapNormalizedValue:0.5 minimum:30 maximum:330];
//  CGFloat v = [Utilities mapInValue:180 inMinimum:30 inMaximum:330 outMinimum:0.0 outMaximum:2.0];


#import "Utilities.h"

@implementation Utilities

+(CGFloat)mapNormalizedValue:(CGFloat)normalizedValue minimum:(CGFloat)minimum maximum:(CGFloat)maximum{
    return [Utilities mapInValue:normalizedValue inMinimum:0.0 inMaximum:1.0 outMinimum:minimum outMaximum:maximum];
}

+(CGFloat)mapInValue:(CGFloat)inValue
           inMinimum:(CGFloat)inMinimum
           inMaximum:(CGFloat)inMaximum
          outMinimum:(CGFloat)outMinimum
          outMaximum:(CGFloat)outMaximum{

    CGFloat inDelta = inMaximum - inMinimum;
    CGFloat iv = inValue - inMinimum;
    CGFloat inNormalized = iv / inDelta;
    
    CGFloat outDelta = outMaximum - outMinimum;
    CGFloat outNormalized = outMinimum + outDelta * inNormalized;
    return outNormalized;
}


@end
