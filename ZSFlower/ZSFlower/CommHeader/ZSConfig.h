//
//  ZSConfig.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#ifndef ZSFlower_ZSConfig_h
#define ZSFlower_ZSConfig_h



#pragma mark -
/*
 *ios版本判断
 */
#define IOS5_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS6_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )

#define kVersion_4_9_0_OR_LATER  ( [[Utility version] compare:@"4.9.0"] != NSOrderedAscending )


#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define iPhone5     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define APP_NAME            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_SUB_VERSION     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]


#pragma mark -


#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define DEVICE_MODEL [[UIDevice currentDevice] model]
#define IS_IPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define kScreenWidthScaleSize (SCREEN_WIDTH/320)
#define kScreenWidthScaleSizeByIphone6 (SCREEN_WIDTH/375)

#define SCREEN_WIDTH          ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT         ([UIScreen mainScreen].bounds.size.height)
#define KTABBARHEIGHT           49.0


#define USER_DEFAULT          [NSUserDefaults standardUserDefaults]

#pragma mark -
//图片资源获取
#define IMGFROMBUNDLE( X )	 [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@""]]
#define IMGNAMED( X )	     [UIImage imageNamed:X]

#ifdef DEBUG
#define DBLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DBLog(xx, ...)  ((void)0)
#endif

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define FONT_TITLE(X)     [UIFont systemFontOfSize:X]
#define BOLDFONT_TITLE(X)     [UIFont boldSystemFontOfSize:X]

#define KEY_WINDOW  [[UIApplication sharedApplication]keyWindow]
#define K_BACKGROUND_COLOR [PUUtil getColorByHexadecimalColor:@"fafafa"]

//定义色色常量
#define kApp_Corlor_1      [PUUtil getColorByHexadecimalColor:@"ffffff"]
#define kApp_Corlor_2      [PUUtil getColorByHexadecimalColor:@"000000"]
#define kApp_Corlor_3      [PUUtil getColorByHexadecimalColor:@"ff0000"]
#define kApp_Corlor_4      [PUUtil getColorByHexadecimalColor:@"dedede"]
#define kApp_Corlor_5      [PUUtil getColorByHexadecimalColor:@"516491"]
#define kApp_Corlor_6      [PUUtil getColorByHexadecimalColor:@"444444"]
#define kApp_Corlor_7      [PUUtil getColorByHexadecimalColor:@"354149"]
#define kApp_Corlor_8      [PUUtil getColorByHexadecimalColor:@"808080"]
#define kApp_Corlor_9      [PUUtil getColorByHexadecimalColor:@"2c2d2c"]
#define kApp_Corlor_10     [PUUtil getColorByHexadecimalColor:@"f9ff50"]
#define kApp_Corlor_11     [PUUtil getColorByHexadecimalColor:@"ba0000"]

//定义字号
#define kFont_Size_1  18
#define kFont_Size_2  16
#define kFont_Size_3  15
#define kFont_Size_4  13
#define kFont_Size_5  12
#define kFont_Size_6  11
#define kFont_Size_7  10
#define kFont_Size_14 14
#define kFont_Size_21 21

#define NOTIFICATION_DEFAULT     [NSNotificationCenter defaultCenter]

#endif
