//
//  BankCardManagerTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardManagerTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *bankIcon;
@property(nonatomic,strong)UILabel     *bankName;
@property(nonatomic,strong)UILabel     *bankCardNumber;
@property(nonatomic,strong)UILabel     *bankCardType;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
