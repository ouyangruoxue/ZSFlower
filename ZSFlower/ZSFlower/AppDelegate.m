//
//  AppDelegate.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "CustomNavigationController.h"
#import "CustomTabBarController.h"
#import "PersonalViewController.h"
#import "HomeViewController.h"
#import "ClassifyViewController.h"
#import "DiscoverViewController.h"
#import "ShopCartViewController.h"
#import "PersonalViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
+ (AppDelegate*)appDelegate {
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    HomeViewController * homeVc  = [[HomeViewController alloc] init];
    
    ClassifyViewController * classifyVc  = [[ClassifyViewController alloc] init];
    
    DiscoverViewController * discoerVc = [[DiscoverViewController alloc] init];
    
    ShopCartViewController * shopCartVc = [[ShopCartViewController alloc] initISFromTabbar:YES];
    
    PersonalViewController *personalVc = [[PersonalViewController alloc] init];
    
    CustomTabBarController *tabBarController = [[CustomTabBarController alloc] init];
    
    tabBarController.viewControllers = @[homeVc,classifyVc,discoerVc,shopCartVc,personalVc];
    [tabBarController layoutVisibleTabbar_containExtraController:NO];
    tabBarController.selectedButtonIndex = 0;
    [tabBarController setTab];
    
    _rootNaviController = [[CustomNavigationController alloc] initWithRootViewController:tabBarController];
    self.window.rootViewController = _rootNaviController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    
    return YES;
}// Will be deprecated at some point, please replace with application:openURL:sourceApplication:annotation:
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
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

@end
