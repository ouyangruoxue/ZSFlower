//
//  ShopCartTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/1.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ShopCartTableViewCell.h"
@implementation ShopCartTableViewCell

-(void)dealloc{
    _orderSelectBtn = nil;
    _shopImage = nil;
    _shopTitleLabel = nil;
    _arrowHead = nil;
    _couponsBtn = nil;//赠券
    _articleImage = nil;
    _articletitleLabel = nil;
    _priceLabel = nil;
    _numberLabel = nil;
    _addArticeBtn = nil;
    _lessArticleBtn = nil;
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 145)];
        bottomView.backgroundColor= [UIColor whiteColor];
        [self.contentView addSubview:bottomView];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, bottomView.height-0.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:bottomLine];
        
        [bottomView addSubview:self.orderSelectBtn];
        
        //商店图片
        _shopImage = [[UIImageView alloc] initWithImage:IMGNAMED(@"personal__order_shop")];
        _shopImage.left = _orderSelectBtn.right+5;
        _shopImage.centerY  = 17;
        _shopImage.contentMode = UIViewContentModeCenter;
        _shopImage.backgroundColor = [UIColor clearColor];
        [bottomView addSubview:_shopImage];
        
        
        _shopTitleLabel = [[UILabel alloc] init];
        _shopTitleLabel.backgroundColor = [UIColor clearColor];
        _shopTitleLabel.numberOfLines = 1;
        _shopTitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _shopTitleLabel.textAlignment = NSTextAlignmentLeft;
        _shopTitleLabel.textColor = kApp_Corlor_2;
        _shopTitleLabel.font = FONT_TITLE(kFont_Size_4);
        _shopTitleLabel.width = SCREEN_WIDTH-60-30-60;
        _shopTitleLabel.left = _shopImage.right+5;
        _shopTitleLabel.top = _shopImage.top+5;
        _shopTitleLabel.height  = 20;
        _shopTitleLabel.text = @"飞天旗舰店";
        [_shopTitleLabel sizeToFit];
        _shopTitleLabel.centerY = 17;
        [bottomView addSubview:_shopTitleLabel];
        
        
        
        
        _arrowHead = [[UIImageView alloc] initWithImage:IMGNAMED(@"arrowhead")];
        _arrowHead.left = _shopTitleLabel.right+10;
        _arrowHead.centerY  = 17;
        _arrowHead.contentMode = UIViewContentModeCenter;
        _arrowHead.backgroundColor = [UIColor clearColor];
        [bottomView addSubview:_arrowHead];
        
        [bottomView addSubview:self.couponsBtn];
        
        
        UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(15, 34, SCREEN_WIDTH-15, 0.5)];
        lineView1.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView1];
        
        
        //商品图片
        _articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 65, 65)];
        _articleImage.contentMode = UIViewContentModeCenter;
        _articleImage.backgroundColor = [UIColor redColor];
        _articleImage.layer.cornerRadius = 4;
        _articleImage.layer.masksToBounds = YES;
        _articleImage.centerY = 75;
        [bottomView addSubview:_articleImage];
        
        
        _articletitleLabel = [[UILabel alloc] init];
        _articletitleLabel.backgroundColor = [UIColor clearColor];
        _articletitleLabel.numberOfLines = 2;
        _articletitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _articletitleLabel.textAlignment = NSTextAlignmentLeft;
        _articletitleLabel.textColor = kApp_Corlor_2;
        _articletitleLabel.font = FONT_TITLE(kFont_Size_5);
        _articletitleLabel.width = SCREEN_WIDTH-60-30-60;
        _articletitleLabel.left = _articleImage.right+5;
        _articletitleLabel.top = _articleImage.top;
        _articletitleLabel.height  = 20;
        _articletitleLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖";
        [_articletitleLabel sizeToFit];
        [bottomView addSubview:_articletitleLabel];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [UIColor clearColor];
        _priceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.textColor = kApp_Corlor_2;
        _priceLabel.font = FONT_TITLE(kFont_Size_7);
        _priceLabel.width = 60;
        _priceLabel.left = _articletitleLabel.left;
        _priceLabel.top = _articletitleLabel.bottom+2;
        _priceLabel.height  = 15;
        _priceLabel.text = @"￥166666.00";
        [bottomView addSubview:_priceLabel];
        
        //商品图片
       UIImageView *shopCartNumImage = [[UIImageView alloc] initWithImage:IMGNAMED(@"shoppingcar_Number")];
        shopCartNumImage.contentMode = UIViewContentModeCenter;
        shopCartNumImage.backgroundColor = [UIColor clearColor];
        shopCartNumImage.top = _priceLabel.bottom+5;
        shopCartNumImage.left = _articletitleLabel.left;
        [bottomView addSubview:shopCartNumImage];
        
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.backgroundColor = [UIColor clearColor];
        _numberLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.textColor = kApp_Corlor_2;
        _numberLabel.font = FONT_TITLE(kFont_Size_8);
        _numberLabel.width = 21;
        _numberLabel.left = shopCartNumImage.left+12;
        _numberLabel.top = _priceLabel.bottom+5;
        _numberLabel.height  = 13;
        _numberLabel.text = @"1";
        [bottomView addSubview:_numberLabel];
        
        [bottomView addSubview:self.lessArticleBtn];
        [bottomView addSubview:self.addArticeBtn];
        
        
        _priceAfterActivity = [[UILabel alloc] init];
        _priceAfterActivity.backgroundColor = [UIColor clearColor];
        _priceAfterActivity.lineBreakMode = NSLineBreakByTruncatingTail;
        _priceAfterActivity.textAlignment = NSTextAlignmentCenter;
        _priceAfterActivity.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _priceAfterActivity.font = FONT_TITLE(kFont_Size_7);
        _priceAfterActivity.width = 150;
        _priceAfterActivity.left = _articleImage.left;
        _priceAfterActivity.top = _articleImage.bottom+10;
        _priceAfterActivity.height  = 15;
        _priceAfterActivity.text = @"小计：￥166666.00";
        [_priceAfterActivity sizeToFit];
        [bottomView addSubview:_priceAfterActivity];
        
        _ActivityType = [[UILabel alloc] init];
        _ActivityType.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _ActivityType.lineBreakMode = NSLineBreakByTruncatingTail;
        _ActivityType.textAlignment = NSTextAlignmentCenter;
        _ActivityType.textColor = kApp_Corlor_1;
        _ActivityType.font = FONT_TITLE(kFont_Size_8);
        _ActivityType.width = 60;
        _ActivityType.left = _priceAfterActivity.right+5;
        _ActivityType.top = _articleImage.bottom+10;
        _ActivityType.height  = 15;
        _ActivityType.text = @"满减";
        [_ActivityType sizeToFit];
        _ActivityType.width += 5;
        [bottomView addSubview:_ActivityType];
        
        _activityContent = [[UILabel alloc] init];
        _activityContent.backgroundColor = [UIColor clearColor];
        _activityContent.lineBreakMode = NSLineBreakByTruncatingTail;
        _activityContent.textAlignment = NSTextAlignmentCenter;
        _activityContent.textColor = kApp_Corlor_8;
        _activityContent.font = FONT_TITLE(kFont_Size_7);
        _activityContent.width = 150;
        _activityContent.left = _ActivityType.right+5;
        _activityContent.top = _articleImage.bottom+10;
        _activityContent.height  = 15;
        _activityContent.text = @"满200，减100";
        [_activityContent sizeToFit];
        [bottomView addSubview:_activityContent];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)orderSelect:(id)sender{
    _orderSelectBtn.selected = !((UIButton *)sender).selected;
}

