//
//  MobileViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MobileLoginViewController.h"

@implementation MobileLoginViewController
-(void)dealloc{
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.titleText = @"手机号登录";
    [self.topContainerView addSubview:self.backButton];
}



-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
