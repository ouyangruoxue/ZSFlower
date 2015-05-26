//
//  CreateNewAddressCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/26.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "CreateNewAddressCell.h"

@implementation CreateNewAddressCell


-(void)dealloc{
    _nameLabel = nil;
    _contentField = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = kApp_Corlor_8;
        _nameLabel.font = FONT_TITLE(kFont_Size_5);
        _nameLabel.width = SCREEN_WIDTH-60-70;
        _nameLabel.left = 15;
        _nameLabel.height = 40;
        _nameLabel.centerY = 20;
        [self.contentView addSubview:_nameLabel];
        
        _contentField  = [[UITextField alloc] initWithFrame:CGRectMake(_nameLabel.right, 0, 200, 40)];
        _contentField.font = FONT_TITLE(kFont_Size_5);
        _contentField.centerY = 20;
        [self.contentView addSubview:_contentField];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5)];
        lineView.backgroundColor = kApp_Corlor_8;
        [self.contentView addSubview:lineView];
        
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _contentField.left = _nameLabel.right;
    _nameLabel.centerY = 20;
}

@end
