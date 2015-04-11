//
//  BaseViewController.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//
#import <UIKit/UIKit.h>

#define kColorForTitleLabel     [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
#define kSizeFontForTitleLabel  [UIFont boldSystemFontOfSize:20]

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UIView      *topContainerView;

@property (nonatomic, strong) UIView      *containerView;//视图容器
@property (nonatomic, strong) UIColor     *titleColor;//设置titleColor

@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) NSString    *titleText;//设置title
@property (nonatomic, strong) UIImageView *logo;//赞助商商标

/*
 * Should be reseted by subclass if subclass wants to implement custom back button item
 *eg: [self.topContainerView addSubview:self.backButton];
 */
@property (nonatomic, strong) UIButton  *backButton;

/*
 * Should be reseted by subclass if subclass wants to implement custom back button item
 *eg1: self.rightBarButtonTitle = @"XXXXXXX";
 *eg2: self.rightButton.frame   = CGRect;
 */
@property (nonatomic, strong) UIButton         *rightButton;
@property (nonatomic, strong) NSString         *rightBarButtonTitle;



//返回，如果子类返回时，需要作特殊的操作，需要重写该方法
- (void)back;
- (void)rightBarBtnClickAction;
//=<end
@end
