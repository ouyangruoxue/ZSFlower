//
//  PersonalTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/8.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomBadge.h"

@interface PersonalTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImage;
@property(nonatomic,strong)UILabel  *nameLabel;
@property(nonatomic,strong)UILabel  *accessLabel;
@property(nonatomic,strong)CustomBadge *badageView;
@property(nonatomic,strong)UIView  *lineView;
@property(nonatomic,strong)UIImageView  *redPoint;
- (void)setUnreadNumber:(NSInteger)num;
@end
