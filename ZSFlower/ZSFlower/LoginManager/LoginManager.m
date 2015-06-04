//
//  LoginManager.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "LoginManager.h"
#import "RegexKitLite.h"

static LoginManager *_instance = nil;
@interface LoginManager()

@end
@implementation LoginManager
+(id)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LoginManager alloc] init];
    });
    
    return _instance;

}


@end
