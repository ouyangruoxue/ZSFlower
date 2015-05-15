//
//  FeedBackSelectTypeView.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/15.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeedBackTypeDelegate <NSObject>

-(void)didSelectType:(NSString *)selectValue;

@end


@interface FeedBackSelectTypeView : UIWindow

@property (nonatomic, assign) id<FeedBackTypeDelegate> feedBackTypeDelegate;

+(id)viewWithDelegate:(id)aDelegate ;
@end
