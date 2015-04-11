//
//  UserNameLoginViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "UserNameLoginViewController.h"

@implementation UserNameLoginViewController
-(void)dealloc{
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.titleText = @"用户名登录";
    [self.topContainerView addSubview:self.backButton];
}


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
