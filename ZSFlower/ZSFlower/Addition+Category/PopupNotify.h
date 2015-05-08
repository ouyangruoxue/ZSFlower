//
//  PopupNotify.h
//  
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/5.
//

#import <UIKit/UIKit.h>

@interface PopupNotify : UIWindow

+ (void)showMessage:(NSString*)string;
+ (void)showWithImageName:(NSString*)imageName;
//+(void)showMessage:(NSString *)string posY:(float)y;
+(void)showPrizeNotice:(NSString*)string;
+(void)showWithIndicatorView;
+(void)showIndicatorViewWithMessage:(NSString*)string;
+(void)hideIndicatorView;
@end