-(void)couponsBtnSelect{
    
}

-(void)addArticeBtnSelect{
    
    if([_numberLabel.text integerValue]>=99){
        return;
    }
    int num  = [_numberLabel.text intValue];
    num++;
    _numberLabel.text = [NSString stringWithFormat:@"%d",num];
}

-(void)lessArticleBtnSelect{
    
    if ([_numberLabel.text integerValue]==1) {
        return;
    }
    int num  = [_numberLabel.text intValue];
    num--;
    _numberLabel.text = [NSString stringWithFormat:@"%d",num];
}

#pragma mark get --

-(UIButton *)orderSelectBtn{
    
    if (!_orderSelectBtn) {
        _orderSelectBtn = [[UIButton alloc] init];
        _orderSelectBtn.width = 15;
        _orderSelectBtn.height = 15;
        _orderSelectBtn.centerY = 17;
        _orderSelectBtn.left = 15;
        _orderSelectBtn.backgroundColor = [UIColor clearColor];
        [_orderSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_gray"] forState:UIControlStateNormal];
        [_orderSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_red"] forState:UIControlStateSelected];
        [_orderSelectBtn addTarget:self action:@selector(orderSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderSelectBtn;
}


-(UIButton *)addArticeBtn{
    
    if (!_addArticeBtn) {
        _addArticeBtn = [[UIButton alloc] init];
        _addArticeBtn.width = 11;
        _addArticeBtn.height = 11;
        _addArticeBtn.centerY = _numberLabel.centerY;
        _addArticeBtn.left = _numberLabel.right;
        _addArticeBtn.backgroundColor = [UIColor clearColor];
        [_addArticeBtn setImage:[UIImage imageNamed:@"shoppingcar_plus"] forState:UIControlStateNormal];
        [_addArticeBtn addTarget:self action:@selector(addArticeBtnSelect) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addArticeBtn;
}


-(UIButton *)lessArticleBtn{
    
    if (!_lessArticleBtn) {
        _lessArticleBtn = [[UIButton alloc] init];
        _lessArticleBtn.width = 11;
        _lessArticleBtn.height = 11;
        _lessArticleBtn.centerY = _numberLabel.centerY;
        _lessArticleBtn.left = _articletitleLabel.left;
        _lessArticleBtn.backgroundColor = [UIColor clearColor];
        [_lessArticleBtn setImage:[UIImage imageNamed:@"shoppingcar_Less"] forState:UIControlStateNormal];
        [_lessArticleBtn addTarget:self action:@selector(lessArticleBtnSelect) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lessArticleBtn;
}



-(UIButton *)couponsBtn{
    
    if (!_couponsBtn) {
        _couponsBtn = [[UIButton alloc] init];
        _couponsBtn.width = 50;
        _couponsBtn.height = 18;
        _couponsBtn.centerY = 17;
        _couponsBtn.right = SCREEN_WIDTH-15;
        _couponsBtn.backgroundColor = [UIColor clearColor];
        [_couponsBtn setBackgroundImage:[UIImage imageNamed:@"shoppingcar_Coupons"] forState:UIControlStateNormal];
        [_couponsBtn setTitle:@"赠券" forState:UIControlStateNormal];
        [_couponsBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        _couponsBtn.titleLabel.font = FONT_TITLE(kFont_Size_6);
        [_couponsBtn addTarget:self action:@selector(couponsBtnSelect) forControlEvents:UIControlEventTouchUpInside];
    }
    return _couponsBtn;
}



@end
