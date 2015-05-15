//
//  AppDelegate.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"
#import "CustomTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) CustomNavigationController *rootNaviController;
+ (AppDelegate*)appDelegate;
@end

