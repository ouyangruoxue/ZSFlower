//
//  ConfrimOrderTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/2.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ConfirmOrderTableViewCell.h"

@interface ConfirmOrderTableViewCell()
@property(nonatomic,strong)UIImageView *articleImage;
@property(nonatomic,strong)UILabel *articletitleLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *numberLabel;
@end

@implementation ConfirmOrderTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        headView.backgroundColor= [UIColor whiteColor];
        [self.contentView addSubview:headView];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        topLine.alpha = 0.3;
        [headView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, headView.height-0.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        topLine.alpha = 0.3;
        [headView addSubview:bottomLine];
        
        
        //商品图片
        _articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 65, 65)];
        _articleImage.contentMode = UIViewContentModeCenter;
        _articleImage.backgroundColor = [UIColor redColor];
        _articleImage.layer.cornerRadius = 4;
        _articleImage.layer.masksToBounds = YES;
        _articleImage.centerY = 75;
        [headView addSubview:_articleImage];
        
        
        _articletitleLabel = [[UILabel alloc] init];
        _articletitleLabel.backgroundColor = [UIColor clearColor];
        _articletitleLabel.numberOfLines = 2;
        _articletitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _articletitleLabel.textAlignment = NSTextAlignmentLeft;
        _articletitleLabel.textColor = kApp_Corlor_8;
        _articletitleLabel.font = FONT_TITLE(kFont_Size_5);
        _articletitleLabel.width = SCREEN_WIDTH-60-30-60;
        _articletitleLabel.left = _articleImage.right+5;
        _articletitleLabel.top = _articleImage.top;
        _articletitleLabel.height  = 20;
        _articletitleLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖";
        [_articletitleLabel sizeToFit];
        [headView addSubview:_articletitleLabel];
        
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.backgroundColor = [UIColor clearColor];
        _numberLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.textColor = kApp_Corlor_8;
        _numberLabel.font = FONT_TITLE(kFont_Size_8);
        _numberLabel.width = 100;
        _numberLabel.left = _articletitleLabel.left;
        _numberLabel.top = _priceLabel.bottom+5;
        _numberLabel.height  = 13;
        _numberLabel.text = @"x1";
        [headView addSubview:_numberLabel];

        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [UIColor clearColor];
        _priceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _priceLabel.font = FONT_TITLE(kFont_Size_7);
        _priceLabel.width = 100;
        _priceLabel.right = SCREEN_WIDTH-15;
        _priceLabel.centerY = _numberLabel.centerY;
        _priceLabel.height  = 15;
        _priceLabel.text = @"￥166666.00";
        [headView addSubview:_priceLabel];
        
        UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, headView.bottom+10, SCREEN_WIDTH, 75)];
        
        UIView *topLine1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        topLine.alpha = 0.3;
        [centerView addSubview:topLine1];
        
        UILabel *sendTitle = [[UILabel alloc] init];
        sendTitle.backgroundColor = [UIColor clearColor];
        sendTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        sendTitle.textAlignment = NSTextAlignmentRight;
        _priceLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _priceLabel.font = FONT_TITLE(kFont_Size_7);
        _priceLabel.width = 100;
        _priceLabel.right = SCREEN_WIDTH-15;
        _priceLabel.centerY = _numberLabel.centerY;
        _priceLabel.height  = 15;
        _priceLabel.text = @"￥166666.00";
        [headView addSubview:_priceLabel];
        
        
        UIView *bottomLine1 = [[UIView alloc] initWithFrame:CGRectMake(0, headView.height-0.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        topLine.alpha = 0.3;
        [centerView addSubview:bottomLine1];
        
        
        UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(15, 39.5, SCREEN_WIDTH-15, 0.5)];
        lineView1.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [centerView addSubview:lineView1];
        
        
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
