//
//  BrowseHistoryTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/14.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BrowseHistoryTableViewCell.h"

@implementation BrowseHistoryTableViewCell

-(void)dealloc{
    
    _articleImage = nil;
    _articletitleLabel = nil;
    _priceLabel = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //商品图片
        _articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 63, 63)];
        _articleImage.contentMode = UIViewContentModeCenter;
        _articleImage.backgroundColor = [UIColor redColor];
        _articleImage.centerY = 42.5;
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
        _priceLabel.bottom = _articleImage.bottom-20;
        _priceLabel.height  = 15;
        _priceLabel.text = @"￥166.00";
        [_priceLabel sizeToFit];
        [self.contentView addSubview:_priceLabel];
        
        
       UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 84.5, SCREEN_WIDTH, 0.5)];
        lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:lineView];
    }
    return self;
}

-(void)setUIWithObject:(id)object{
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
