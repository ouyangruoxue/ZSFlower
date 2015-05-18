//
//  BankCardManagerTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BankCardManagerTableViewCell.h"

@implementation BankCardManagerTableViewCell

-(void)dealloc{
    
    _bankCardNumber = nil;
    _bankIcon = nil;
    _bankName = nil;
    _bankCardType = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //商品图片
        _bankIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 65, 65)];
        _bankIcon.contentMode = UIViewContentModeScaleAspectFit;
        _bankIcon.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:_bankIcon];
        
        
        _bankName = [[UILabel alloc] init];
        _bankName.backgroundColor = [UIColor clearColor];
        _bankName.numberOfLines = 2;
        _bankName.lineBreakMode = NSLineBreakByTruncatingTail;
        _bankName.textAlignment = NSTextAlignmentLeft;
        _bankName.textColor = kApp_Corlor_2;
        _bankName.font = FONT_TITLE(kFont_Size_2);
        _bankName.width = SCREEN_WIDTH-60-70;
        _bankName.left = _bankIcon.right+15;
        _bankName.top = _bankIcon.top+10;
        _bankName.height  = 20;
        _bankName.text = @"中国银行";
        [_bankName sizeToFit];
        [self.contentView addSubview:_bankName];
        
        
        _bankCardNumber = [[UILabel alloc] init];
        _bankCardNumber.backgroundColor = [UIColor clearColor];
        _bankCardNumber.numberOfLines = 1;
        _bankCardNumber.lineBreakMode = NSLineBreakByTruncatingTail;
        _bankCardNumber.textAlignment = NSTextAlignmentLeft;
        _bankCardNumber.textColor = kApp_Corlor_8;
        _bankCardNumber.font = FONT_TITLE(kFont_Size_5);
        _bankCardNumber.width = 150;
        _bankCardNumber.left = _bankIcon.right+15;
        _bankCardNumber.bottom = _bankIcon.bottom-25;
        _bankCardNumber.height  = 15;
        _bankCardNumber.text = @"尾号4942";
        [_bankCardNumber sizeToFit];
        [self.contentView addSubview:_bankCardNumber];
        
        
        _bankCardType = [[UILabel alloc] init];
        _bankCardType.backgroundColor = [UIColor clearColor];
        _bankCardType.numberOfLines = 1;
        _bankCardType.lineBreakMode = NSLineBreakByTruncatingTail;
        _bankCardType.textAlignment = NSTextAlignmentLeft;
        _bankCardType.textColor = kApp_Corlor_8;
        _bankCardType.font = FONT_TITLE(kFont_Size_5);
        _bankCardType.width = 100;
        _bankCardType.left = _bankCardNumber.right+15;
        _bankCardType.bottom = _bankIcon.bottom-25;
        _bankCardType.height  = 15;
        _bankCardType.text = @"储蓄卡";
        [_bankCardType sizeToFit];
        [self.contentView addSubview:_bankCardType];
        
        UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(95, 64, SCREEN_WIDTH-95, 1)];
        lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:lineView];
    }
    return self;
}- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
