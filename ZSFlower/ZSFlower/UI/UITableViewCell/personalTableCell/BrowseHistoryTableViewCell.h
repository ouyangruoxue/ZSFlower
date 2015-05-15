//
//  BrowseHistoryTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/14.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseHistoryTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *articleImage;
@property(nonatomic,strong)UILabel     *articletitleLabel;
@property(nonatomic,strong)UILabel     *priceLabel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
