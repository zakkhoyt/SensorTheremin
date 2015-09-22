//
//  UIColor+VWW.m
//  sensorTheremin
//
//  Created by Zakk Hoyt on 4/21/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "UIColor+ZH.h"


@implementation UIColor (ZH)

+(UIColor*)randomColor{
    return [UIColor randomColorWithAlpha:1.0];
}

+(UIColor*)randomColorWithAlpha:(float)alpha{
    CGFloat red = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat blue = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat green = (arc4random() % 0xFF) / (float)0xFF;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+(UIColor*)randomSoftColor{
    return [UIColor randomSoftColorWithAlpha:1.0];
}

+(UIColor*)randomSoftColorWithAlpha:(float)alpha{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); // 0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}


#pragma mark sensorTheremin


+(UIColor*)sensorThereminPurpleColor{
    return [UIColor colorWithRed:(119/(float)0xFF) green:(76/(float)0xFF) blue:(121/(float)0xFF) alpha:1.0];
}

+(UIColor*)sensorThereminYellowColor{
    return [UIColor colorWithRed:(246/(float)0xFF) green:(225/(float)0xFF) blue:(92/(float)0xFF) alpha:1.0];
}

+(UIColor*)sensorThereminRedColor{
    return [UIColor colorWithRed:(185/(float)0xFF) green:(73/(float)0xFF) blue:(57/(float)0xFF) alpha:1.0];
}
+(UIColor*)sensorThereminGreenColor{
    return [UIColor colorWithRed:(0x8E/(float)0xFF) green:(0xC4/(float)0xFF) blue:(0x64/(float)0xFF) alpha:1.0];
    
}
+(UIColor*)sensorThereminBlackColor{
    return [UIColor colorWithRed:(59/(float)0xFF) green:(71/(float)0xFF) blue:(80/(float)0xFF) alpha:1.0];
}

+(UIColor*)sensorThereminBlueColor{
    return [UIColor colorWithRed:(02/(float)0xFF) green:(0xBA/(float)0xFF) blue:(0xDB/(float)0xFF) alpha:1.0];
}

+(UIColor*)sensorThereminOrangeColor{
    return [UIColor colorWithRed:(0xFF/(float)0xFF) green:(0x9F/(float)0xFF) blue:(0x00/(float)0xFF) alpha:1.0];
}

+(UIColor*)sensorThereminDimBackgroundColor{
    return [[UIColor blackColor] colorWithAlphaComponent:0.5];
}








// See PKDefines.h
#if defined(PK_ALTERNATE_COLORS)



+(UIColor*)sensorThereminBackgroundColor{
    return [UIColor colorWithRed:(86.3/(float)0xFF) green:(86.3/(float)0xFF) blue:(86.3/(float)0xFF) alpha:1.0];
}
+(UIColor*)sensorThereminTranslucentBackgroundColor{
    return [[UIColor sensorThereminBackgroundColor] colorWithAlphaComponent:0.9];
}

+(UIColor*)sensorThereminTintColor{
    return [UIColor orangeColor];
}
+(UIColor*)sensorThereminAlternateTintColor{
    return [UIColor purpleColor];
}
+(UIColor*)sensorThereminLightTextColor{
    return [UIColor darkTextColor];
}
+(UIColor*)sensorThereminDarkTextColor{
    return [UIColor lightTextColor];
}

#else 
+(UIColor*)sensorThereminBackgroundColor{
    return [UIColor colorWithRed:(243/(float)0xFF) green:(242/(float)0xFF) blue:(237/(float)0xFF) alpha:1.0];
}
+(UIColor*)sensorThereminTranslucentBackgroundColor{
    return [[UIColor sensorThereminBackgroundColor] colorWithAlphaComponent:0.9];
}
+(UIColor*)sensorThereminTintColor{
    return [UIColor colorWithRed:(02/(float)0xFF) green:(0xBA/(float)0xFF) blue:(0xDB/(float)0xFF) alpha:1.0];
}
+(UIColor*)sensorThereminAlternateTintColor{
    return [UIColor colorWithRed:(0xFF/(float)0xFF) green:(0x9F/(float)0xFF) blue:(0x00/(float)0xFF) alpha:1.0];
}
+(UIColor*)sensorThereminLightTextColor{
    return [UIColor lightTextColor];
}
+(UIColor*)sensorThereminDarkTextColor{
    return [UIColor darkTextColor];
}

#endif




@end
