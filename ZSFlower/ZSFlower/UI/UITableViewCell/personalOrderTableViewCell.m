//
//  personalOrderTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/13.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "personalOrderTableViewCell.h"

@implementation personalOrderTableViewCell
-(void)dealloc{

    _shopImage = nil;
    _shopTitleLabel = nil;//店铺名
    _arrowHead = nil;//尖头图标
    _orderStateLabel = nil;//订单状态
    _articleImage = nil; //商品log
    _articletitleLabel = nil;//商品名称
    _classifyLabel = nil;//商品分类
    _priceLabel = nil;//价格
    _numberLabel = nil;//数量
    _priceAndNumLabel = nil;
    _orderSelectBtn = nil;//订单选择Btn
    _cancelOrderBtn = nil; //取消订单
    _connectSellBtn = nil;//联系卖家
    _appraiseBtn = nil;//评价晒单
    _secondAppraiseBtn = nil;//追加评价
    _seeLogistics = nil;//查看物流
    _buyAgainBtn = nil;//再次购买
    _payBtn = nil;//付款
    _confirmReceiptBtn = nil;//确认收货
    _deleteOrderBtn = nil;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 190)];
        bottomView.backgroundColor= [UIColor whiteColor];
        [self.contentView addSubview:bottomView];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, bottomView.height-0.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:bottomLine];
        
        //商店图片
        _shopImage = [[UIImageView alloc] initWithImage:IMGNAMED(@"personal__order_shop")];
        _shopImage.left = 15;
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
        
        
        _orderStateLabel = [[UILabel alloc] init];
        _orderStateLabel.backgroundColor = [UIColor clearColor];
        _orderStateLabel.numberOfLines = 1;
        _orderStateLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _orderStateLabel.textAlignment = NSTextAlignmentRight;
        _orderStateLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _orderStateLabel.font = FONT_TITLE(kFont_Size_7);
        _orderStateLabel.width = 60;
        _orderStateLabel.right = SCREEN_WIDTH-15;
        _orderStateLabel.height  = 15;
        _orderStateLabel.text = @"待付款";
        _orderStateLabel.centerY = _arrowHead.centerY;
        [bottomView addSubview:_orderStateLabel];
        
        
        UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(15, 34, SCREEN_WIDTH-15, 0.5)];
        lineView1.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView1];
        
        
        //商品图片
        _articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 60, 60)];
        _articleImage.contentMode = UIViewContentModeCenter;
        _articleImage.backgroundColor = [UIColor redColor];
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
        _articletitleLabel.top = _articleImage.top+5;
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
        _priceLabel.right = SCREEN_WIDTH-15;
        _priceLabel.top = _articleImage.top+5;
        _priceLabel.height  = 15;
        _priceLabel.text = @"￥166666.00";
        [bottomView addSubview:_priceLabel];
        
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.backgroundColor = [UIColor clearColor];
        _numberLabel.numberOfLines = 1;
        _numberLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _numberLabel.textAlignment = NSTextAlignmentRight;
        _numberLabel.textColor = kApp_Corlor_8;
        _numberLabel.font = FONT_TITLE(kFont_Size_5);
        _numberLabel.width = 60;
        _numberLabel.right = SCREEN_WIDTH-15;
        _numberLabel.top = _priceLabel.bottom+5;
        _numberLabel.height  = 15;
        _numberLabel.text = @"×1";
        [bottomView addSubview:_numberLabel];
        
        _classifyLabel = [[UILabel alloc] init];
        _classifyLabel.backgroundColor = [UIColor clearColor];
        _classifyLabel.numberOfLines = 1;
        _classifyLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _classifyLabel.textAlignment = NSTextAlignmentLeft;
        _classifyLabel.textColor = kApp_Corlor_8;
        _classifyLabel.font = FONT_TITLE(kFont_Size_5);
        _classifyLabel.width = SCREEN_WIDTH-60-30-60;
        _classifyLabel.left = _articleImage.right+5;
        _classifyLabel.top = _articletitleLabel.bottom+5;
        _classifyLabel.height  = 15;
        _classifyLabel.text = @"颜色分类：米色M码";
        [_classifyLabel sizeToFit];
        [bottomView addSubview:_classifyLabel];

    
        _priceAndNumLabel = [[UILabel alloc] init];
        _priceAndNumLabel.backgroundColor = [UIColor clearColor];
        _priceAndNumLabel.numberOfLines = 1;
        _priceAndNumLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _priceAndNumLabel.textAlignment = NSTextAlignmentRight;
        _priceAndNumLabel.textColor = kApp_Corlor_2;
        _priceAndNumLabel.font = FONT_TITLE(kFont_Size_5);
        _priceAndNumLabel.width = SCREEN_WIDTH-30;
        _priceAndNumLabel.height  = 15;
        _priceAndNumLabel.text = [NSString stringWithFormat:@"共%d件商品，运费：%@，实付：%@",1,@"￥16.00",@"￥166.00"];
        [_priceAndNumLabel sizeToFit];
        _priceAndNumLabel.centerY = 132;
        _priceAndNumLabel.right = SCREEN_WIDTH-15;
        [bottomView addSubview:_priceAndNumLabel];
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(15, 114, SCREEN_WIDTH-15, 0.5)];
        lineView2.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView2];
        
        UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(15, 149, SCREEN_WIDTH-15, 0.5)];
        lineView3.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView3];
        
        //orderSelectBtn
        //cancelOrderBtn; //取消订单
        //connectSellBtn;//联系卖家
        //appraiseBtn;//评价晒单
        //secondAppraiseBtn;//追加评价
        //seeLogistics;//查看物流
        //buyAgainBtn;//再次购买
        //payBtn;//付款
        //confirmReceiptBtn;//确认收货
        [bottomView addSubview:self.orderSelectBtn];
        [bottomView addSubview:self.cancelOrderBtn];
        [bottomView addSubview:self.connectSellBtn];
        [bottomView addSubview:self.appraiseBtn];
        [bottomView addSubview:self.secondAppraiseBtn];
        [bottomView addSubview:self.seeLogistics];
        [bottomView addSubview:self.buyAgainBtn];
        [bottomView addSubview:self.payBtn];
        [bottomView addSubview:self.confirmReceiptBtn];
        [bottomView addSubview:self.deleteOrderBtn];
        
    }
    return self;
}


