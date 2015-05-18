//
//  AddressManagerTableViewCell.h
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/18.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressManagerTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel  *nameLabel;
@property(nonatomic,strong)UILabel  *moblieNumberLabel;
@property(nonatomic,strong)UILabel  *addressLabel;
@property(nonatomic,strong)UIButton *selectBtn;
@property(nonatomic,strong)UIButton *eeditIngBtn;
@property(nonatomic,strong)UIButton *deleteBtn;
@property(nonatomic,strong)UIButton *addressSelectBtn;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
