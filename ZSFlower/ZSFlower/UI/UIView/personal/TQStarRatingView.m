//
//  TQStarRatingView.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/15.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//


#import "TQStarRatingView.h"

@interface TQStarRatingView ()

@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) UIView *starForegroundView;

@end

@implementation TQStarRatingView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStar:5];
}

- (id)initWithFrame:(CGRect)frame numberOfStar:(int)number
{
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStar = number;
        self.starBackgroundView = [self buidlStarViewWithImageName:@"personal__concern_loveG"];
        self.starForegroundView = [self buidlStarViewWithImageName:@"personal__concern_loveR"];
        [self addSubview:self.starBackgroundView];
        [self addSubview:self.starForegroundView];
    }
    return self;
}
- (UIView *)buidlStarViewWithImageName:(NSString *)imageName
{
    CGRect frame = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.clipsToBounds = YES;
    for (int i = 0; i < self.numberOfStar; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * frame.size.width / self.numberOfStar, 0, imageView.width, imageView.height);
        imageView.centerY = frame.size.height/2;
        [view addSubview:imageView];
    }
    return view;
}

- (void)changeLoveForegroundViewWithScore:(CGFloat )score
{
    if (score<0) {
        score = 0.0;
    }
    else if (score >10){
        score = 10.0;
    }
    CGPoint p = CGPointMake(0, 0);
    p.x = score/10*50;
    self.starForegroundView.frame = CGRectMake(0, 0, p.x, self.frame.size.height);
    
}

@end
