//
//  ServiceAndRefundCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/21.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ServiceAndRefundCell.h"

@implementation ServiceAndRefundCell

-(void)dealloc{
    
    _articleImage = nil; //商品log
    _orderNum = nil;//订单编号
    _oderTime = nil;//下单时间
    _articletitleLabel = nil;//商品名称
    _classifyLabel = nil;//商品分类
    _numberLabel = nil;//数量
    _serviceBtn  = nil;//

}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        bottomView.backgroundColor= [UIColor whiteColor];
        [self.contentView addSubview:bottomView];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-15, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, bottomView.height-0.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:bottomLine];
        
        
        _orderNum = [[UILabel alloc] init];
        _orderNum.backgroundColor = [UIColor clearColor];
        _orderNum.numberOfLines = 1;
        _orderNum.lineBreakMode = NSLineBreakByTruncatingTail;
        _orderNum.textAlignment = NSTextAlignmentLeft;
        _orderNum.textColor = kApp_Corlor_8;
        _orderNum.font = FONT_TITLE(kFont_Size_5);
        _orderNum.width = SCREEN_WIDTH-60-30-60;
        _orderNum.left = 15;
        _orderNum.top = 15;
        _orderNum.height  = 15;
        _orderNum.text = @"订单编号：15654213456";
        [_orderNum sizeToFit];
        [bottomView addSubview:_orderNum];
        
        
        _oderTime = [[UILabel alloc] init];
        _oderTime.backgroundColor = [UIColor clearColor];
        _oderTime.numberOfLines = 1;
        _oderTime.lineBreakMode = NSLineBreakByTruncatingTail;
        _oderTime.textAlignment = NSTextAlignmentLeft;
        _oderTime.textColor = kApp_Corlor_8;
        _oderTime.font = FONT_TITLE(kFont_Size_5);
        _oderTime.width = SCREEN_WIDTH-60-30-60;
        _oderTime.left = _orderNum.left;
        _oderTime.top = _orderNum.bottom+5;
        _oderTime.height  = 15;
        _oderTime.text = @"下单时间：2015-4-12 15：45";
        [_oderTime sizeToFit];
        [bottomView addSubview:_oderTime];
        
        
        
        UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(15, 56, SCREEN_WIDTH-15, 0.5)];
        lineView1.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView1];
        
        
        //商品图片
        _articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 71, 60, 60)];
        _articleImage.contentMode = UIViewContentModeCenter;
        _articleImage.backgroundColor = [UIColor redColor];

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
        _articletitleLabel.top = _articleImage.top+5;
        _articletitleLabel.height  = 20;
        _articletitleLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖";
        [_articletitleLabel sizeToFit];
        [bottomView addSubview:_articletitleLabel];
        
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.backgroundColor = [UIColor clearColor];
        _numberLabel.numberOfLines = 1;
        _numberLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _numberLabel.textAlignment = NSTextAlignmentLeft;
        _numberLabel.textColor = kApp_Corlor_8;
        _numberLabel.font = FONT_TITLE(kFont_Size_5);
        _numberLabel.width = SCREEN_WIDTH-60-30-60;
        _numberLabel.left = _articleImage.right+5;
        _numberLabel.top = _articletitleLabel.bottom+5;
        _numberLabel.height  = 15;
        _numberLabel.text = @"数量：1";
        [_numberLabel sizeToFit];
        [bottomView addSubview:_numberLabel];
        
        [bottomView addSubview:self.serviceBtn];

        
    }
    return self;
}

-(void)setObjectWithType:(serviceRebundType)type{
    
    if (type == serviceRebund) {
        [_serviceBtn setTitle:@"申请售后" forState:UIControlStateNormal];
    }
    else if (type == serviceRebunding){
        [_serviceBtn setTitle:@"查看进度" forState:UIControlStateNormal];
    }
    else if(type == serviceRebundDisabled){
       // [_serviceBtn setTitle:@"申请售后" forState:UIControlStateNormal];
        [_serviceBtn setImage:IMGNAMED(@"personal__service") forState:UIControlStateDisabled];
        _serviceBtn.enabled = NO;
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
}

-(void)serviceRebundAction{
    
    
}


-(UIButton *)serviceBtn{
    
    if (!_serviceBtn) {
        _serviceBtn = [[UIButton alloc] init];
        _serviceBtn.width = 65;
        _serviceBtn.height = 22;
        _serviceBtn.centerY = _numberLabel.centerY;
        _serviceBtn.right = SCREEN_WIDTH - 15;
        _serviceBtn.backgroundColor = [UIColor clearColor];
        [_serviceBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [_serviceBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame"] forState:UIControlStateNormal];
        [_serviceBtn setBackgroundImage:[UIImage imageNamed:@"personal__service"] forState:UIControlStateDisabled];
        [_serviceBtn setTitle:@"申请售后" forState:UIControlStateNormal];
        _serviceBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_serviceBtn addTarget:self action:@selector(serviceRebundAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _serviceBtn;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
