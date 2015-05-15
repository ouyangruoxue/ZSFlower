//
//  CustomTabBarController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.

#import "CustomTabBarController.h"
#import "CustomNavigationController.h"
#import "AppDelegate.h"

#define kTagOffsetTabBarItem   50

@interface CustomTabBarController()
{
    UIImageView *visibleTabbar;
    UIView *_popView;
}

@end

@implementation CustomTabBarController
@synthesize isMainTabbar;
@synthesize redpoint;
@synthesize isContainExtraViewController = _isContainExtraViewController;



#pragma mark - memory  management
- (void)dealloc {

  visibleTabbar = nil;
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hidePopView) object:nil];
  [NOTIFICATION_DEFAULT  removeObserver:self];
}


- (UIImage *) createImageWithColor:(UIColor *) color {
    CGRect rect=CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


#pragma mark - init 

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = K_BACKGROUND_COLOR;
    visibleTabbar = [[UIImageView alloc] initWithFrame:self.tabBar.bounds];
    visibleTabbar.backgroundColor = [UIColor clearColor];
    visibleTabbar.userInteractionEnabled = YES;
    UIImage  *tabBG = [PUUtil stretchImage:[UIImage imageNamed:@"tabbar_btn"] capInsets:UIEdgeInsetsMake(24, 32, 24, 32) resizingMode:UIImageResizingModeStretch];
    visibleTabbar.image = tabBG;
    [self.tabBar addSubview:visibleTabbar];
}

- (void)showTabbar:(BOOL)yesOrNO {
    if (yesOrNO) {
        visibleTabbar.backgroundColor = [UIColor clearColor];
        UIImage  *tabBG = [PUUtil stretchImage:[UIImage imageNamed:@"tabbar_btn"] capInsets:UIEdgeInsetsMake(24, 32, 24, 32) resizingMode:UIImageResizingModeStretch];
        visibleTabbar.image = tabBG;
    }else{
        visibleTabbar.backgroundColor = K_BACKGROUND_COLOR;
        visibleTabbar.image = nil;
        [self.tabBar setShadowImage:[self createImageWithColor:K_BACKGROUND_COLOR]];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)layoutVisibleTabbar_containExtraController:(BOOL)yesOrNo {
  _isContainExtraViewController = yesOrNo;  //YES 足球内页，没开始的时候进入，然后比赛开始，直播的tab去掉但是界面还是显示直播页
  
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj isKindOfClass:[UIImageView class]]) {
            [obj removeFromSuperview];
        }
    }];
    
    [visibleTabbar.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger tabNum = (_isContainExtraViewController == YES) ? ([self.viewControllers count]-1):[self.viewControllers count];  ////the last one is extra controller
    int offset = 0;
    int tabbarHeight = self.tabBar.frame.size.height;
    int w = (self.tabBar.frame.size.width)/tabNum;
    for (int i=0; i<tabNum; i++) {
        UIViewController *vcTmp = [self.viewControllers objectAtIndex:i];
        UIViewController  *viewController = vcTmp;
        if ([vcTmp isKindOfClass:[CustomNavigationController class]]) {
            viewController  = [(CustomNavigationController *)vcTmp topViewController];
        }
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(offset, 0, w, tabbarHeight)];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.exclusiveTouch = YES;
        btn.tag = i+kTagOffsetTabBarItem;
        [btn setImage:[UIImage imageNamed:[Utility getTabbarIconNameWithCorrespondingViewController:viewController]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[Utility getTabbarHiIconNameWithCorrespondingViewController:viewController]] forState:UIControlStateSelected];
        UIImage  *tab = [PUUtil stretchImage:[UIImage imageNamed:@"tabbar_btn"] capInsets:UIEdgeInsetsMake(24, 32, 24, 32) resizingMode:UIImageResizingModeStretch];
        UIImage  *tab1 = [PUUtil stretchImage:[UIImage imageNamed:@"tabbar_btn_1"] capInsets:UIEdgeInsetsMake(24, 32, 24, 32) resizingMode:UIImageResizingModeStretch];
        [btn setBackgroundImage:tab forState:UIControlStateNormal];
        [btn setBackgroundImage:tab1 forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            btn.selected = YES;
        }
        [visibleTabbar addSubview:btn];
        
        if (i == tabNum - 1) {
            int w = visibleTabbar.width - offset;
            btn.width = w;
        }
        
        offset += w;
        
    }
    
}



- (void)btnSelected:(UIButton *)btn {
    self.selectedButtonIndex = btn.tag - kTagOffsetTabBarItem;
}

