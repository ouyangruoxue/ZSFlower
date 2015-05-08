//
//  CustomNavigationController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//
#import "CustomNavigationController.h"
#import "AppDelegate.h"

#define iOS7  ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

//背景视图起始frame.x
#define startX         -200;

@interface CustomNavigationController()<UIGestureRecognizerDelegate>{
    
    CGPoint     _startTouch;
    UIImageView *_lastScreenShotView;
    UIView      *_blackMask;
    
    CGFloat     _startBackViewX;
    
}

@property (nonatomic,strong) UIView         *backgroundView;
@property (nonatomic,strong) NSMutableArray *screenShotsList;
@property (nonatomic,assign) BOOL           isMoving;

@end

@implementation CustomNavigationController




#pragma mark - memory  management
- (void)dealloc {
  _screenShotsList = nil;
  [_backgroundView removeFromSuperview];
  _backgroundView = nil;
}

////above or equal ios6
//- (void)didReceiveMemoryWarning {
//  [super didReceiveMemoryWarning];
//  if([self isViewLoaded] && ![[self view] window]) {
//    [self releaseView];
//    self.view = nil;
//  }
//}
//
////below ios6
//- (void)viewDidUnload {
//  [super viewDidUnload];
//  if([[[UIDevice currentDevice] systemVersion] floatValue] < 6.0){
//    [self releaseView];
//  }
//}
//
////the object create in viewdidload
//- (void)releaseView {
// 
//}


#pragma mark - init

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = YES;
    _autoRotate = NO;

    self.navigationBar.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    UIImage  *naviBg = [PUUtil stretchImage:[UIImage imageNamed:@"nav_bg"] capInsets:UIEdgeInsetsMake(3, 3, 3, 3) resizingMode:UIImageResizingModeStretch];
    [self.navigationBar setBackgroundImage:naviBg forBarMetrics:UIBarMetricsDefault];
    
    if (IOS7_OR_LATER) {
        
        [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                    [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                                                    NSForegroundColorAttributeName,
                                                    [UIFont boldSystemFontOfSize:20],
                                                    NSFontAttributeName,nil]];
    }
    else{
    
        [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                    [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                                                    UITextAttributeTextColor,
                                                    [UIFont boldSystemFontOfSize:20],
                                                    UITextAttributeFont,nil]];
    }
    
    _screenShotsList = [[NSMutableArray alloc] initWithCapacity:2];
    self.canDragBack = YES;
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(paningGestureReceive:)];
    [recognizer delaysTouchesBegan];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}



- (BOOL) shouldAutorotate {
    return _autoRotate;
}

- (NSUInteger)supportedInterfaceOrientations {
    if (_autoRotate){
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - override Push/Pop Method
// override the push method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.screenShotsList addObject:[self capture]];
    [super pushViewController:viewController animated:animated];
}

// override the pop method
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [self.screenShotsList removeLastObject];
    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    [self.screenShotsList removeAllObjects];
    return [super popToRootViewControllerAnimated:animated];
}

#pragma mark - Utility Methods -

// get the current view screen shot
- (UIImage *)capture {
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

// set lastScreenShotView 's position and alpha when paning
- (void)moveViewWithX:(float)x {
    x = x>SCREEN_WIDTH?SCREEN_WIDTH:x;
    x = x<0?0:x;
    
    CGRect frame = self.view.frame;
    frame.origin.x = x;
    self.view.frame = frame;
    
    float alpha = 0.4 - (x/800);
    
    _blackMask.alpha = alpha;
    
    CGFloat aa = abs(_startBackViewX)/SCREEN_WIDTH;
    CGFloat y = x*aa;
    
    UIImage *lastScreenShot = [self.screenShotsList lastObject];
    CGFloat lastScreenShotViewHeight = lastScreenShot.size.height;
    CGFloat superviewHeight = _lastScreenShotView.superview.frame.size.height;
    CGFloat verticalPos = superviewHeight - lastScreenShotViewHeight;
    
    [_lastScreenShotView setFrame:CGRectMake(_startBackViewX+y,
                                             verticalPos,
                                             SCREEN_WIDTH,
                                             lastScreenShotViewHeight)];
    
    
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return [self.viewControllers count]<=1;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return [self.viewControllers count]>1 && self.canDragBack;
}

#pragma mark - Gesture Recognizer -
- (void)paningGestureReceive:(UIPanGestureRecognizer *)recoginzer {
    if (self.viewControllers.count <= 1 || !self.canDragBack) return;
    
    CGPoint touchPoint = [recoginzer locationInView:KEY_WINDOW];
    
    if (recoginzer.state == UIGestureRecognizerStateBegan) {
        
        _isMoving = YES;
        _startTouch = touchPoint;
        
        if (!self.backgroundView){
            CGRect frame = self.view.frame;
            
            self.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
            [self.view.superview insertSubview:self.backgroundView belowSubview:self.view];
            
            _blackMask = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
            _blackMask.backgroundColor = [UIColor blackColor];
            [self.backgroundView addSubview:_blackMask];
        }
        
        self.backgroundView.hidden = NO;
        
        if (_lastScreenShotView) [_lastScreenShotView removeFromSuperview];
        
        
        UIImage *lastScreenShot = [self.screenShotsList lastObject];
        
        _lastScreenShotView = [[UIImageView alloc]initWithImage:lastScreenShot];
        
        _startBackViewX = startX;
        [_lastScreenShotView setFrame:CGRectMake(_startBackViewX,
                                                 _lastScreenShotView.frame.origin.y,
                                                 _lastScreenShotView.frame.size.height,
                                                 _lastScreenShotView.frame.size.width)];
        
        [self.backgroundView insertSubview:_lastScreenShotView belowSubview:_blackMask];
        
    }else if (recoginzer.state == UIGestureRecognizerStateEnded){
        
        if (touchPoint.x - _startTouch.x > SCREEN_WIDTH/3){
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:SCREEN_WIDTH];
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                CGRect frame = self.view.frame;
                frame.origin.x = 0;
                self.view.frame = frame;
                _isMoving = NO;
            }];
        }else{
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:0];
            } completion:^(BOOL finished) {
                _isMoving = NO;
                self.backgroundView.hidden = YES;
            }];
        }
        return;
        
    }else if (recoginzer.state == UIGestureRecognizerStateCancelled){
        
        [UIView animateWithDuration:0.3 animations:^{
            [self moveViewWithX:0];
        } completion:^(BOOL finished) {
            _isMoving = NO;
            self.backgroundView.hidden = YES;
        }];
        return;
    }
    
    if (_isMoving) {
        [self moveViewWithX:touchPoint.x - _startTouch.x];
    }
}


@end
