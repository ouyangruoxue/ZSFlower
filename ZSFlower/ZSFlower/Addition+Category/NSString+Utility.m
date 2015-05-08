//
//  NSString+Utility.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "NSString+Utility.h"
#import "AESCrypt.h"

#define AES_KEY  @"884b2fbc1397c37a4f6fe951aa19679d"

@implementation NSString (Utility)

+ (BOOL)isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES;
        
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        
        return YES;
        
    }
    return NO;
}

//////////////////////////////////////////
//这个判空不会处理空格的
+ (BOOL)isBlankStringButCanHaveSpace:(NSString *)string
{
    
    if (string == nil || string == NULL) {
        
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES; 
    }
    return NO;
}

+ (NSString *)phonetic:(NSString *)sourceString
{
    NSMutableString *source = [sourceString mutableCopy];

     /*Transformation	                 Input	        Output
     *********************************************************
     CFString​Transform: wiki http://nshipster.com/cfstringtransform/
     kCFStringTransformMandarinLatin	中文	            zhōng wén 
     kCFStringTransformStripDiacritics  zhōng wén       zhong wen
     kCFStringTransformToLatin          中文 or chinese  zhōng wén or chinese
     */
    //string参数是要转换的string，比如要转换的中文，同时它是mutable的，因此也直接作为最终转换后的字符串。
    //range是要转换的范围，同时输出转换后改变的范围，如果为NULL，视为全部转换。
    //transform可以指定要进行什么样的转换，这里可以指定多种语言的拼写转换。
    //reverse指定该转换是否必须是可逆向转换的。如果转换成功就返回true，否则返回false
    Boolean isFinish = CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformToLatin, NO);
//    DDLogInfo(@"第一步转换%@:------>\n%@",isFinish?@"成功":@"失败",source);
    isFinish = CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
//    DDLogInfo(@"第二步转换%@:------>\n%@",isFinish?@"成功":@"失败",source);
    return source;
}

-(BOOL)searchResult:(NSString *)searchStr
{
	NSComparisonResult result = [self compare:searchStr options:NSCaseInsensitiveSearch
											   range:NSMakeRange(0, searchStr.length)];
	if (result == NSOrderedSame)
		return YES;
	else
		return NO;
}

+ (CGSize) sizeForString:(NSString *)value
                    font:(UIFont *)font
           textAlignment:(NSTextAlignment)alignment
                andWidth:(float)width
           lineBreakMode:(NSInteger)lineMode
{
    if ([NSString isBlankString:value])
    {
        return CGSizeZero;
    }
    
    NSMutableParagraphStyle *paragraph=[[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = lineMode;
    paragraph.alignment = alignment;
    
    NSAttributedString *attributeText=[[NSAttributedString alloc] initWithString:value attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraph}];
    //options 有多个参数，详见苹果官方解释
    CGSize sizeToFit =[attributeText boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    return sizeToFit;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark  AES Encode & Decode
//////////////////////////////////////////////////////////////////////////////////////////////////////

+ (NSString *)stringtoAES:(NSString *)originalString
{
    return [AESCrypt encrypt:originalString password:AES_KEY];
}

+ (NSString *)AEStoString:(NSString *)AESString
{
    return [AESCrypt decrypt:AESString password:AES_KEY];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark  Other
//////////////////////////////////////////////////////////////////////////////////////////////////////

+(NSString *)convertIntToTimeString:(NSString *)timeString
{
    long long secFrom1970 = [timeString longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:secFrom1970];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

// 数据库特殊字符处理
+ (NSString *)stringSqlEscape:(NSString *)str
{
    if (str)
    {
        str = [str stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    }
    return str;
}


+ (NSString *)jidWithDomain:(NSString *)jidString
{
    NSString *resultString = jidString;
    if (!jidString) {
        return nil;
    }
    if (![jidString hasSuffix:@"@cn.hopwow.com"])
    {
        resultString = [jidString stringByAppendingString:@"@cn.hopwow.com"];
    }
    
    return resultString;
}

//c1134751-fd18-4b1b-9fb9-2f7d68958816@cn.hopwow.com/Spark 2.6.3 去掉resource部分（Spark 2.6.3）
//————————>>c1134751-fd18-4b1b-9fb9-2f7d68958816@cn.hopwow.com
+ (NSString *)jidWithNoResource:(NSString *)jidString
{
    NSRange range = [jidString rangeOfString:@"/"];
    NSString *resultString = jidString;
    
    if(range.location != NSNotFound)
    {
        resultString = [jidString substringToIndex:range.location];
    }
    
    return resultString;
}
//————————>>c1134751-fd18-4b1b-9fb9-2f7d68958816@cn.hopwow.com ---->c1134751-fd18-4b1b-9fb9-2f7d68958816
+(NSString *)jidWithNoDomain:(NSString *)jidString
{
    NSRange range = [jidString rangeOfString:@"@"];
    NSString *resultString = jidString;
    
    if(range.location != NSNotFound)
    {
        resultString = [jidString substringToIndex:range.location];
    }
    return resultString;
}

+ (NSString *)jidGetResource:(NSString *)jidString
{
    NSRange range = [jidString rangeOfString:@"/"];
    NSString *resultString = nil;
    
    if(range.location != NSNotFound)
    {
        resultString = [jidString substringFromIndex:range.location+1];
    }
    return resultString;
}

#pragma mark -
#pragma mark - CreatRandomString
//生成随机字符串
+ (NSString *)createRandomString
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef =CFUUIDCreateString(NULL, uuidRef);
    NSString *uniqueId = (__bridge NSString *)uuidStringRef;
    
    return uniqueId;
}

#pragma mark - 
#pragma mark - CaptureFileNameOrType
+ (NSString *)getFileNameFromPath:(NSString *)filePath
{
    NSString *fileName = nil;
    
    if (![NSString isBlankString:filePath])
    {
        NSRange range = [filePath rangeOfString:@"/" options:NSBackwardsSearch];
        if (range.location != NSNotFound)
        {
            fileName = [filePath substringFromIndex:(range.location+1)];
        }
    }
    
    return fileName;
}

+ (NSString *)getFileTypeFromPath:(NSString *)filePath
{
    NSString *fileType = nil;
    
    if (![NSString isBlankString:filePath])
    {
        NSRange range = [filePath rangeOfString:@"." options:NSBackwardsSearch];
        if (range.location != NSNotFound)
        {
            fileType = [filePath substringFromIndex:(range.location+1)];
        }
    }
    
    return fileType;
}

#pragma mark -
#pragma mark - ChatMethod
- (NSString *)trimWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)numberOfLines
{
    return [self componentsSeparatedByString:@"\n"].count + 1;
}

@end
