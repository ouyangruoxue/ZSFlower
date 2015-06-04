//
//  PUUtil.m
//  PUDemo
//
//  Created by JK.PENG on 13-11-1.
//  Copyright (c) 2013年 njut. All rights reserved.
//

#import "PUUtil.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#import "RegexKitLite.h"


@implementation PUUtil

#pragma mark 账号判断

+(BOOL)isMoblieNum:(NSString *)account{
    
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
    
    if ([account isMatchedByRegex:MOBILE]&&account.length == 11){
        return YES;
    }else{
        return NO;
    }
}


+(BOOL)isEmailFormat:(NSString *)account{
    
    NSString *regex = @"^\\w+((\\-\\w+)|(\\.\\w+))*@[A-Za-z0-9]+((\\.|\\-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
    
    if ([account isMatchedByRegex:regex]){
        return YES;
    }else{
        return NO;
    }
}


+(BOOL)hasCorrectAccountStr:(NSString *)account{
    
    NSString *regex = @"^[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    if ([account isMatchedByRegex:regex]){
        return YES;
    }else{
        return NO;
    }
}



+ (NSInteger)getTextAlign:(TextAlignTypeE)alignType {
    NSInteger alignment = NSTextAlignmentLeft;
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVer < 6.0) {
      
      //in pch file has redifine TextAlignment
        switch (alignType){
            case TextAlignTypeLeft:{
                alignment = NSTextAlignmentLeft;
            }
              break;
            case TextAlignTypeCenter:{
                alignment = NSTextAlignmentCenter;
            }
              break;
            case TextAlignTypeRight:{
                alignment = NSTextAlignmentRight;
            }
            break;
              default:{
                alignment = NSTextAlignmentLeft;
            }
              break;
        }

    }else{
        switch (alignType){
            case TextAlignTypeLeft:{
                alignment = NSTextAlignmentLeft;
            }
              break;
            case TextAlignTypeCenter:{
                alignment = NSTextAlignmentCenter;
            }
              break;
            case TextAlignTypeRight:{
                alignment = NSTextAlignmentRight;
            }
              break;
            default:{
                alignment = NSTextAlignmentLeft;
            }
              break;
        }

    }
    return alignment;
}


+ (BOOL)isEmpty:(id)object{
    if ([object isKindOfClass:[NSDictionary class]] && ((NSDictionary*)object).allKeys.count > 0) {
        if (((NSDictionary*)object).allKeys.count == 1 && [(NSDictionary*)object objectForKey:@"gid"]) {
            return YES;
        }
        return NO;
    }
    return YES;
}

+ (UIInterfaceOrientation)currentOrientation{
    return [UIApplication sharedApplication].statusBarOrientation;
}


#pragma mark - 获取Dictionary中的元素
+ (id)getElementForKey:(id)key fromDict:(NSDictionary *)dict {
    if(![dict isKindOfClass:[NSDictionary class]])
        return nil;
    
    id obj = [dict objectForKey:key];
    if ([obj isKindOfClass:[NSString class]] && [obj isEqual:@""]) {
        return nil; //空字符串
    } else if ([obj isKindOfClass:[NSNull class]]) {
        return nil; //空类
    }
    return obj;
}

+ (id)getElementForKey:(id)key fromDict:(NSDictionary *)dict forClass:(Class)forClass {
    if(![dict isKindOfClass:[NSDictionary class]])
        return nil;
    
    id obj = [dict objectForKey:key];
    if ([obj isKindOfClass:forClass]) {
        if (([obj isKindOfClass:[NSString class]] && [obj isEqual:@""]) || [obj isKindOfClass:[NSNull class]]) {
            return nil;
        } else {
            return obj;
        }
    }
    return nil;
}


+ (NSString *)getStringElementForKey:(id)key fromDict:(NSDictionary *)dict {
    if(![dict isKindOfClass:[NSDictionary class]])
        return @"";
    
    NSString *result = @"";
    id value = [dict objectForKey:key];
    if (value) {
        if ([value isKindOfClass:[NSString class]]) {
            result = value;
        } else if ([value isKindOfClass:[NSNumber class]]) {
            result = [(NSNumber *)value stringValue];
        }
    }
    return result;
    
}

