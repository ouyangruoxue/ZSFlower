//
//  PUUtil.h
//  PUDemo
//
//  Created by JK.PENG on 13-11-1.
//  Copyright (c) 2013年 njut. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TextAlignTypeLeft     = 0,       //文本左对齐
    TextAlignTypeCenter   = 1,       //文本中间对齐
    TextAlignTypeRight    = 2,       //文本右对齐
}TextAlignTypeE;


typedef enum {
    Kappstore = 0,
    Kweiphone,
    Ktongbu,
    Kppzhushou,
    Kkuaiyong,
    Kitools,
    Kothers,
    K91store
}ChanelType;

@interface PUUtil : NSObject

#pragma mark - 文本对齐方式
+ (NSInteger)getTextAlign:(TextAlignTypeE)alignType;

#pragma mark - 获取Dictionary中的元素
+ (id)getElementForKey:(id)key fromDict:(NSDictionary *)dict;
+ (id)getElementForKey:(id)key fromDict:(NSDictionary *)dict forClass:(Class)forClass;

+ (NSString *)getStringElementForKey:(id)key fromDict:(NSDictionary *)dict;
+ (NSInteger)getIntElementForKey:(id)key fromDict:(NSDictionary *)dict;
+ (CGFloat)getFloatElementForKey:(id)key fromDict:(NSDictionary *)dict;
+ (BOOL)getBoolElementForKey:(id)key fromDict:(NSDictionary *)dict;

#pragma mark - 根据16进制获取UIColor
+ (UIColor *)getColorByHexadecimalColor:(NSString *)hexColor;

#pragma mark - UTF8 Encode
+ (NSString *)encodeUTF8Str:(NSString *)encodeStr;

#pragma mark - JSON Convert
+ (NSDictionary *)convertJSONToDict:(NSString *)string;
+ (NSArray *)convertJSONToArray:(NSString *)string;
+ (BOOL)isSuccessWithReponseDic:(NSDictionary *)responseDic;

/*
 *  Dictionary or Array转换成JSON
 */
+ (NSString *)convertObjectToJSON:(id)object;

#pragma mark - String Utility
+ (NSString *)stringWithSourceString:(NSString *)aString;
+ (BOOL)stringIsNullAndEmpty:(NSString *)aString;

+ (NSString *)stringDecimalStyleFromNumber:(NSInteger)number;




#pragma mark - NSArray Utility
+ (BOOL)arrayIsNullAndEmpty:(NSArray *)array;

#pragma mark - NSDictionary Utility
+ (BOOL)dictionaryIsNullAndEmpty:(NSDictionary *)dic;


#pragma mark - Image Resize
+ (UIImage*)image:(UIImage*)image fitInSize:(CGSize)size;
+ (UIImage*)image:(UIImage*)image centerInSize:(CGSize)size;
+ (UIImage*)image:(UIImage*)image fillInSize:(CGSize)size;
+ (UIImage*)image:(UIImage*)image fitToWidth:(CGFloat)width;
+ (UIImage*)image:(UIImage*)image fitToHeight:(CGFloat)height;

//图片叠加
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 atPosition:(CGRect)frame;
//压缩图片
+ (UIImage *)scaleFromImage: (UIImage *) image toSize: (CGSize) size;

//等比率缩放
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize;

+ (UIImage *)stretchImage:(UIImage *)image
                capInsets:(UIEdgeInsets)capInsets
             resizingMode:(UIImageResizingMode)resizingMode;

+(NSString *)getChanelWithChanelType:(ChanelType)type;

/*** 适配API ***/
+ (CGFloat)adapterOriginX:(CGFloat)x withWidth:(CGFloat)width;//根据标准320，计算大屏(375,414)对应的比例
+ (CGFloat)adapterOriginXwithWidth:(CGFloat)width;//居中时,adapterOriginX:方法就不适用了，需要根据本身宽度重新计算
+ (CGSize )getAutoSize:(CGSize )size;
+ (CGRect )getAutoRect:(CGRect )rect;

+ (BOOL)isImageLink:(NSString *)urlStr;
+ (void)getIPAddress;

//
+ (void)change:(UIView*)view originY:(CGFloat)originY;
+ (void)change:(UIView *)view height:(CGFloat)height;
+ (void)change:(UIView *)view originX:(CGFloat)originX;
+ (void)change:(UIView *)view width:(CGFloat)width;
+ (void)change:(UIScrollView *)scrollView insets:(UIEdgeInsets)insets;

//capture
+ (UIImage *)capture:(UIView*)view;

//isEmpty
+ (BOOL)isEmpty:(id)object;
+ (UIInterfaceOrientation)currentOrientation;
@end


@interface NSString (PUUtil)
- (BOOL)isLessToString:(NSString *)aString;
@end