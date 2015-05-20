//
//  MycollectionShopTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MycollectionShopTableViewCell.h"

@implementation MycollectionShopTableViewCell

-(void)dealloc{
    
    _shopImage = nil;
    _shopTitle = nil;
    _ratingView = nil;
    _scoreLabel = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //店铺图片
        _shopImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 50, 50)];
        _shopImage.contentMode = UIViewContentModeCenter;
        _shopImage.backgroundColor = [UIColor redColor];
        _shopImage.centerY = 32.5;
        [self.contentView addSubview:_shopImage];
        
        
        _shopTitle = [[UILabel alloc] init];
        _shopTitle.backgroundColor = [UIColor clearColor];
        _shopTitle.numberOfLines = 2;
        _shopTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        _shopTitle.textAlignment = NSTextAlignmentLeft;
        _shopTitle.textColor = kApp_Corlor_2;
        _shopTitle.font = FONT_TITLE(kFont_Size_5);
        _shopTitle.width = SCREEN_WIDTH-60-70;
        _shopTitle.left = _shopImage.right+15;
        _shopTitle.top = _shopImage.top+5;
        _shopTitle.height  = 20;
        _shopTitle.text = @"韩都衣舍旗舰店";
        [_shopTitle sizeToFit];
        [self.contentView addSubview:_shopTitle];
        
        
        _ratingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(_shopTitle.left, _shopTitle.bottom+5, 50, 10) numberOfStar:5];
        _ratingView.backgroundColor = [UIColor clearColor];
        _ratingView.userInteractionEnabled = NO;
        [_ratingView changeLoveForegroundViewWithScore:8.5];
        [self.contentView addSubview:_ratingView];
        
        
        _scoreLabel = [[UILabel alloc] init];
        _scoreLabel.backgroundColor = [UIColor clearColor];
        _scoreLabel.numberOfLines = 1;
        _scoreLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _scoreLabel.textAlignment = NSTextAlignmentLeft;
        _scoreLabel.textColor = kApp_Corlor_8;
        _scoreLabel.font = FONT_TITLE(kFont_Size_8);
        _scoreLabel.width = 70;
        _scoreLabel.left = _ratingView.right+10;
        _scoreLabel.top = _ratingView.top;
        _scoreLabel.height  = 10;
        _scoreLabel.text = @"9.5分";
        [_scoreLabel sizeToFit];
        [self.contentView addSubview:_scoreLabel];
        
        UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 64, SCREEN_WIDTH, 1)];
        lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:lineView];
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
