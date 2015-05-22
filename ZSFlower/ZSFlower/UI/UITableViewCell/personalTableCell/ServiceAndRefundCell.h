//
//  ServiceAndRefundCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/21.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceAndRefundCell : UITableViewCell
@property(nonatomic,strong)UIImageView *articleImage; //商品log
@property(nonatomic,strong)UILabel  *orderNum;//订单编号
@property(nonatomic,strong)UILabel  *oderTime;//下单时间
@property(nonatomic,strong)UILabel  *articletitleLabel;//商品名称
@property(nonatomic,strong)UILabel  *classifyLabel;//商品分类
@property(nonatomic,strong)UILabel  *numberLabel;//数量
@property(nonatomic,strong)UIButton *serviceBtn;//
@property(nonatomic,assign)serviceRebundType *currentServiceType;
-(void)setObjectWithType:(serviceRebundType)type;
@end
