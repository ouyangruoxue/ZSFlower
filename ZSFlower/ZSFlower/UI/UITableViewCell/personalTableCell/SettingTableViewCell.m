//
//  SettingTableViewCell.m
//  games
//
//  Created by xuesai on 13-6-27.
//
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell
@synthesize indicatorView = _indicatorView;
@synthesize redpoint      = _redpoint;

- (void)dealloc{
  _nameLabel = nil;
  if (_indicatorView.isAnimating) {
    [_indicatorView stopAnimating];
  }
  _indicatorView = nil;
    _redpoint = nil;
    
    _toplineView =nil;
    _bottomlineView = nil;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [UIColor colorWithRed:0.2667 green:0.2667 blue:0.2667 alpha:1];;
        self.textLabel.font = BOLDFONT_TITLE(kFont_Size_14);
        
        _indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.frame = CGRectMake(SCREEN_WIDTH-60, 15, 15, 15);
        [self.contentView addSubview:_indicatorView];
        
         _bottomlineView = [[UIView alloc] initWithFrame:CGRectMake(15, 39, SCREEN_WIDTH-48, 1)];
        _bottomlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:_bottomlineView];
        
        _toplineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        _toplineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:_toplineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
      _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _cell_height?(_cell_height-20)/2:15, 200, 20)];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = RGBCOLOR(0x44, 0x44, 0x44);
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

@end
