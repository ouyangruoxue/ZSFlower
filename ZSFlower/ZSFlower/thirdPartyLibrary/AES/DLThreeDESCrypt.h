//
//  DLThreeDESCrypt.h
//  DLAppStore
//
//  Created by fang chengxiang on 14-4-2.
//  Copyright (c) 2014年 Archermind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLThreeDESCrypt : NSObject

+ (NSString*)encrypt:(NSString*)plainText withKey:(NSString*)key;
+ (NSString*)decrypt:(NSString*)encryptText withKey:(NSString*)key;

+ (NSString*)encrypt:(NSString *)plainText;
+ (NSString*)decrypt:(NSString *)encryptText;

@end
