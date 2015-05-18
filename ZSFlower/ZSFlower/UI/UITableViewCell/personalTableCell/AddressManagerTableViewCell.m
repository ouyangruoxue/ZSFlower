//
//  AddressManagerTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/18.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AddressManagerTableViewCell.h"

@implementation AddressManagerTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 98)];
        bottomView.backgroundColor = kApp_Corlor_1;
        
        [self.contentView addSubview:bottomView];
        
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.numberOfLines = 1;
        _nameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = kApp_Corlor_2;
        _nameLabel.font = FONT_TITLE(kFont_Size_2);
        _nameLabel.width = SCREEN_WIDTH-60-70;
        _nameLabel.left = 15;
        _nameLabel.top = 10;
        _nameLabel.height  = 20;
        _nameLabel.text = @"付娇艳";
        [_nameLabel sizeToFit];
        [bottomView addSubview:_nameLabel];
        
        
        _moblieNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.right+30, 10, 80, 20)];
        _moblieNumberLabel.backgroundColor = [UIColor clearColor];

        _moblieNumberLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _moblieNumberLabel.textAlignment = NSTextAlignmentLeft;
        _moblieNumberLabel.textColor = kApp_Corlor_2;
        _moblieNumberLabel.font = FONT_TITLE(kFont_Size_2);
        _moblieNumberLabel.text = @"18551718588";
        [bottomView addSubview:_moblieNumberLabel];
        
        
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.backgroundColor = [UIColor clearColor];
        _addressLabel.numberOfLines = 1;
        _addressLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _addressLabel.textAlignment = NSTextAlignmentLeft;
        _addressLabel.textColor = kApp_Corlor_8;
        _addressLabel.font = FONT_TITLE(kFont_Size_5);
        _addressLabel.width = SCREEN_WIDTH;
        _addressLabel.left = _nameLabel.left;
        _addressLabel.top = _nameLabel.bottom+10;
        _addressLabel.height  = 15;
        _addressLabel.text = @"江苏省南京市雨花台区宁双路28号汇智大厦1106室";
        [_addressLabel sizeToFit];
        [bottomView addSubview:_addressLabel];
        
        
        UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 64, SCREEN_WIDTH-15, 1)];
        lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView];
        
        
        [bottomView addSubview:self.addressSelectBtn];
        
        
       UILabel * setDefaultLabel = [[UILabel alloc] init];
        setDefaultLabel.backgroundColor = [UIColor clearColor];
        setDefaultLabel.numberOfLines = 1;
        setDefaultLabel.textAlignment = NSTextAlignmentLeft;
        setDefaultLabel.textColor = kApp_Corlor_8;
        setDefaultLabel.font = FONT_TITLE(kFont_Size_5);
        setDefaultLabel.width = 80;
        setDefaultLabel.left = self.addressSelectBtn.right+5;
        setDefaultLabel.height  = 15;
        setDefaultLabel.text = @"设为默认";
        [setDefaultLabel sizeToFit];
        setDefaultLabel.centerY = 81.5;
        [bottomView addSubview:setDefaultLabel];

        UIButton *deleteBtn = [Utility rightViewWithimage:@"personal__address_delete" andTitle:@"删除" target:self action:@selector(deleteAddress) forControlEvents:UIControlEventTouchUpInside];
        deleteBtn.centerY = setDefaultLabel.centerY;
        deleteBtn.right = SCREEN_WIDTH - 15;
        [bottomView addSubview:deleteBtn];
        
        UIButton *editBtn = [Utility rightViewWithimage:@"personal__address_edit" andTitle:@"编辑" target:self action:@selector(deleteAddress) forControlEvents:UIControlEventTouchUpInside];
        editBtn.centerY = deleteBtn.centerY;
        editBtn.right = deleteBtn.left - 15;
        [bottomView addSubview:editBtn];
        
        UIView  *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 97, SCREEN_WIDTH, 1)];
        lineView1.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView1];
        
        
        UIView  *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 102, SCREEN_WIDTH, 1)];
        lineView2.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [bottomView addSubview:lineView2];
        [self.contentView addSubview:lineView2];
        [self.contentView addSubview:bottomView];
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma  mark buttonaction

-(void)addressSelect{
    
    if (_addressSelectBtn.selected) {
        
         _addressSelectBtn.selected = NO;
    }
    else{
         _addressSelectBtn.selected = YES;
    }
}


-(void)deleteAddress{
    
}

-(void)editAddress{
    
    
}

#pragma get --
-(UIButton *)addressSelectBtn{
    
    if (!_addressSelectBtn) {
        _addressSelectBtn = [[UIButton alloc] init];
        _addressSelectBtn.width = 15;
        _addressSelectBtn.height = 15;
        _addressSelectBtn.left = 15;
        _addressSelectBtn.centerY = 81.5;
        _addressSelectBtn.selected = NO;
        _addressSelectBtn.backgroundColor = [UIColor clearColor];
        [_addressSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_gray"] forState:UIControlStateNormal];
        [_addressSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_red"] forState:UIControlStateSelected];
        [_addressSelectBtn addTarget:self action:@selector(addressSelect) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addressSelectBtn;
}


@end
