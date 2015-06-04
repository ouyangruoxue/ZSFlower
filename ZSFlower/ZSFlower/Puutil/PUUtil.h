//
//  PUUtil.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/5.
//

#import <Foundation/Foundation.h>

typedef enum {
    TextAlignTypeLeft     = 0,       //文本左对齐
    TextAlignTypeCenter   = 1,       //文本中间对齐
    TextAlignTypeRight    = 2,       //文本右对齐
}TextAlignTypeE;


typedef enum {
    Kmobile = 0,
    Kemail,
    KuserName
}accountType;


typedef enum {
    KwaitingForPay = 0,//待付款
    KwaitingForSend,//待发货
    KwaitingForTake,//待收货
    KwaitingForAppraise,//待评价
    korderCacel,//取消订单
    kordercompleteAppraise//订单完成
}orderType;

typedef enum {
    Kdefault = 0,//默认
    kcutPrice,//降价优先
    Kpromotion,//促销优先
    Ksceening//筛选
}myAttentionType;

typedef enum {
    serviceRebund = 0,//
    serviceRebunding,//进行中
    serviceRebundDisabled//售后结束
}serviceRebundType;


typedef enum {
    articleMatching = 0,//商品描述相符
    sellersAttitude,//卖家服务态度
    logisticSpeed,//物流速度
    courierAttitude,//配送人员态度
    articleAppraise //商品评价
}markingType;


@interface PUUtil : NSObject
//判断是否手机号
+(BOOL)isMoblieNum:(NSString *)mobileNum;
//判断是否是邮箱账号
+(BOOL)isEmailFormat:(NSString *)emailStr;
//判断是否包含非法字符
+(BOOL)hasCorrectAccountStr:(NSString *)account;
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
