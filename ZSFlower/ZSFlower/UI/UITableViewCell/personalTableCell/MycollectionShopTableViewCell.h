//
//  MycollectionShopTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
@interface MycollectionShopTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *shopImage;
@property(nonatomic,strong)UILabel     *shopTitle;
@property(nonatomic,strong)TQStarRatingView *ratingView;
@property(nonatomic,strong)UILabel *scoreLabel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
