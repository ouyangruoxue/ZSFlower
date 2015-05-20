//
//  MyCollectionCommodityTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionCommodityTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *articleImage;
@property(nonatomic,strong)UILabel     *articletitleLabel;
@property(nonatomic,strong)UILabel     *priceLabel;
@property(nonatomic,strong)UIButton    *priceBtn;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
