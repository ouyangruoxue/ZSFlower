//
//  CustomNavigationController.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface CustomNavigationController : UINavigationController

@property (nonatomic, assign) BOOL autoRotate;

// Enable the drag to back interaction, Defalt is YES.
@property (nonatomic,assign) BOOL canDragBack;
- (void)paningGestureReceive:(UIPanGestureRecognizer *)recoginzer;
@end
