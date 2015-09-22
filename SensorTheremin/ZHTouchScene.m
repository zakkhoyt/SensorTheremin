//
//  GameScene.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/13/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHTouchScene.h"
#import "ZHUtilities.h"
#import "ZHAudioController.h"



@interface ZHTouchScene ()
@property (nonatomic, strong) SKLabelNode *xLabelNode;
@property (nonatomic, strong) SKLabelNode *yLabelNode;
@property (nonatomic, strong) SKSpriteNode *touchXSprite;
@property (nonatomic, strong) SKSpriteNode *touchYSprite;
@property (nonatomic, strong) SKEmitterNode *sparkEmitterNode;
@end

@implementation ZHTouchScene

-(void)didMoveToView:(SKView *)view {
    
    [self setupEmitter];
    [self setupLabels];
    [self setupInstruments];
    
}

-(void)setupInstruments{
    [ZHAudioController sharedInstance];
}

-(void)setupEmitter{
    NSString *messagePath = [[NSBundle mainBundle] pathForResource:@"ZHSparkEmitter" ofType:@"sks"];
    self.sparkEmitterNode = [NSKeyedUnarchiver unarchiveObjectWithFile:messagePath];
    self.sparkEmitterNode.particleBirthRate = 0;
    self.sparkEmitterNode.targetNode = self;
    [self addChild:self.sparkEmitterNode];
    
}


-(void)setupLabels{
    self.xLabelNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.xLabelNode.text = @"x";
    self.xLabelNode.fontSize = 24;
    self.xLabelNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                           CGRectGetMidY(self.frame) - 40);
    
    [self addChild:self.xLabelNode];
    
    self.yLabelNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.yLabelNode.text = @"y";
    self.yLabelNode.fontSize = 24;
    self.yLabelNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                           CGRectGetMidY(self.frame) + 40);
    
    [self addChild:self.yLabelNode];
    
}

#pragma mark SKScene

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


#pragma mark UIResponder

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[[ZHAudioController sharedInstance] oscillator] play];
    self.sparkEmitterNode.particleBirthRate = 200;
    [self.sparkEmitterNode resetSimulation];
    CGPoint point = [[touches anyObject] locationInNode:self];
    self.sparkEmitterNode.position = point;
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self convertTouches:touches withEvent:event];
    
    
    CGPoint point = [[touches anyObject] locationInNode:self];
    self.sparkEmitterNode.position = point;
    
    
    
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[[ZHAudioController sharedInstance] oscillator] stop];
    
    CGPoint point = [[touches anyObject] locationInNode:self];
    self.sparkEmitterNode.position = point;
    
    self.sparkEmitterNode.particleBirthRate = 0;
    CGFloat delay = self.sparkEmitterNode.particleLifetime + self.sparkEmitterNode.particleLifetimeRange;
    
    SKAction *waitAction = [SKAction waitForDuration:delay];
    [self.sparkEmitterNode runAction:waitAction completion:^{
        NSLog(@"Remove");
    }];
    
    
}

-(void)convertTouches:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInNode:self];
        CGPoint normPoint = [self normalizePoint:point];
        [[[ZHAudioController sharedInstance] oscillator] setFrequency:normPoint.x * 1000];
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
    normPoint.x = [ZHUtilities mapInValue:point.x inMinimum:0 inMaximum:self.frame.size.width outMinimum:0.0 outMaximum:1.0];
    normPoint.y = [ZHUtilities mapInValue:point.y inMinimum:0 inMaximum:self.frame.size.height outMinimum:0.0 outMaximum:1.0];
        self.xLabelNode.text = [NSString stringWithFormat:@"x: %.2f %.2f",
                                normPoint.x, [ZHAudioController sharedInstance].touchX.currentFrequency];
    
        self.yLabelNode.text = [NSString stringWithFormat:@"y: %.2f %.2f",
                                normPoint.y, [ZHAudioController sharedInstance].touchY.currentFrequency];
    
    
    return normPoint;
}



@end
