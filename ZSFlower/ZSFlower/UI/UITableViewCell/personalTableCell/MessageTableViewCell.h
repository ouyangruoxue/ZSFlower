//
//  MessageTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomBadge.h"
@interface MessageTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *messageIconImage;
@property(nonatomic,strong)UILabel     *messageTitle;
@property(nonatomic,strong)UILabel     *descriptionInfo;
@property(nonatomic,strong)UILabel     *timeLabel;
@property(nonatomic,strong)CustomBadge *badageView;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setUnreadNumber:(NSInteger)num ;
@end