+ (NSInteger)getIntElementForKey:(id)key fromDict:(NSDictionary *)dict {
    if(![dict isKindOfClass:[NSDictionary class]])
        return 0;
    
    NSInteger result = 0;
    id value = [dict objectForKey:key];
    if (value) {
        if ([value isKindOfClass:[NSString class]]) {
            result = [(NSString *)value integerValue];
        } else if ([value isKindOfClass:[NSNumber class]]) {
            result = [(NSNumber *)value integerValue];
        }
    }
    return result;
}


+ (CGFloat)getFloatElementForKey:(id)key fromDict:(NSDictionary *)dict {
  if(![dict isKindOfClass:[NSDictionary class]])
    return 0.0;
  
  CGFloat result = 0.0;
  id value = [dict objectForKey:key];
  if (value) {
    if ([value isKindOfClass:[NSString class]]) {
      result = [(NSString *)value floatValue];
    } else if ([value isKindOfClass:[NSNumber class]]) {
      result = [(NSNumber *)value floatValue];
    }
  }
  return result;
}

+ (BOOL)getBoolElementForKey:(id)key fromDict:(NSDictionary *)dict {
  if(![dict isKindOfClass:[NSDictionary class]])
    return NO;
  
  BOOL  result = NO;
  id value = [dict objectForKey:key];
  if (value) {
    if ([value isKindOfClass:[NSString class]]) {
      result = [(NSString *)value boolValue];
    } else if ([value isKindOfClass:[NSNumber class]]) {
      result = [(NSNumber *)value boolValue];
    }
  }
  return result;
}

+ (void)change:(UIView *)view originY:(CGFloat)originY{
    CGRect frame = view.frame;
    frame.origin.y = originY;
    view.frame = frame;
}
+ (void)change:(UIView *)view originX:(CGFloat)originX{
    CGRect frame = view.frame;
    frame.origin.x = originX;
    view.frame = frame;
}
+ (void)change:(UIView *)view height:(CGFloat)height{
    CGRect frame = view.frame;
    frame.size.height = height;
    view.frame = frame;
}
+ (void)change:(UIView *)view width:(CGFloat)width{
    CGRect frame = view.frame;
    frame.size.width = width;
    view.frame = frame;
}
+ (void)change:(UIScrollView *)scrollView insets:(UIEdgeInsets)insets{
    scrollView.scrollIndicatorInsets = insets;
    scrollView.contentInset = insets;
}

+(UIImage *)capture:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}



#pragma mark - 根据16进制获取UIColor
+ (UIColor *)getColorByHexadecimalColor:(NSString *)hexColor {
    unsigned int redInt_, greenInt_, blueInt_;
	NSRange rangeNSRange_;
	rangeNSRange_.length = 2;  // 范围长度为2
	
	// 取红色的值
	rangeNSRange_.location = 0;
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&redInt_];
    
	// 取绿色的值
	rangeNSRange_.location = 2;
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&greenInt_];
	
	// 取蓝色的值
	rangeNSRange_.location = 4;
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&blueInt_];
	
	return [UIColor colorWithRed:(float)(redInt_/255.0f) green:(float)(greenInt_/255.0f) blue:(float)(blueInt_/255.0f) alpha:1.0f];
    
}

