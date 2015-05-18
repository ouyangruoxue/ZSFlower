//
//  Utility.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/10.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "PersonalViewController.h"
#import "ShopCartViewController.h"
#import "ClassifyViewController.h"
@interface Utility : NSObject

+ (NSString*)getTabbarIconNameWithCorrespondingViewController:(UIViewController*)viewController ;
+ (NSString*)getTabbarHiIconNameWithCorrespondingViewController:(UIViewController*)viewController;
+ (UIView *)personalButtonImage:(NSString *)imageName buttonName:(NSString *)title target:(id)target action:(SEL)aSelector forControlEvents:(UIControlEvents)aControlEvents;
//地址设置里面编辑删除按钮
+ (UIButton *)rightViewWithimage:(NSString *)imageName andTitle:(NSString *)title target:(id)target action:(SEL)aSelector forControlEvents:(UIControlEvents)aControlEvents;
@end
