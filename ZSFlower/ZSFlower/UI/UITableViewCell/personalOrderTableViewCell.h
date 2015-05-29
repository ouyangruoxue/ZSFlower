//
//  personalOrderTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/13.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol personalOrderCellDelegate <NSObject>
- (void) firstAppraiseByself:(id)sender withType:(orderType )type;
@end

@interface personalOrderTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *shopImage;//店铺log
@property(nonatomic,strong)UILabel     *shopTitleLabel;//店铺名
@property(nonatomic,strong)UIImageView *arrowHead;//尖头图标
@property(nonatomic,strong)UILabel     *orderStateLabel;//订单状态
@property(nonatomic,strong)UIImageView *articleImage; //商品log
@property(nonatomic,strong)UILabel  *articletitleLabel;//商品名称
@property(nonatomic,strong)UILabel  *classifyLabel;//商品分类
@property(nonatomic,strong)UILabel  *priceLabel;//价格
@property(nonatomic,strong)UILabel  *numberLabel;//数量
@property(nonatomic,strong)UILabel  *priceAndNumLabel;
@property(nonatomic,strong)UIButton *orderSelectBtn;//订单选择Btn
@property(nonatomic,strong)UIButton *cancelOrderBtn; //取消订单
@property(nonatomic,strong)UIButton *connectSellBtn;//联系卖家
@property(nonatomic,strong)UIButton *appraiseBtn;//评价晒单
@property(nonatomic,strong)UIButton *secondAppraiseBtn;//追加评价
@property(nonatomic,strong)UIButton *seeLogistics;//查看物流
@property(nonatomic,strong)UIButton *buyAgainBtn;//再次购买
@property(nonatomic,strong)UIButton *payBtn;//付款
@property(nonatomic,strong)UIButton *confirmReceiptBtn;//确认收货
@property(nonatomic,strong)UIButton *deleteOrderBtn;
@property(nonatomic,assign)orderType currentOrderType;
@property(nonatomic,assign)id<personalOrderCellDelegate> personalOrderDelegate;
-(void)setOrderViewForOrderType:(orderType)type;
@end
