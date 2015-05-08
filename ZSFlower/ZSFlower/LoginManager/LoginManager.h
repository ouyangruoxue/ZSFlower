//
//  LoginManager.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject
+(id)shareInstance;
//判断是否手机号
-(BOOL)isMoblieNum:(NSString *)mobileNum;
//判断是否是邮箱账号
-(BOOL)isEmailFormat:(NSString *)emailStr;
//判断是否包含非法字符
-(BOOL)hasCorrectAccountStr:(NSString *)account;
@end
