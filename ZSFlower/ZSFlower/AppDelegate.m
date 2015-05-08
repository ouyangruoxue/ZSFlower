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
@interface AppDelegate ()

@end

@implementation AppDelegate
+ (AppDelegate*)appDelegate {
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController * control  = [[UIViewController alloc] init];
    
        UIViewController * control1  = [[UIViewController alloc] init];
    
        PersonalViewController * control2 = [[PersonalViewController alloc] init];
    
    LoginViewController * viewController = [[LoginViewController alloc] init];
    
    CustomTabBarController *tabBarController = [[CustomTabBarController alloc] init];
    
    tabBarController.viewControllers = @[control,control1,control2,viewController];
    
    CustomNavigationController *rootNaviController = [[CustomNavigationController alloc] initWithRootViewController:tabBarController];
    self.window.rootViewController = rootNaviController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


-(void)tabBarInit{
    
  /*
    UITabBar *tabBar = tabBarViewController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarController提供一个tabBar属性，我们可以透过这个属性取得UITabBar
    并在UITabBar的items属性取得所有的UITabBarItem
    

    tabBarItem1.title = @"Home";
    tabBarItem2.title = @"Maps";
    透过UITabBarItem的title属性,可以设定tab bar item上显示的文字
    

    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"home_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"home.png"]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"maps_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"maps.png"]];
    
    - (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage
    这是UITabBarItem提供的方法，可以设定上面所显示的图片,selectedImage是只目前选择并显示的TabBatItem显示的图片
    unselectedImage则是平常未选中时显示的图片
    

    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    这段代码可以修改UITabBar显示的背景图
    

    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
    这可以设定选中的UITabBarItem后面的图
    

    UIColor *titleHighlightedColor = [UIColor colorWithRed:153/255.0 green:192/255.0 blue:48/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateHighlighted];*/
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
