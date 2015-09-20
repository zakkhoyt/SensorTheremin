//
//  GameScene.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/13/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "TouchScene.h"
#import "Utilities.h"
#import "Instrument.h"

#import "OscillatorInstrument.h"
#import "Oscillator.h"

@interface TouchScene ()
@property (nonatomic, strong) SKLabelNode *frequencyLabelNode;
@property (nonatomic, strong) Instrument *touchX;
@property (nonatomic, strong) Instrument *touchY;
@property (nonatomic, strong) SKSpriteNode *touchXSprite;
@property (nonatomic, strong) SKSpriteNode *touchYSprite;

//@property (nonatomic, strong) OscillatorInstrument *osc;

@end

@implementation TouchScene{
    Oscillator *newInstrument;
    BOOL isNewInstrumentPlaying;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.frequencyLabelNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    self.frequencyLabelNode.text = @"Hello, World!";
    self.frequencyLabelNode.fontSize = 45;
    self.frequencyLabelNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:self.frequencyLabelNode];
    
    
    self.touchX = [[Instrument alloc]init];
    self.touchX.minFrequency = 55.0;
    self.touchX.maxFrequency = 440;
    
//    self.osc = [[OscillatorInstrument alloc]init];
//    [AKOrchestra addInstrument:self.osc];

    
    newInstrument = [[Oscillator alloc] init];
    [AKOrchestra addInstrument:newInstrument];
    
}

#pragma mark SKScene

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


#pragma mark UIResponder

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
////    /* Called when a touch begins */
////    
////    for (UITouch *touch in touches) {
////        CGPoint location = [touch locationInNode:self];
////        
////        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
////        
////        sprite.xScale = 0.5;
////        sprite.yScale = 0.5;
////        sprite.position = location;
////        
////        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
////        
////        [sprite runAction:[SKAction repeatActionForever:action]];
////        
////        [self addChild:sprite];
////    }
//    [self addSpriteForTouch:[touches anyObject]];
//    [self convertTouches:touches withEvent:event];
    
    [newInstrument play];
    isNewInstrumentPlaying = YES;
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    self.touchXSprite.position = [touch locationInNode:self];
    [self convertTouches:touches withEvent:event];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
////    [self convertTouches:touches withEvent:event];
//    [self.touchY setFrequencyFromNormalizedValue:0];
//    [self.touchXSprite removeFromParent];
    
    [newInstrument stop];
    isNewInstrumentPlaying = NO;
}

-(void)convertTouches:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInNode:self];
        CGPoint normPoint = [self normalizePoint:point];
//        [self.touchX setFrequencyFromNormalizedValue:normPoint.x];
//        [newInstrument setFrequency:normPoint.x * 1000];
                [newInstrument setFrequency:normPoint.x * 1000];
//        [newInstrument setAmplitude:normPoint.y];
//        [newInstrument setModulation:normPoint.y];
        [newInstrument setCarrier:normPoint.y];
    }
}

#pragma mark Private methods



/*! 
 * Converts a point in a view to a 0.0 .. 1.0 ranged point
 * @param point             A typical point in a UIView
 * @return                  CGPoint where x and y range from 0.0 to 1.0
 */

-(CGPoint)normalizePoint:(CGPoint)point{
    CGPoint normPoint = CGPointZero;
    normPoint.x = [Utilities mapInValue:point.x inMinimum:0 inMaximum:self.frame.size.width outMinimum:0.0 outMaximum:1.0];
    normPoint.y = [Utilities mapInValue:point.y inMinimum:0 inMaximum:self.frame.size.height outMinimum:0.0 outMaximum:1.0];
    self.frequencyLabelNode.text = [NSString stringWithFormat:@"%.2f %.2f "
                                    @"%.2f %.2f\n",
                                    normPoint.x, self.touchX.currentFrequency,
                                    normPoint.y, self.touchY.currentFrequency];
    NSLog(@"%@", self.frequencyLabelNode.text);
    return normPoint;
}

-(void)addSpriteForTouch:(UITouch*)touch{
    
    CGPoint location = [touch locationInNode:self];
    
    self.touchXSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    self.touchXSprite.xScale = 0.5;
    self.touchXSprite.yScale = 0.5;
    self.touchXSprite.position = location;
    
    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
    
    [self.touchXSprite runAction:[SKAction repeatActionForever:action]];
    
    [self addChild:self.touchXSprite];

}




@end
