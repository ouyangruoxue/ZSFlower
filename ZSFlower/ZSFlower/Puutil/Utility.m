//
//  Utility.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/10.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "Utility.h"
@implementation Utility
+ (NSString*)getTabbarIconNameWithCorrespondingViewController:(UIViewController*)viewController {
    NSString *name = nil;
    
    if ([viewController isKindOfClass:[HomeViewController class]]) { //首页
        name = @"index-white";
    }else if ([viewController isKindOfClass:[ClassifyViewController class]]) { //分类
        name = @"classify-white";
    }else if ([viewController isKindOfClass:[DiscoverViewController class]]) {  //发现
        name = @"find-white";
    }else if ([viewController isKindOfClass:[ShopCartViewController class]]) { //购物车
        name = @"shoppingcar-white";
    }else if ([viewController isKindOfClass:[PersonalViewController class]] ) { //我的
        name = @"us-white";
    }
    return name;
}

+ (NSString*)getTabbarHiIconNameWithCorrespondingViewController:(UIViewController*)viewController {
    NSString *name = nil;
    if ([viewController isKindOfClass:[HomeViewController class]]) { //首页
        name = @"index_green";
    }else if ([viewController isKindOfClass:[ClassifyViewController class]]) { //分类
        name = @"classify_green";
    }else if ([viewController isKindOfClass:[DiscoverViewController class]]) {  //发现
        name = @"find_green";
    }else if ([viewController isKindOfClass:[ShopCartViewController class]]) { //购物车
        name = @"shoppingcar-green";
    }else if ([viewController isKindOfClass:[PersonalViewController class]] ) { //我的
        name = @"us-green";
    }
    
    return name;
}

+ (UIView *)personalButtonImage:(NSString *)imageName buttonName:(NSString *)title target:(id)target action:(SEL)aSelector forControlEvents:(UIControlEvents)aControlEvents{
    UIImage  *img = IMGNAMED(imageName);
    UIView * theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/5, 64)];
    theView.backgroundColor = [UIColor clearColor];
    theView.userInteractionEnabled = YES;
    
    //NSUInteger btnWidth = theView.width >= 60 ? theView.width : 60;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, theView.width, 40);
    [btn setImage:img forState:UIControlStateNormal];
    btn.centerY = 20;
    [btn addTarget:target action:aSelector forControlEvents:aControlEvents];
    
    UILabel *lightLbl = [[UILabel alloc]init];
    lightLbl.textColor = [PUUtil getColorByHexadecimalColor:@"666666"];
    lightLbl.font = [UIFont boldSystemFontOfSize:kFont_Size_6];
    lightLbl.backgroundColor = [UIColor clearColor];
    lightLbl.text = title;
    [lightLbl sizeToFit];
    
    lightLbl.centerX = btn.centerX;
    lightLbl.top = btn.bottom;
    [theView addSubview:btn];
    [theView addSubview:lightLbl];
    return theView;
}

+ (UIButton *)rightViewWithimage:(NSString *)imageName andTitle:(NSString *)title target:(id)target action:(SEL)aSelector forControlEvents:(UIControlEvents)aControlEvents {
    UIImage  *img = IMGNAMED(imageName);
    UIView * theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, img.size.height)];
    theView.backgroundColor = [UIColor clearColor];
    theView.userInteractionEnabled = NO;
    int xOffset = 0;
    int centerY = theView.height/2;
    
    
    UIImageView *img1 = [[UIImageView alloc]initWithImage:IMGNAMED(imageName)];
    [theView addSubview:img1];
    img1.left = xOffset ;
    img1.centerY = centerY;
    
    
    UILabel *lightLbl = [[UILabel alloc]init];
    lightLbl.textColor = kApp_Corlor_8;
    lightLbl.font = [UIFont boldSystemFontOfSize:kFont_Size_5];
    lightLbl.backgroundColor = [UIColor clearColor];
    lightLbl.text = title;
    [lightLbl sizeToFit];
    
    lightLbl.left = img1.right+5;
    lightLbl.centerY = centerY;
    
    [theView addSubview:lightLbl];
    theView.width = lightLbl.right;
    
    
    NSUInteger btnWidth = theView.width >= 60 ? 60 : theView.width;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, btnWidth, theView.height);
    [btn addSubview:theView];
    theView.center = btn.center;
    [btn addTarget:target action:aSelector forControlEvents:aControlEvents];
    return btn;
}

+ (BOOL)point:(CGPoint)pt inRect:(CGRect)rect {
    return (pt.x >= rect.origin.x
            && pt.x <= rect.origin.x + rect.size.width
            && pt.y >= rect.origin.y
            && pt.y <= rect.origin.y + rect.size.height);
}

@end
