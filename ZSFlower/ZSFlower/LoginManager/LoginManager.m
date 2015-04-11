//
//  LoginManager.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "LoginManager.h"
#import "RegexKitLite.h"
@interface LoginManager()

@end
@implementation LoginManager


-(BOOL)isMoblieNum:(NSString *)mobileNum{
    
    NSString * MOBILE = @"^[1][1-9][0-9]{9}$";
    
    //    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    //    //移动
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    //    //联通
    //    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    //    //电信
    //    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    //
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if ([mobileNum isMatchedByRegex:MOBILE]&&mobileNum.length == 11){
        return YES;
    }else{
        return NO;
    }
}


-(BOOL)isEmailFormat:(NSString *)emailStr{
    
    NSString *regex = @"^\\w+((\\-\\w+)|(\\.\\w+))*@[A-Za-z0-9]+((\\.|\\-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
    
    if ([emailStr isMatchedByRegex:regex]){
        return YES;
    }else{
        return NO;
    }
}

@end
