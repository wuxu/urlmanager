//
//  UMAppDelegate.m
//  Demo
//
//  Created by jiajun on 12/22/12.
//  Copyright (c) 2012 SegmentFault.com. All rights reserved.
//

#import "UMAppDelegate.h"
#import "UMTools.h"
#import "UMDemoSlideNavViewController.h"
#import "UMNavigationController.h"
#import "UMNavigator.h"

@implementation UMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       [[UMNavigator sharedNavigator] setViewControllerName:@"UMDemoViewController"
                                                  forURL:@"um://demo"];
    
    UINavigationController *navA = [[UINavigationController alloc] initWithRootViewControllerURL:
                                    [[NSURL URLWithString:@"um://demo"]
                                     addParams:[NSDictionary dictionaryWithObjectsAndKeys:
                                                @"Demo1", @"title", nil]]];
    
    UINavigationController *navB = [[UINavigationController alloc] initWithRootViewControllerURL:
                                    [[NSURL URLWithString:@"um://demo"]
                                     addParams:[NSDictionary dictionaryWithObjectsAndKeys:
                                                @"Demo2", @"title", nil]]];
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewControllerURL:
                                    [[NSURL URLWithString:@"http://sf.gg"]
                                     addParams:[NSDictionary dictionaryWithObjectsAndKeys:
                                                @"SegmentFault", @"title", nil]]];
    
    self.navigator = [[UMDemoSlideNavViewController alloc] initWithItems:@[@[navA, navB, navC]]];
   
    [[UMNavigator sharedNavigator] setViewController:navA forURL:@"nav://nava"];
    [[UMNavigator sharedNavigator] setViewController:navB forURL:@"nav://navb"];
    [[UMNavigator sharedNavigator] setViewController:navC forURL:@"nav://navc"];
    [[UMNavigator sharedNavigator] setViewController:self.navigator forURL:@"nav://slide"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self.window addSubview:self.navigator.view];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
