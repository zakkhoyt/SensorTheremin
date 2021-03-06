//
//  GameViewController.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/13/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHTouchViewController.h"
#import "ZHTouchScene.h"
#import "ZHMotionMonitor.h"
//#import "VWWPermissionKit.h"
#import <SpriteKit/SpriteKit.h>
#import "SKScene+Unarchive.h"
#import "ZHAudioController.h"


//#import "VWWPer

//#import "OscillatorInstrument.h"

#import "ZHUtilities.h"


@implementation ZHTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self setupPermissions];
    
    [self setupSpriteKitScene];
    
    [self addGestureRecognizers];
    [self setupMotionCapture];
    
    [ZHAudioController sharedInstance];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (BOOL)shouldAutorotate {
    return NO;
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

#pragma mark Private methods

-(void)setupSpriteKitScene{
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    ZHTouchScene *scene = [ZHTouchScene unarchiveFromFile:@"ZHTouchScene"];
    scene.scaleMode = SKSceneScaleModeResizeFill;
    [skView presentScene:scene];

}


-(void)setupMotionCapture{
    [[ZHMotionMonitor sharedInstance] start];
}


-(void)addGestureRecognizers{
    UITapGestureRecognizer *quadTapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quadTap:)];
    quadTapRecognizer.numberOfTouchesRequired = 4;
    [self.view addGestureRecognizer:quadTapRecognizer];
}



//-(void)setupPermissions{
//    
//    VWWCameraPermission *camera = [VWWCameraPermission permissionWithLabelText:@"You can use the camera as an input instrument."];
//    VWWPhotosPermission *photos = [VWWPhotosPermission permissionWithLabelText:@"You can also use a picture as a source via touch interace"];
//    VWWCoreMotionPermission *motion = [VWWCoreMotionPermission permissionWithLabelText:@"Motion sensors can also be used as an input source"];
//    
//    NSArray *permissions = @[camera, photos, motion];
//    
//    [VWWPermissionsManager optionPermissions:permissions
//                                       title:@"Welcome to SensorTheremin! Since this is a sensor based theremin, we'll need to access you device's sensors. This guide wiil help you get setup and then you can start annoying your dog."
//                          fromViewController:self
//                                resultsBlock:^(NSArray *permissions) {
//                                    [permissions enumerateObjectsUsingBlock:^(VWWPermission *permission, NSUInteger idx, BOOL *stop) {
//                                        NSLog(@"%@ - %@", permission.type, [permission stringForStatus]);
//                                    }];
//                                }];
//}

#pragma mark IBActions
-(void)quadTap:(UITapGestureRecognizer*)sender{
    
}

- (IBAction)settingsButtonTouchUpInside:(UIButton*)sender {
    [self performSegueWithIdentifier:@"SegueTouchToSettings" sender:nil];
}

@end
