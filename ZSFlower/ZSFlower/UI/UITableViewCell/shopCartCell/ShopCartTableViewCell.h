//
//  ShopCartTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/1.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCartTableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton *orderSelectBtn;
@property(nonatomic,strong)UIImageView *shopImage;
@property(nonatomic,strong)UILabel *shopTitleLabel;
@property(nonatomic,strong)UIImageView *arrowHead;
@property(nonatomic,strong)UIButton *couponsBtn;//赠券
@property(nonatomic,strong)UIImageView *articleImage;
@property(nonatomic,strong)UILabel *articletitleLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *numberLabel;
@property(nonatomic,strong)UIButton *addArticeBtn;
@property(nonatomic,strong)UIButton *lessArticleBtn;
@property(nonatomic,strong)UILabel  *priceAfterActivity;//活动后价格
@property(nonatomic,strong)UILabel  *ActivityType;//活动类型
@property(nonatomic,strong)UILabel  *activityContent;//活动后价格
@end
