//
//  GameScene.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/13/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "TouchScene.h"
#import "Utilities.h"
//#import "AudioController.h"
#import "AKFoundation.h"


@interface TouchScene (){
    IBOutlet UIView *fmSynthesizerTouchView;
    IBOutlet UIView *tambourineTouchView;
    
    AKTambourineInstrument *tambourine;
//    FMSynthesizer *fmSynthesizer;
}
@property (nonatomic, strong) SKLabelNode *xLabelNode;
@property (nonatomic, strong) SKLabelNode *yLabelNode;
@property (nonatomic, strong) SKSpriteNode *touchXSprite;
@property (nonatomic, strong) SKSpriteNode *touchYSprite;
@property (nonatomic, strong) SKEmitterNode *sparkEmitterNode;
@end

@implementation TouchScene

-(void)didMoveToView:(SKView *)view {
    
    [self setupEmitter];
    [self setupLabels];
    [self setupInstruments];
    
}

-(void)setupInstruments{
    
    
//    [AudioController sharedInstance];
    
    tambourine = [[AKTambourineInstrument alloc] init];
    [AKOrchestra addInstrument:tambourine];
    
    AKAmplifier *amp = [[AKAmplifier alloc] initWithInput:tambourine.output];
    [AKOrchestra addInstrument:amp];
    [amp start];
}

-(void)setupEmitter{
    NSString *messagePath = [[NSBundle mainBundle] pathForResource:@"SparkEmitter" ofType:@"sks"];
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
    
//    [[[AudioController sharedInstance] oscillator] play];
//    [[[AudioController sharedInstance] tambourine] play];
    self.sparkEmitterNode.particleBirthRate = 200;
    [self.sparkEmitterNode resetSimulation];
    CGPoint point = [[touches anyObject] locationInNode:self];
    self.sparkEmitterNode.position = point;
    
    

    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInNode:self];
    [self tapTambourineAtPoint:p];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self convertTouches:touches withEvent:event];
    

    CGPoint point = [[touches anyObject] locationInNode:self];
    self.sparkEmitterNode.position = point;
    
    

    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [[[AudioController sharedInstance] oscillator] stop];
//    [[[AudioController sharedInstance] tambourine] stop];
    
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
//        [[[AudioController sharedInstance] oscillator] setFrequency:normPoint.x * 1000];
//        [[[AudioController sharedInstance] oscillator] setCarrier:normPoint.y];
        
        
        AKTambourineNote *note = [[AKTambourineNote alloc] initWithIntensity:128
                                                               dampingFactor:normPoint.x / self.view.bounds.size.width];
//        [[[AudioController sharedInstance] tambourine] playNote:note];

        
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
//    self.xLabelNode.text = [NSString stringWithFormat:@"x: %.2f %.2f",
//                            normPoint.x, [AudioController sharedInstance].touchX.currentFrequency];
//
//    self.yLabelNode.text = [NSString stringWithFormat:@"y: %.2f %.2f",
//                            normPoint.y, [AudioController sharedInstance].touchY.currentFrequency];


    return normPoint;
}

//-(void)addSpriteForTouch:(UITouch*)touch{
//    
//    
//    
//    
//    CGPoint location = [touch locationInNode:self];
//    
//    self.touchXSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//    self.touchXSprite.xScale = 0.5;
//    self.touchXSprite.yScale = 0.5;
//    self.touchXSprite.position = location;
//    
//    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//    
//    [self.touchXSprite runAction:[SKAction repeatActionForever:action]];
//    
//    [self addChild:self.touchXSprite];
//
//}


-(void)tapTambourineAtPoint:(CGPoint)touchPoint{
//    CGPoint touchPoint = [sender locationInView:tambourineTouchView];
    float scaledX = touchPoint.x / self.view.bounds.size.width;
    float scaledY = 1.0 - touchPoint.y / self.view.bounds.size.height;
    
    float intensity = scaledY*4000 + 20;
    float dampingFactor = scaledX / 2.0;
    AKTambourineNote *note = [[AKTambourineNote alloc] initWithIntensity:intensity
                                                           dampingFactor:dampingFactor];
    [tambourine playNote:note];

}



@end
