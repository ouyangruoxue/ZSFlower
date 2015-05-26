//
//  MessageTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell


-(void)dealloc{
    
    _messageIconImage = nil;
    _messageTitle = nil;
    _descriptionInfo = nil;
    _timeLabel = nil;
    _badageView = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //商品图片
        _messageIconImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 44, 44)];
        _messageIconImage.contentMode = UIViewContentModeScaleAspectFit;
        _messageIconImage.backgroundColor = [UIColor clearColor];
        _messageIconImage.centerY = 34;
        _messageIconImage.layer.cornerRadius = 4;
        _messageIconImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_messageIconImage];
        
        
        _messageTitle = [[UILabel alloc] init];
        _messageTitle.backgroundColor = [UIColor clearColor];
        _messageTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        _messageTitle.textAlignment = NSTextAlignmentLeft;
        _messageTitle.textColor = kApp_Corlor_2;
        _messageTitle.font = FONT_TITLE(kFont_Size_14);
        _messageTitle.width = SCREEN_WIDTH-60-70;
        _messageTitle.left = _messageIconImage.right+15;
        _messageTitle.top = _messageIconImage.top+5;
        _messageTitle.height  = 20;
        _messageTitle.text = @"星宿老怪，法力无边";
        [self.contentView addSubview:_messageTitle];
        
        
        _descriptionInfo = [[UILabel alloc] init];
        _descriptionInfo.backgroundColor = [UIColor clearColor];
        _descriptionInfo.lineBreakMode = NSLineBreakByTruncatingTail;
        _descriptionInfo.textAlignment = NSTextAlignmentLeft;
        _descriptionInfo.textColor = kApp_Corlor_8;
        _descriptionInfo.font = FONT_TITLE(kFont_Size_6);
        _descriptionInfo.width = SCREEN_WIDTH-60-30-60;
        _descriptionInfo.left = _messageIconImage.right+15;
        _descriptionInfo.bottom = _messageIconImage.bottom-15;
        _descriptionInfo.height  = 15;
        _descriptionInfo.text = @"￥166.00";
        [self.contentView addSubview:_descriptionInfo];
        
        [self.contentView addSubview:self.badageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CustomBadge *)badageView {
    if (_badageView == nil)
    {
        _badageView = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%d",0]
                                         withStringColor:[UIColor whiteColor]
                                          withInsetColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                          withBadgeFrame:YES
                                     withBadgeFrameColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                               withScale:1.5
                                             withShining:YES];
        _badageView.frame = CGRectMake(52, 8, 12, 12);
        [self.contentView addSubview:_badageView];
    }
    return _badageView;
}

#pragma mark - set unread num
-(void)setUnreadNumber:(NSInteger)num {
    if (num == 0) {
        if (_badageView) {
            _badageView.hidden = YES;
        }
        
    }else {
        if (num <= 99) {
            [_badageView autoBadgeSizeWithString:[NSString stringWithFormat:@"%ld",num]];
        }else {
            [_badageView autoBadgeSizeWithString:@"99"];
        }
        self.badageView.hidden = NO;
        [_badageView setNeedsLayout];
        [_badageView setNeedsDisplay];
    }
}

@end
