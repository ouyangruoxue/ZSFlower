//
//  BaseViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end




@implementation BaseViewController

#pragma mark - memory  management
- (void)dealloc {
  [self releaseView];
}

- (void)releaseView {
 
}

#pragma mark - init 

- (id)init {
    self = [super init];
    if (self) {
        self.titleColor = [UIColor blackColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarBtnClickAction
{
    
}


#pragma mark -  for navigation struct ,would be override by sub class

#pragma mark - getter
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topImageView.height, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

- (UIImageView *)topImageView {
    if (!_topImageView) {
        CGFloat  height = 44;
        if (IOS7_OR_LATER) {
            height = 64;
        }
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
        _topImageView.userInteractionEnabled = YES;
        _topImageView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"47c535"];
        
        self.topContainerView.top = height - self.topContainerView.height;
        [_topImageView addSubview:self.topContainerView];
        
        [self.view addSubview:_topImageView];
    }
    return _topImageView;
}

- (UIView *)topContainerView {
    if (!_topContainerView) {
        _topContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _topContainerView.userInteractionEnabled = YES;
        _topContainerView.backgroundColor = [UIColor clearColor];
        [_topContainerView addSubview:self.titleLabel];
    }
    return _topContainerView;
}

- (UIImageView *)logo {
  if (!_logo) {
    _logo = [[UIImageView alloc]initWithFrame:CGRectMake(self.backButton.right+((self.titleLabel.left-self.backButton.right)-45)/2-10, 0, 45, 45)];
    _logo.backgroundColor = [UIColor clearColor];
    [self.topContainerView addSubview:self.logo];
    
    [_logo setUserInteractionEnabled:YES];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.exclusiveTouch = YES;
    btn.backgroundColor = [UIColor clearColor];
    btn.frame = CGRectMake(0, 0, _logo.width, _logo.height);
    [btn addTarget:self action:@selector(gotoLogoWebView) forControlEvents:UIControlEventTouchUpInside];
    [_logo addSubview:btn];
  }
  return _logo;
}


- (void)gotoLogoWebView {
  //would recover by subclass,just put here to avoid crash
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel sizeToFit];
        _titleLabel.width = SCREEN_WIDTH/2;
        _titleLabel.height = 30;
        _titleLabel.top = 7;
        _titleLabel.centerX = SCREEN_WIDTH/2;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeCenter];
        _titleLabel.textColor = kColorForTitleLabel;
        _titleLabel.font = kSizeFontForTitleLabel;
    }
    return _titleLabel;
}

- (UIButton *)backButton {
    if (!_backButton) {
        UIImage  *img = IMGNAMED(@"btn_back");
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.exclusiveTouch = YES;
        _backButton.backgroundColor = [UIColor clearColor];
        _backButton.frame = CGRectMake(0, floorf((self.topContainerView.height-img.size.height)/2), img.size.width, img.size.height);
        [_backButton setBackgroundImage:img forState:UIControlStateNormal];
        [_backButton setBackgroundImage:IMGNAMED(@"btn_back_select") forState:UIControlStateSelected];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _backButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];

        [_rightButton setExclusiveTouch:YES];
        [_rightButton.titleLabel setFont:FONT_TITLE(kFont_Size_1)];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin)];
        _rightButton.frame = CGRectMake(0, 0, 60, 45);
        _rightButton.right = SCREEN_WIDTH-10;
        [_rightButton addTarget:self action:@selector(rightBarBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
        [self.topContainerView addSubview:_rightButton];
    }
    return _rightButton;
}


#pragma mark - getter
- (void)setRightBarButtonTitle:(NSString *)rightBarButtonTitle {
    if(_rightBarButtonTitle != rightBarButtonTitle){
        _rightBarButtonTitle = rightBarButtonTitle;
        
        [self.rightButton setTitle:rightBarButtonTitle forState:UIControlStateNormal];
        CGRect frame = [self.rightButton frame];
        [self.rightButton sizeToFit];
        CGRect frameNew = [self.rightButton frame];
        float addWidth = frameNew.size.width - frame.size.width;
        float w = frame.size.width + (addWidth > 0 ? ( addWidth + 12 ) : 0 );
        [self.rightButton setFrame:CGRectMake(SCREEN_WIDTH-w-5, (self.topContainerView.bounds.size.height-frame.size.height)/2, w, frame.size.height)];
        
    }
}

- (void)setTitleText:(NSString *)titleText {
    if ([titleText length]<=0) {
        self.titleLabel.text = @"";
    }else{
        if(_titleText != titleText){
            _titleText = titleText;
        }
        [self.titleLabel setText:titleText];
        CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, self.titleLabel.height)];
        CGRect  frame = self.titleLabel.frame;
        frame.size.width = size.width;
        self.titleLabel.frame = frame;
        self.titleLabel.centerX = SCREEN_WIDTH/2;
    }
}

@end
