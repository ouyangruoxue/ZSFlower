//
//  MyCollectionCommodityTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MyCollectionCommodityTableViewCell.h"
@implementation MyCollectionCommodityTableViewCell


-(void)dealloc{
    
    _articleImage = nil;
    _articletitleLabel = nil;
    _priceLabel = nil;
    _priceBtn = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //商品图片
        _articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 92, 92)];
        _articleImage.contentMode = UIViewContentModeCenter;
        _articleImage.backgroundColor = [UIColor redColor];
        _articleImage.centerY = 62.5;
        [self.contentView addSubview:_articleImage];
        
        
        _articletitleLabel = [[UILabel alloc] init];
        _articletitleLabel.backgroundColor = [UIColor clearColor];
        _articletitleLabel.numberOfLines = 2;
        _articletitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _articletitleLabel.textAlignment = NSTextAlignmentLeft;
        _articletitleLabel.textColor = kApp_Corlor_2;
        _articletitleLabel.font = FONT_TITLE(kFont_Size_5);
        _articletitleLabel.width = SCREEN_WIDTH-60-70;
        _articletitleLabel.left = _articleImage.right+15;
        _articletitleLabel.top = _articleImage.top+5;
        _articletitleLabel.height  = 20;
        _articletitleLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖星宿老怪，法力无边，千秋万代，一统江湖星宿老怪，法力无边，千秋万代，一统江湖";
        [_articletitleLabel sizeToFit];
        [self.contentView addSubview:_articletitleLabel];
        
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [UIColor clearColor];
        _priceLabel.numberOfLines = 1;
        _priceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _priceLabel.font = FONT_TITLE(kFont_Size_3);
        _priceLabel.width = SCREEN_WIDTH-60-30-60;
        _priceLabel.left = _articleImage.right+15;
        _priceLabel.bottom = _articletitleLabel.bottom+5;
        _priceLabel.height  = 15;
        _priceLabel.text = @"￥166.00";
        [_priceLabel sizeToFit];
        [self.contentView addSubview:_priceLabel];
        
        
        _priceBtn = [[UIButton alloc] init];
        [_priceBtn setTitle:@"降价通知" forState:UIControlStateNormal];
        [_priceBtn setBackgroundImage:IMGNAMED(@"personal__concern_icon") forState:UIControlStateNormal];
        _priceBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        _priceBtn.selected = YES;
        _priceBtn.height = 16;
        _priceBtn.width = 56;
        _priceBtn.left = _priceLabel.left;
        _priceBtn.bottom = _articleImage.bottom -10;;
        [_priceBtn addTarget:self action:@selector(cutPrice) forControlEvents:UIControlEventTouchUpInside];
        [_priceBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [self.contentView addSubview:_priceBtn];
        
        UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 124, SCREEN_WIDTH, 1)];
        lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:lineView];
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
    }
    return self;
}

-(void)cutPrice{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