- (void)setSelectedButtonIndex:(NSInteger)selectedButtonIndex{
    _selectedButtonIndex = selectedButtonIndex;
  
  if (!_isContainExtraViewController) {
    if (_selectedButtonIndex >= [[visibleTabbar subviews] count]) {
      return;
    }
  }
  
    UIButton *button = (UIButton *)[visibleTabbar viewWithTag:selectedButtonIndex+kTagOffsetTabBarItem];
    for(UIView *view in [visibleTabbar subviews])
    {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton  *aBtn = (UIButton *)view;
            if (aBtn==button) {
                aBtn.selected = YES;
            }
            else{
                aBtn.selected = NO;
            }
        }
    }
    self.selectedIndex = _selectedButtonIndex;
    self.selectedViewController = [self.viewControllers objectAtIndex:_selectedButtonIndex];
    if ([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
        [self.delegate tabBarController:self didSelectViewController:self.selectedViewController];
    }
    
}

// 预留为了选中
- (void)setTab {
    
}


#pragma mark - Private Method
- (void)showRedPoint {
    self.redpoint.hidden = NO;
}

- (void)hideRedPoint {
    self.redpoint.hidden = YES;
}

- (void)showPopView:(NSUInteger)aNum {
    
    _popView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - 49, SCREEN_WIDTH, 49)];
    _popView.hidden = NO;
    _popView.backgroundColor = [UIColor colorWithWhite:0 alpha:.8];
    [self.view insertSubview:_popView belowSubview:self.tabBar];
    
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guess_gold+"]];
    [_popView addSubview:icon];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.text = [NSString stringWithFormat:@" + %lu",(unsigned long)aNum];
    [label sizeToFit];
    icon.left = (_popView.width - icon.width - label.width)/2;
    icon.centerY = _popView.height/2;
    label.left = icon.right;
    label.centerY = _popView.height/2;
    [_popView addSubview:label];

    [UIView animateWithDuration:.5 animations:^{
        _popView.top -= _popView.height;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(hidePopView) withObject:nil afterDelay:3.0f];
    }];
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    if (_popView) {
      [self hidePopView];
    }
  });
}

- (void)hidePopView {
    [UIView animateWithDuration:.5 animations:^{
        _popView.top += _popView.height;
    } completion:^(BOOL finished) {
        [_popView removeFromSuperview];
        _popView = nil;
    }];
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    if (_popView) {
      [_popView removeFromSuperview];
      _popView = nil;
    }
  });
}

- (void)handlePushDataNotification:(NSNotification*)aNotification {
    if (!self.isMainTabbar) {
        NSInteger coinNum = 0;
        NSInteger boxNum = 0;
        NSString *lid = nil;
        NSString *gid = nil;
        NSString *roomId = nil;
        NSDictionary *info = [aNotification object];
        NSString *content = [info stringValueForKey:@"content"];
        NSArray *subStrs = [content componentsSeparatedByString:@"&"];
        for (NSString *str in subStrs) {
            if ([str hasPrefix:@"coins="] && [str length] > 6) {
                NSString *value = [str substringFromIndex:6];
                coinNum = [value intValue];
            } else if ([str hasPrefix:@"box="] && [str length] > 4) {
                NSString *value = [str substringFromIndex:4];
                boxNum = [value intValue];
                DLog(@"%ld",(long)boxNum);
            } else if ([str hasPrefix:@"gid="] && [str length] > 4) {
                gid = [str substringFromIndex:4];
            } else if ([str hasPrefix:@"lid="] && [str length] > 4) {
                lid = [str substringFromIndex:4];
            } else if ([str hasPrefix:@"roomid="] && [str length] > 7) {
               roomId = [str substringFromIndex:7];
            }
        }
        
        for (UIViewController *viewController in self.viewControllers) {
            UIViewController  *vc = viewController;
            if ([vc isKindOfClass:[CustomNavigationController class]]) {
                vc  = [[(CustomNavigationController *)vc viewControllers] objectAtIndex:0];
            }
        }
      
      
    }
}

#pragma mark -
#pragma mark
- (void)showInitTabbar{
    int height = self.tabBar.frame.size.height;
    int width = (self.tabBar.frame.size.width)/5;
    NSArray *nameArray = @[@"tab_live_1",@"tab_statistics",@"tab_guess",@"tab_gift_rank",@"tab_chat"];
    for (int i = 0 ; i < 5; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        [button setImage:[UIImage imageNamed:nameArray[i]] forState:UIControlStateNormal];
        UIImage  *tab = [PUUtil stretchImage:[UIImage imageNamed:@"tabbar_btn"] capInsets:UIEdgeInsetsMake(24, 32, 24, 32) resizingMode:UIImageResizingModeStretch];
        UIImage  *tab1 = [PUUtil stretchImage:[UIImage imageNamed:@"tabbar_btn_1"] capInsets:UIEdgeInsetsMake(24, 32, 24, 32) resizingMode:UIImageResizingModeStretch];
        if (i == 0) {
            [button setBackgroundImage:tab1 forState:UIControlStateNormal];
        }else{
            [button setBackgroundImage:tab forState:UIControlStateNormal];
        }

        [visibleTabbar addSubview:button];
    }
}

- (void)hideInitTabbar{
    for (UIView *subView in visibleTabbar.subviews) {
        [subView removeFromSuperview];
    }
}

@end
