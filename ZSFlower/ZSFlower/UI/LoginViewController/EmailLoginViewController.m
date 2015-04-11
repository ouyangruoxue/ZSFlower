//
//  EmailLoginViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "EmailLoginViewController.h"

@implementation EmailLoginViewController

-(void)dealloc{
    
}


-(void)viewDidLoad{
    [super viewDidLoad];
    self.titleText = @"邮箱登录";
    [self.topContainerView addSubview:self.backButton];
}


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