-(void)setButtonOriginAndHiddenByOrderType:(orderType)type{
    self.orderSelectBtn.hidden = YES;
    self.cancelOrderBtn.hidden = YES;
    self.connectSellBtn.hidden = YES;
    self.appraiseBtn.hidden = YES;
    self.secondAppraiseBtn.hidden = YES;
    self.seeLogistics.hidden = YES;
    self.buyAgainBtn.hidden = YES;
    self.payBtn.hidden = YES;
    self.deleteOrderBtn.hidden = YES;
    self.confirmReceiptBtn.hidden = YES;
    switch (type) {
        case KwaitingForPay:
        {   _orderSelectBtn.hidden = NO;
            self.payBtn.hidden = NO;
            self.connectSellBtn.hidden = NO;
            self.cancelOrderBtn.hidden = NO;
            self.payBtn.right = SCREEN_WIDTH - 15;
            self.cancelOrderBtn.right = self.payBtn.left-5;
            self.connectSellBtn.right = self.cancelOrderBtn.left-5;
            _orderStateLabel.text = @"待付款";
        }
            break;
        case KwaitingForSend:{
            self.connectSellBtn.hidden = NO;
            self.cancelOrderBtn.hidden = NO;
            self.cancelOrderBtn.right = SCREEN_WIDTH - 15;
            self.connectSellBtn.right = self.cancelOrderBtn.left -5;
            _orderStateLabel.text = @"待发货";
        }
            
            break;
        case KwaitingForTake:{
            
            self.connectSellBtn.hidden = NO;
            self.seeLogistics.hidden = NO;
            self.confirmReceiptBtn.hidden = NO;
            self.confirmReceiptBtn.right = SCREEN_WIDTH -15;
            self.connectSellBtn.right = self.confirmReceiptBtn.left -5;
            self.seeLogistics.right = self.connectSellBtn.left -5;
            _orderStateLabel.text = @"待收货";
            
            }
            break;
        case KwaitingForAppraise:{
            self.connectSellBtn.hidden = NO;
            self.appraiseBtn.hidden = NO;
            self.appraiseBtn.right = SCREEN_WIDTH -15;
            self.connectSellBtn.right = self.appraiseBtn.left-5;
            _orderStateLabel.text = @"待评价";
        }
            break;
        case kordercompleteAppraise:{
            self.deleteOrderBtn.hidden = NO;
            self.buyAgainBtn.hidden = NO;
            self.buyAgainBtn.right =SCREEN_WIDTH - 15;
            self.deleteOrderBtn.right = self.buyAgainBtn.left -5;
            _orderStateLabel.text = @"交易完成";
        }
            break;
        case korderCacel:{
            self.deleteOrderBtn.hidden = NO;
            self.deleteOrderBtn.right = SCREEN_WIDTH -15;
            _orderStateLabel.text = @"订单取消";
        }
            break;
        default:
            break;
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self setButtonOriginAndHiddenByOrderType:_currentOrderType];
    
    if (_orderSelectBtn.hidden) {
        _shopImage.left = 15;
        _shopTitleLabel.left = _shopImage.right+5;
        _arrowHead.left = _shopTitleLabel.right+10;
    }
    else {
        _orderSelectBtn.left = 15;
        _shopImage.left = _orderSelectBtn.right+5;
        _shopTitleLabel.left = _shopImage.right+5;
        _arrowHead.left = _shopTitleLabel.right+10;
    }

    
    NSRange range1 = [_priceAndNumLabel.text rangeOfString:@"运费："];
    NSRange range2 = [_priceAndNumLabel.text rangeOfString:@"实付："];
    NSMutableAttributedString* aStr1 = [[NSMutableAttributedString alloc] initWithString:_priceAndNumLabel.text];
    
    [aStr1 addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                          FONT_TITLE(kFont_Size_5),
                          NSFontAttributeName,
                          kApp_Corlor_8,
                          NSForegroundColorAttributeName,nil]
                   range:range1];
    _priceAndNumLabel.attributedText = aStr1;
    
    [aStr1 addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                          FONT_TITLE(kFont_Size_5),
                          NSFontAttributeName,
                          kApp_Corlor_8,
                          NSForegroundColorAttributeName,nil]
                   range:range2];
    _priceAndNumLabel.attributedText = aStr1;
}

