//
//  NSString+Utility.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (Utility)

//判断TextField等控件输入字符串是否为空——空指针或者空字符
+ (BOOL)isBlankString:(NSString *)string;

//汉字转字母
+ (NSString *)phonetic:(NSString *)sourceString;
//是否与searchT相等
- (BOOL)searchResult:(NSString *)searchStr;
+ (BOOL)isBlankStringButCanHaveSpace:(NSString *)string;

+ (CGSize) sizeForString:(NSString *)value
                    font:(UIFont *)font
           textAlignment:(NSTextAlignment)alignment
                andWidth:(float)width
           lineBreakMode:(NSInteger)lineMode;

//AES加密
+ (NSString *)stringtoAES:(NSString *)originalString;

//AES解密
+ (NSString *)AEStoString:(NSString *)AESString;

+ (NSString *)convertIntToTimeString:(NSString *)timeString;

+ (NSString *)stringSqlEscape:(NSString *)str;

+ (NSString *)jidWithDomain:(NSString *)jidString;

+ (NSString *)jidWithNoResource:(NSString *)jidString;

+ (NSString *)jidWithNoDomain:(NSString *)jidString;

+ (NSString *)jidGetResource:(NSString *)jidString;

//生成随机字符串
+ (NSString *)createRandomString;

//截取文件名、文件格式
+ (NSString *)getFileNameFromPath:(NSString *)filePath;
+ (NSString *)getFileTypeFromPath:(NSString *)filePath;

//Chat Method
- (NSString *)trimWhitespace;
- (NSUInteger)numberOfLines;

@end
