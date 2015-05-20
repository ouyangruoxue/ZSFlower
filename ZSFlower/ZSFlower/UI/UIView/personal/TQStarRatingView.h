//
//  TQStarRatingView.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/15.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TQStarRatingView : UIView

- (id)initWithFrame:(CGRect)frame numberOfStar:(int)number;
@property (nonatomic, readonly) int numberOfStar;
- (void)changeLoveForegroundViewWithScore:(CGFloat )score;
@end