-(void)setOrderViewForOrderType:(orderType)type{
    
    _currentOrderType = type;
    
}
#pragma mark buttonaction
//订单选中
-(void)orderSelect:(id)sender{
    
        _orderSelectBtn.selected = !((UIButton *)sender).selected;
}
//联系卖家
-(void)connectSeller{
    
}
//评价晒单
-(void)firstAppraise{
    
    if ([_personalOrderDelegate respondsToSelector:@selector(firstAppraiseByself:withType:)]) {
        [_personalOrderDelegate firstAppraiseByself:self withType:_currentOrderType];
    }
    
}
//追加评论
-(void)secondAppraise{
    
}
//查看物流
-(void)seeLogisticsInfo{
    
}
//删除订单
-(void)cancelCurrentOrder{
    
}
//再次购买
-(void)buyAgain{
    
    
}
//付款
-(void)payArticle{
    
    
}

//确认收货
-(void)confirmReceiptArticle{
    
}

-(void)deleteCurrentOrder{
    
}

#pragma mark get
//personal__order_frame
//orderSelectBtn
//cancelOrderBtn; //取消订单
//connectSellBtn;//联系卖家
//appraiseBtn;//评价晒单
//secondAppraiseBtn;//追加评价
//seeLogistics;//查看物流
//buyAgainBtn;//再次购买
//payBtn;//付款
//confirmReceiptBtn;//确认收货