#pragma mark - UTF8 Encode
+ (NSString *)encodeUTF8Str:(NSString *)encodeStr {
    if ([encodeStr length]<=0) {
        return @"";
    }
    return [encodeStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - JSON Convert
+ (NSDictionary *)convertJSONToDict:(NSString *)string {
    NSError *error = nil;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (!data || data == nil) {
        return nil;
    }
    NSDictionary *respDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (nil == error){
        return respDict;
    }else{
        return nil;
    }
}

+ (NSArray *)convertJSONToArray:(NSString *)string {
    NSError *error = nil;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (!data || data == nil) {
        return nil;
    }
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (nil == error){
        return array;
    }else{
        return nil;
    }
}

+ (BOOL)isSuccessWithReponseDic:(NSDictionary *)responseDic; {
    if (responseDic) {
        if (![responseDic objectForKey:@"error"]) {
            return YES;
        }
    }
    return NO;
}

+ (NSString *)convertObjectToJSON:(id)object; {
    NSError *error = nil;
    NSData  *data = nil;
    if (object) {
        data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    }
    
    if (data == nil) {
        return nil;
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

#pragma mark - String Utility
+ (NSString *)stringWithSourceString:(NSString *)aString {
    if ([aString length]<=0) {
        return @"";
    }
    
    return aString;
}

+ (BOOL)stringIsNullAndEmpty:(NSString *)aString; {
    if ([aString length]<=0) {
        return YES;
    }
    return NO;
}

+ (NSString *)stringDecimalStyleFromNumber:(NSInteger)number; {
    NSNumberFormatter  *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter stringFromNumber:[NSNumber numberWithInteger:number]];
}

#pragma mark - NSArray Utility
+ (BOOL)arrayIsNullAndEmpty:(NSArray *)array {
    if (array == nil || [array count]<=0) {
        return YES;
    }
    return NO;
}

#pragma mark - NSDictionary Utility
+ (BOOL)dictionaryIsNullAndEmpty:(NSDictionary *)dic {
    if (dic == nil || [dic count]<=0) {
        return YES;
    }
    return NO;
}


#pragma mark - Image Resize
+ (UIImage *)image:(UIImage *)image drawInRect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)image:(UIImage *)image fitInSize:(CGSize)size {
    CGFloat scale;
    CGSize newSize = image.size;
    if (newSize.height != 0) {
        scale = size.height / newSize.height;
        newSize.height *= scale;
        newSize.width *= scale;
    } else {
        return nil;
    }
    if (newSize.width != 0) {
        scale = size.width / newSize.width;
        newSize.height *= scale;
        newSize.width *= scale;
    } else {
        return nil;
    }
    CGFloat x = (size.width - newSize.width) / 2.0f;
    CGFloat y = (size.height - newSize.height) / 2.0f;
    return [PUUtil image:image drawInRect:CGRectMake(x, y, newSize.width, newSize.height)];
}

+ (UIImage *)image:(UIImage *)image centerInSize:(CGSize)size {
    CGSize newSize = image.size;
    CGFloat x = (size.width - newSize.width)/2.0f;
    CGFloat y = (size.height - newSize.height)/2.0f;
    return [PUUtil image:image drawInRect:CGRectMake(x, y, newSize.width, newSize.height)];
}

+ (UIImage *)image:(UIImage *)image fillInSize:(CGSize)size {
    CGSize newSize = image.size;
    CGFloat scaleX = 0;
    CGFloat scaleY = 0;
    if (newSize.width != 0) {
        scaleX = size.width/newSize.width;
    } else {
        return nil;
    }
    if (newSize.height != 0) {
        scaleY = size.height/newSize.height;
    } else {
        return nil;
    }
    CGFloat scale = MAX(scaleX, scaleY);
    newSize.width *= scale;
    newSize.height *= scale;
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake((size.width-newSize.width)/2.0,
                                 0,
                                 newSize.width,
                                 newSize.height)];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)image:(UIImage *)image fitToWidth:(CGFloat)width {
    CGSize newSize = image.size;
    CGFloat scale;
    if (newSize.width != 0) {
        scale = width/newSize.width;
    } else {
        return nil;
    }
    return [PUUtil image:image drawInRect:CGRectMake(0, 0, width, newSize.height*scale)];
}

+ (UIImage *)image:(UIImage *)image fitToHeight:(CGFloat)height {
    CGSize newSize = image.size;
    CGFloat scale;
    if (newSize.height != 0) {
        scale = height/newSize.height;
    } else {
        return nil;
    }
    return [PUUtil image:image drawInRect:CGRectMake(0, 0, newSize.width*scale, height)];
}

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 atPosition:(CGRect)frame {
    UIGraphicsBeginImageContext(image2.size);
    
    // Draw image1
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    
    // Draw image2
    [image1 drawInRect:frame];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

+ (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size {
	UIGraphicsBeginImageContext(size);
	[image drawInRect:CGRectMake(0, 0, size.width, size.height)];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}


+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
    
}

+ (UIImage *)stretchImage:(UIImage *)image
                capInsets:(UIEdgeInsets)capInsets
             resizingMode:(UIImageResizingMode)resizingMode {
    UIImage *resultImage = nil;
    double systemVersion = [[UIDevice currentDevice].systemVersion doubleValue];
    if (systemVersion <5.0) {
        resultImage = [image stretchableImageWithLeftCapWidth:capInsets.left topCapHeight:capInsets.right];
    }else if (systemVersion<6.0){
        resultImage = [image resizableImageWithCapInsets:capInsets];
    }else{
        resultImage = [image resizableImageWithCapInsets:capInsets resizingMode:resizingMode];
    }
    return resultImage;
}

+ (CGFloat)adapterOriginX:(CGFloat)x withWidth:(CGFloat)width{
    CGFloat centerOriginX = x + width/2;//从中点计算，等比缩放OriginX，才是准确的
    return centerOriginX*kScreenWidthScaleSize - width/2;
}
+ (CGFloat)adapterOriginXwithWidth:(CGFloat)width{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    return screenWidth/2 - width/2;
}


//等比缩放CGSize
+ (CGSize )getAutoSize:(CGSize )size {
    CGSize sizeAuto;
    CGFloat autoSizeScaleWith = size.width*kScreenWidthScaleSizeByIphone6;
    CGFloat autoSizeScaleHeight = size.height*kScreenWidthScaleSizeByIphone6;
    sizeAuto.width = autoSizeScaleWith;
    sizeAuto.height = autoSizeScaleHeight;
    //    CGFloat autoSizeScaleX = (autoSizeScaleWith-width)/2.0+x;
    return sizeAuto;
}

//等比缩放CGPoint
+ (CGPoint )getAutoPoint:(CGPoint )origin{
    CGPoint originAuto;
    originAuto.x = origin.x*kScreenWidthScaleSizeByIphone6;
    originAuto.y = origin.y*kScreenWidthScaleSizeByIphone6;
    return originAuto;
}

//等比缩放CGSize,调整originX ，originy
+ (CGRect )getAutoRect:(CGRect )rect {
    CGRect rectAuto;
    CGSize sizeAuto = [PUUtil getAutoSize:rect.size];
    CGPoint originAuto = [PUUtil getAutoPoint:rect.origin];
    rectAuto.origin = originAuto;
    rectAuto.size = sizeAuto;
    return rectAuto;
}



+ (BOOL)isImageLink:(NSString *)urlStr {
    if (!urlStr) {
        return NO;
    }
    if ([urlStr length] > 5) {
        if ([[urlStr lowercaseString] rangeOfString:@".jpg"].location != NSNotFound ||
            [[urlStr lowercaseString] rangeOfString:@".jpeg"].location != NSNotFound||
            [[urlStr lowercaseString] rangeOfString:@".png"].location != NSNotFound ||
            [[urlStr lowercaseString] rangeOfString:@".gif"].location != NSNotFound ||
            [[urlStr lowercaseString] rangeOfString:@".tiff"].location != NSNotFound||
            [[urlStr lowercaseString] rangeOfString:@".webp"].location != NSNotFound
            ) {
            return YES;
        }
    }
    return NO;
}


#pragma mark - ip

#define kGetIPAddressLastRefreshTime @"kGetIPAddressLastRefreshTime"
+ (void)getIPAddress {
    
    if ([USER_DEFAULT objectForKey:@"ipAddress"]) {
        DLog(@"%@",[USER_DEFAULT objectForKey:@"ipAddress"]);
        //less than a week ,do not get again
        NSInteger lastCheckTime = [Addtions intValueOfUserDefaultsForKey:kGetIPAddressLastRefreshTime];
        NSInteger now = [[NSDate date] timeIntervalSince1970];
        if (now - lastCheckTime < 14*24*3600){
            return;
        }
    }
    NSArray* ipArray = @[@"http://www.telize.com/ip",@"http://api.ipify.org",@"http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json",
                         @"http://pv.sohu.com/cityjson",@"http://whois.pconline.com.cn/ipJson.jsp"];
    
    __block NSInteger index = arc4random()%([ipArray count]);
    NSString* ipStr = [ipArray objectAtIndex:index];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:ipStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
                                   DLog(@"%@",[connectionError localizedDescription]);
                               }else{
                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   if (responseCode == 200){
                                       if (index >= 3) {
                                           NSString *result = [[NSString alloc]initWithBytes:(Byte *)[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
                                           if (result) {
                                               DLog(@"%@",result);
                                               if (index == 3) {
                                                   if ([result rangeOfString:@"\"cip\":"].location != NSNotFound) {
                                                       NSString* sub = [result substringFromIndex:([result rangeOfString:@"\"cip\":"].location+[@"\"cip\":" length])];
                                                       if ([sub rangeOfString:@","].location != NSNotFound) {
                                                           NSString* sub1 = [sub substringToIndex:[sub rangeOfString:@","].location];
                                                           sub1 = [sub1 stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                                                           DLog(@"%@",sub1);
                                                           [USER_DEFAULT setObject:sub1 forKey:@"ipAddress"];
                                                           [Addtions setIntValueToUserDefaults:[[NSDate date] timeIntervalSince1970]
                                                                                        forKey:kGetIPAddressLastRefreshTime];
                                                       }
                                                   }
                                               }else{
                                                   if ([result rangeOfString:@"\"ip\":"].location != NSNotFound) {
                                                       NSString* sub = [result substringFromIndex:([result rangeOfString:@"\"ip\":"].location+[@"\"ip\":" length])];
                                                       if ([sub rangeOfString:@","].location != NSNotFound) {
                                                           NSString* sub1 = [sub substringToIndex:[sub rangeOfString:@","].location];
                                                           sub1 = [sub1 stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                                                           DLog(@"%@",sub1);
                                                           [USER_DEFAULT setObject:sub1 forKey:@"ipAddress"];
                                                           [Addtions setIntValueToUserDefaults:[[NSDate date] timeIntervalSince1970]
                                                                                        forKey:kGetIPAddressLastRefreshTime];
                                                       }
                                                   }
                                               }
                                           }
                                           
                                       }else{
                                           NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
                                           if (result) {
                                               DLog(@"%@",result);
                                               if (index < 2) {
                                                   [USER_DEFAULT setObject:result forKey:@"ipAddress"];
                                                   [Addtions setIntValueToUserDefaults:[[NSDate date] timeIntervalSince1970]
                                                                                forKey:kGetIPAddressLastRefreshTime];
                                               }else{
                                                   NSError *errorJson;
                                                   NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[result dataUsingEncoding:NSUTF8StringEncoding]
                                                                                                        options:NSJSONReadingMutableContainers
                                                                                                          error:&errorJson];
                                                   if (!errorJson) {
                                                       if ([data objectForKey:@"city"]) {
                                                           [USER_DEFAULT setObject:[data objectForKey:@"city"] forKey:@"ipAddress"];
                                                           [Addtions setIntValueToUserDefaults:[[NSDate date] timeIntervalSince1970]
                                                                                        forKey:kGetIPAddressLastRefreshTime];
                                                       }else{
                                                           if ([data objectForKey:@"province"]) {
                                                               [USER_DEFAULT setObject:[data objectForKey:@"province"] forKey:@"ipAddress"];
                                                               [Addtions setIntValueToUserDefaults:[[NSDate date] timeIntervalSince1970]
                                                                                            forKey:kGetIPAddressLastRefreshTime];
                                                           }else{
                                                               if ([data objectForKey:@"country"]){
                                                                   [USER_DEFAULT setObject:[data objectForKey:@"country"] forKey:@"ipAddress"];
                                                                   [Addtions setIntValueToUserDefaults:[[NSDate date] timeIntervalSince1970]
                                                                                                forKey:kGetIPAddressLastRefreshTime];
                                                               }
                                                           }
                                                       }
                                                   }
                                               }
                                           }
                                       }
                                   }
                               }
                           }];
}



@end




@implementation NSString (PUUtil)

- (BOOL)isLessToString:(NSString *)aString {
    NSArray * preVerAry = [self componentsSeparatedByString:@"."];
    NSArray * verAry = [aString componentsSeparatedByString:@"."];
    
    // 分段比较版本值
    for (int i = 0; i < [preVerAry count] || i < [verAry count]; i++) {
        int prSubVer, subVer;
        // 如果子版本号数不足，作为0处理
        if (i >= [preVerAry count]) {
            prSubVer = 0;
        } else {
            prSubVer = [[preVerAry objectAtIndex:i] intValue];
        }
        
        if (i >= [verAry count]) {
            subVer = 0;
        } else {
            subVer = [[verAry objectAtIndex:i] intValue];
        }
        
        if (prSubVer > subVer) {
            return NO;
        } else if (prSubVer < subVer) {
            return YES;
        }
    }
    return NO;
}

@end
