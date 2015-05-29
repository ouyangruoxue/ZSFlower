//
//  ShowScrollImgeViewController.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/28.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol showScrollImageViewDelegate <NSObject>

-(void)deleteImageWithIndex:(NSInteger)index;

@end

@interface ShowScrollImgeViewController : BaseViewController
@property(nonatomic,assign)id<showScrollImageViewDelegate> imgeScrolldelegate;
-(id)initWithindex:(NSInteger)index andImageArr:(NSMutableArray *)imageArr;
@end