-(UIButton *)orderSelectBtn{
    
    if (!_orderSelectBtn) {
        _orderSelectBtn = [[UIButton alloc] init];
        _orderSelectBtn.width = 15;
        _orderSelectBtn.height = 15;
        _orderSelectBtn.centerY = 17;
        _orderSelectBtn.hidden = YES;
        _orderSelectBtn.backgroundColor = [UIColor clearColor];
        [_orderSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_gray"] forState:UIControlStateNormal];
         [_orderSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_red"] forState:UIControlStateSelected];
        [_orderSelectBtn addTarget:self action:@selector(orderSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderSelectBtn;
}


-(UIButton *)connectSellBtn{
    
    if (!_connectSellBtn) {
        _connectSellBtn = [[UIButton alloc] init];
        _connectSellBtn.width = 65;
        _connectSellBtn.height = 22;
        _connectSellBtn.centerY = 170;
        _connectSellBtn.hidden = YES;
        _connectSellBtn.backgroundColor = [UIColor clearColor];
        [_connectSellBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_connectSellBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame"] forState:UIControlStateNormal];
        [_connectSellBtn setTitle:@"联系卖家" forState:UIControlStateNormal];
        _connectSellBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_connectSellBtn addTarget:self action:@selector(connectSeller) forControlEvents:UIControlEventTouchUpInside];
    }
    return _connectSellBtn;
}

-(UIButton *)appraiseBtn{
    
    if (!_appraiseBtn) {
        _appraiseBtn = [[UIButton alloc] init];
        _appraiseBtn.width = 65;
        _appraiseBtn.height = 22;
        _appraiseBtn.centerY = 170;
        _appraiseBtn.hidden = YES;
        _appraiseBtn.backgroundColor = [UIColor clearColor];
        [_appraiseBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
        [_appraiseBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame_red"] forState:UIControlStateNormal];
        [_appraiseBtn setTitle:@"评价晒单" forState:UIControlStateNormal];
        _appraiseBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_appraiseBtn addTarget:self action:@selector(firstAppraise) forControlEvents:UIControlEventTouchUpInside];
    }
    return _appraiseBtn;
}

-(UIButton *)secondAppraiseBtn{
    
    if (!_secondAppraiseBtn) {
        _secondAppraiseBtn = [[UIButton alloc] init];
        _secondAppraiseBtn.width = 65;
        _secondAppraiseBtn.height = 22;
        _secondAppraiseBtn.centerY = 170;
        _secondAppraiseBtn.backgroundColor = [UIColor clearColor];
        [_secondAppraiseBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
        [_secondAppraiseBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame_red"] forState:UIControlStateNormal];
        [_secondAppraiseBtn setTitle:@"追加评价" forState:UIControlStateNormal];
        _secondAppraiseBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_secondAppraiseBtn addTarget:self action:@selector(secondAppraise) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondAppraiseBtn;
}

-(UIButton *)cancelOrderBtn{
    
    if (!_cancelOrderBtn) {
        _cancelOrderBtn = [[UIButton alloc] init];
        _cancelOrderBtn.width = 65;
        _cancelOrderBtn.height = 22;
        _cancelOrderBtn.centerY = 170;
        _cancelOrderBtn.hidden = YES;
        _cancelOrderBtn.backgroundColor = [UIColor clearColor];
        [_cancelOrderBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_cancelOrderBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame"] forState:UIControlStateNormal];
        [_cancelOrderBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        _cancelOrderBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_cancelOrderBtn addTarget:self action:@selector(cancelCurrentOrder) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelOrderBtn;
}

-(UIButton *)deleteOrderBtn{
    
    if (!_deleteOrderBtn) {
        _deleteOrderBtn = [[UIButton alloc] init];
        _deleteOrderBtn.width = 65;
        _deleteOrderBtn.height = 22;
        _deleteOrderBtn.centerY = 170;
        _deleteOrderBtn.hidden = YES;
        _deleteOrderBtn.backgroundColor = [UIColor clearColor];
        [_deleteOrderBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_deleteOrderBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame"] forState:UIControlStateNormal];
        [_deleteOrderBtn setTitle:@"删除订单" forState:UIControlStateNormal];
        _deleteOrderBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_deleteOrderBtn addTarget:self action:@selector(deleteCurrentOrder) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteOrderBtn;
}

-(UIButton *)seeLogistics{
    
    if (!_seeLogistics) {
        _seeLogistics = [[UIButton alloc] init];
        _seeLogistics.width = 65;
        _seeLogistics.height = 22;
        _seeLogistics.centerY = 170;
        _seeLogistics.hidden = YES;
        _seeLogistics.backgroundColor = [UIColor clearColor];
        [_seeLogistics setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_seeLogistics setBackgroundImage:[UIImage imageNamed:@"personal__order_frame"] forState:UIControlStateNormal];
        [_seeLogistics setTitle:@"查看物流" forState:UIControlStateNormal];
        _seeLogistics.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_seeLogistics addTarget:self action:@selector(seeLogisticsInfo) forControlEvents:UIControlEventTouchUpInside];
    }
    return _seeLogistics;
}

-(UIButton *)buyAgainBtn{
    
    if (!_buyAgainBtn) {
        _buyAgainBtn = [[UIButton alloc] init];
        _buyAgainBtn.width = 65;
        _buyAgainBtn.height = 22;
        _buyAgainBtn.centerY = 170;
        _buyAgainBtn.hidden = YES;
        _buyAgainBtn.backgroundColor = [UIColor clearColor];
        [_buyAgainBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
        [_buyAgainBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame_red"] forState:UIControlStateNormal];
        [_buyAgainBtn setTitle:@"再次购买" forState:UIControlStateNormal];
        _buyAgainBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_buyAgainBtn addTarget:self action:@selector(buyAgain) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyAgainBtn;
}

-(UIButton *)payBtn{
    
    if (!_payBtn) {
        _payBtn = [[UIButton alloc] init];
        _payBtn.width = 65;
        _payBtn.height = 22;
        _payBtn.centerY = 170;
        _payBtn.hidden = YES;
        _payBtn.backgroundColor = [UIColor clearColor];
        [_payBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
        [_payBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame_red"] forState:UIControlStateNormal];
        [_payBtn setTitle:@"付款" forState:UIControlStateNormal];
        _payBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_payBtn addTarget:self action:@selector(payArticle) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payBtn;
}


-(UIButton *)confirmReceiptBtn{
    
    if (!_confirmReceiptBtn) {
        _confirmReceiptBtn = [[UIButton alloc] init];
        _confirmReceiptBtn.width = 65;
        _confirmReceiptBtn.height = 22;
        _confirmReceiptBtn.centerY = 170;
        _confirmReceiptBtn.hidden = YES;
        _confirmReceiptBtn.backgroundColor = [UIColor clearColor];
        [_confirmReceiptBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
        [_confirmReceiptBtn setBackgroundImage:[UIImage imageNamed:@"personal__order_frame_red"] forState:UIControlStateNormal];
        [_confirmReceiptBtn setTitle:@"确认收货" forState:UIControlStateNormal];
        _confirmReceiptBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        [_confirmReceiptBtn addTarget:self action:@selector(confirmReceiptArticle) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmReceiptBtn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
