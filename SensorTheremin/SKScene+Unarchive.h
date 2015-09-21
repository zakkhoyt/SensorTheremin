//
//  SKScene+Unarchive.h
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/21/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKScene (Unarchive)
+ (instancetype)unarchiveFromFile:(NSString *)file;
@end
