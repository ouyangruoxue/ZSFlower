//
//  SettingTableViewCell.h
//  games
//
//  Created by xuesai on 13-6-27.
//
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic, strong) UIActivityIndicatorView            *indicatorView;

@property (nonatomic ,strong) UIImageView                        *redpoint;
@property (nonatomic, strong) UILabel                            *nameLabel;
@property (nonatomic,assign ) NSInteger                          cell_height;
@property(nonatomic,strong)UIView   *toplineView;
@property(nonatomic,strong)UIView   *bottomlineView;
@end
