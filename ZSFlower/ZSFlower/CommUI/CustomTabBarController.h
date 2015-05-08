//
//  CustomTabBarController.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.

#import <UIKit/UIKit.h>

@interface CustomTabBarController : UITabBarController

@property (nonatomic, assign) BOOL        isMainTabbar;
@property (nonatomic, strong) UIImageView *redpoint;
@property (nonatomic, assign) NSInteger   selectedButtonIndex;
@property (nonatomic, assign) BOOL        isContainExtraViewController;

- (void)layoutVisibleTabbar_containExtraController:(BOOL)yesOrNo;
- (void)setTab;
- (void)hideRedPoint;
- (void)showRedPoint;
- (void)showTabbar:(BOOL)yesOrNO;

- (void)showInitTabbar;
- (void)hideInitTabbar;

@end
