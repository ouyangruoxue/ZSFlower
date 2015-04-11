//
//  Addtions.m
//  games
//
//  Created by xiaochengfei on 14-4-21.
//
//

#import "Addtions.h"

@implementation Addtions


+ (void) removeObjectOfUserDefaultsForKey:(NSString*) key{
  NSUserDefaults *defaults = USER_DEFAULT;
  [defaults removeObjectForKey:key];
  [defaults synchronize];
}

+ (void) setStringValueToUserDefaults:(NSString*)value forKey:(NSString*)key{
  NSUserDefaults *defaults = USER_DEFAULT;
  [defaults setObject:value forKey:key];
  [defaults synchronize];
}

+ (void) setBoolValueToUserDefaults:(bool)value forKey:(NSString*)key{
  [self setStringValueToUserDefaults:value?@"true":@"false" forKey:key];
}

+ (void) setIntValueToUserDefaults:(NSInteger)value forKey:(NSString*)key{
  [self setStringValueToUserDefaults:[NSString stringWithFormat:@"%ld", (long)value] forKey:key];
}

+ (void) setLongLongValueToUserDefaults:(long long)value forKey:(NSString*) key{
  [self setStringValueToUserDefaults:[NSString stringWithFormat:@"%lld", value] forKey:key];
}


+ (NSString*) stringValueOfUserDefaultsForKey:(NSString*) key{
  return [USER_DEFAULT  objectForKey:key];
}
+ (int) intValueOfUserDefaultsForKey:(NSString*) key{
  NSString* value = [self stringValueOfUserDefaultsForKey:key];
  return value ? [value intValue] : 0;
}
+ (bool) boolValueOfUserDefaultsForKey:(NSString*) key{
  NSString* value = [self stringValueOfUserDefaultsForKey:key];
  return value ? [value isEqualToString:@"true"] : false;
}
+ (long long) longLongValueOfUserDefaultsForKey:(NSString*) key{
  NSString* value = [self stringValueOfUserDefaultsForKey:key];
  return value ? [value longLongValue] : 0;
}

@end
