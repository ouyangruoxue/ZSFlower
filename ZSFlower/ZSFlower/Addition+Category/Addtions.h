//
//  Addtions.h
//  games
//
//  Created by xiaochengfei on 14-4-21.
//
//

#import <Foundation/Foundation.h>

@interface Addtions : NSObject
+ (void) removeObjectOfUserDefaultsForKey:(NSString*) key;
+ (void) setStringValueToUserDefaults:(NSString*)value forKey:(NSString*) key;
+ (void) setBoolValueToUserDefaults:(bool)value forKey:(NSString*) key;

+ (void) setIntValueToUserDefaults:(NSInteger)value forKey:(NSString*) key;
+ (void) setLongLongValueToUserDefaults:(long long)value forKey:(NSString*) key;

+ (NSString*) stringValueOfUserDefaultsForKey:(NSString*) key;
+ (int) intValueOfUserDefaultsForKey:(NSString*) key;
+ (bool) boolValueOfUserDefaultsForKey:(NSString*) key;
+ (long long) longLongValueOfUserDefaultsForKey:(NSString*) key;

@end
