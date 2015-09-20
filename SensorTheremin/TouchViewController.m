//
//  GameViewController.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/13/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "TouchViewController.h"
#import "TouchScene.h"
#import "MotionMonitor.h"
#import "VWWPermissionKit.h"
//#import "VWWPer

#import "OscillatorInstrument.h"

#import "Utilities.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation TouchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
//    [self permissions];

    [[MotionMonitor sharedInstance] start];
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    TouchScene *scene = [TouchScene unarchiveFromFile:@"TouchScene"];
//    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.scaleMode = SKSceneScaleModeResizeFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)permissions{
    
    VWWCameraPermission *camera = [VWWCameraPermission permissionWithLabelText:@"You can use the camera as an input instrument."];
    VWWPhotosPermission *photos = [VWWPhotosPermission permissionWithLabelText:@"You can also use a picture as a source via touch interace"];
    VWWCoreMotionPermission *motion = [VWWCoreMotionPermission permissionWithLabelText:@"Motion sensors can also be used as an input source"];
    
    NSArray *permissions = @[camera, photos, motion];
    
    [VWWPermissionsManager optionPermissions:permissions
                                       title:@"Welcome to SensorTheremin! Since this is a sensor based theremin, we'll need to access you device's sensors. This guide wiil help you get setup and then you can start annoying your dog."
                          fromViewController:self
                                resultsBlock:^(NSArray *permissions) {
                                    [permissions enumerateObjectsUsingBlock:^(VWWPermission *permission, NSUInteger idx, BOOL *stop) {
                                        NSLog(@"%@ - %@", permission.type, [permission stringForStatus]);
                                    }];
                                }];
}

@end
