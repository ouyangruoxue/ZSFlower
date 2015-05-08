//
//  PopupNotify.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/5.
//

//

#import "PopupNotify.h"
#import "AppDelegate.h"

@implementation PopupNotify

static PopupNotify *instance;

- (id)initWithString:(NSString*)string
{
    self = [super init];
    if (self) {
        self.hidden = NO;
//        self.alpha = 1.0f;
        self.windowLevel = UIWindowLevelNormal;
        
        self.backgroundColor = RGBACOLOR(0x17, 0x17, 0x17, 0.9);
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:kFont_Size_2];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = [PUUtil getTextAlign:TextAlignTypeCenter];
        label.numberOfLines = 0;
        label.width = 200;
        label.text = string;
        [label sizeToFit];
        [self addSubview:label];
        
        self.width = label.width + 20;
        self.height = label.height + 20;
        self.left = (SCREEN_WIDTH - self.width)/2;
        self.top = ([UIScreen mainScreen].bounds.size.height - self.height)/2;
        label.left = 10;
        label.top = 10;
    }
    return self;
}

- (id)initWithImageName:(NSString*)imageName
{
    self = [super init];
    if (self) {
        self.hidden = NO;
        self.alpha = 1.0f;
        self.windowLevel = UIWindowLevelNormal + 1.0f;
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        [self addSubview:imageView];
        
        self.width = imageView.width;
        self.height = imageView.height;
        
    }
    return self;
}

- (void)animationHide {
    [UIView animateWithDuration:.4 animations:^{
        instance.alpha = 0;
    } completion:^(BOOL finished) {
        instance = nil;
    }];
}

-(void)hideIndicatorView
{
    [instance removeFromSuperview];
    instance = nil;
}

+ (void)showMessage:(NSString*)string {
    instance.hidden = YES;
    instance = nil;
    instance = [[PopupNotify alloc] initWithString:string];
    instance.alpha = 0;
    [UIView animateWithDuration:.4 animations:^{
        instance.alpha = 1;
    }];
    [instance performSelector:@selector(animationHide) withObject:nil afterDelay:2];
}

+(void)showMessage:(NSString *)string posY:(float)y
{
    instance.hidden = YES;
    instance = nil;
    instance = [[PopupNotify alloc] initWithString:string];
    instance.alpha = 0;
    instance.top = y;
    [UIView animateWithDuration:.4 animations:^{
        instance.alpha = 1;
    }];
    [instance performSelector:@selector(animationHide) withObject:nil afterDelay:2];
}

+ (void)showPrizeNotice:(NSString*)string
{
    instance.hidden = YES;
    instance = nil;
    
    instance.hidden = YES;
    instance = nil;
    instance = [[PopupNotify alloc] initWithString:string];
    instance.alpha = 0;
    instance.top = [UIScreen mainScreen].bounds.size.height -64;
    [UIView animateWithDuration:.4 animations:^{
        instance.alpha = 1;
    }];
    [instance performSelector:@selector(animationHide) withObject:nil afterDelay:2];
    
}

+ (void)showWithImageName:(NSString*)imageName{
    instance = [[PopupNotify alloc] initWithImageName:imageName];
    instance.centerX = SCREEN_WIDTH/2;
    instance.bottom = SCREEN_HEIGHT - 40;
    instance.alpha = 0;
    
    [UIView animateWithDuration:.4 animations:^{
        instance.alpha = 1;
    }];

    
    [instance performSelector:@selector(animationHide) withObject:nil afterDelay:2];
}


+(void)showWithIndicatorView
{
    instance = [[PopupNotify alloc] initWithString:nil];
    instance.frame = [UIScreen mainScreen].bounds;
    instance.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, 150, 120, 120)];
    view.layer.cornerRadius = 5;
    view.centerY = [UIScreen mainScreen].bounds.size.height/2;
    view.backgroundColor = RGBACOLOR(0, 0, 0, 0.8);
    [instance addSubview:view];
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicatorView.frame =CGRectMake(30, 20, 60, 60);
    [indicatorView startAnimating];
    [view addSubview:indicatorView];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 75, 120, 30)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textColor = [UIColor whiteColor];
    lbl.textAlignment = [PUUtil getTextAlign:TextAlignTypeCenter];
    lbl.text = @"请稍候...";
    [view addSubview:lbl];
}

+(void)showIndicatorViewWithMessage:(NSString*)string
{
    instance = [[PopupNotify alloc] initWithString:nil];
    instance.frame = [UIScreen mainScreen].bounds;
    instance.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, 150, 120, 120)];
    view.layer.cornerRadius = 5;
    view.centerY = [UIScreen mainScreen].bounds.size.height/2;
    view.backgroundColor = RGBACOLOR(0, 0, 0, 0.8);
    [instance addSubview:view];
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicatorView.frame =CGRectMake(30, 20, 60, 60);
    [indicatorView startAnimating];
    [view addSubview:indicatorView];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 75, 120, 30)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textColor = [UIColor whiteColor];
    lbl.textAlignment = [PUUtil getTextAlign:TextAlignTypeCenter];
    lbl.text = string;
    [view addSubview:lbl];
    
}

+(void)hideIndicatorView
{
    [instance performSelector:@selector(hideIndicatorView) withObject:nil];
}
@end
