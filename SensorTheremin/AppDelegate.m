//
//  AppDelegate.m
//  SensorTheremin
//
//  Created by Zakk Hoyt on 9/15/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+ZH.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupAppearance];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)setupAppearance{
    
    
    // UIView (this is what controls the color of the back button arrow)
    [[UIView appearance] setTintColor:[UIColor sensorThereminTintColor]];
    [[UIView appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor sensorThereminBackgroundColor]];
    
    // Navigation bar
    NSDictionary *navBarAttributes = @{NSForegroundColorAttributeName : [UIColor sensorThereminBackgroundColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:navBarAttributes];
    [[UINavigationBar appearance] setBarTintColor:[UIColor sensorThereminTintColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor sensorThereminBackgroundColor]];
    // The nav bar back button
    [[UIBarButtonItem appearance] setTitleTextAttributes:navBarAttributes forState:UIControlStateNormal];
    
    // Tabbar
    [[UITabBar appearance] setBarTintColor:[UIColor sensorThereminBackgroundColor]];
    [[UITabBar appearance] setTintColor:[UIColor sensorThereminTintColor]];
    
    // TabbarItem
    NSDictionary *tabBarAttributes = @{NSForegroundColorAttributeName : [UIColor sensorThereminTintColor]};
    [[UITabBarItem appearance] setTitleTextAttributes:tabBarAttributes forState:UIControlStateNormal];
    
    // Segmented control
    NSDictionary *segmentAttributes = @{NSForegroundColorAttributeName : [UIColor sensorThereminTintColor],
                                        NSStrokeColorAttributeName : [UIColor sensorThereminBackgroundColor]};
    [[UISegmentedControl appearance] setTitleTextAttributes:segmentAttributes forState:UIControlStateNormal];
    
    // Toolbar
    [[UIToolbar appearance] setBarTintColor:[UIColor sensorThereminBackgroundColor]];
    [[UIToolbar appearance] setTintColor:[UIColor sensorThereminTintColor]];
    
    // Text controls
    [[UITextView appearance] setTextColor:[UIColor sensorThereminDarkTextColor]];
    [[UITextField appearance] setTextColor:[UIColor sensorThereminDarkTextColor]];
    
    [[UITableView appearance] setBackgroundColor:[UIColor sensorThereminBackgroundColor]];
    [[UITableViewCell appearance] setBackgroundColor:[UIColor sensorThereminBackgroundColor]];
    
    [[UICollectionView appearance] setBackgroundColor:[UIColor sensorThereminBackgroundColor]];
    [[UICollectionViewCell appearance]setBackgroundColor:[UIColor sensorThereminBackgroundColor]];
    
    [[UIButton appearance]setTintColor:[UIColor sensorThereminTintColor]];
    
}
@end
