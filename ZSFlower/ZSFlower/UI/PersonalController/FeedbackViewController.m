//
//  FeedbackViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/15.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "FeedbackViewController.h"
#import "FeedBackSelectTypeView.h"
@interface FeedbackViewController ()<FeedBackTypeDelegate> {
    

}
@property(nonatomic,strong)    UIButton *feedBackTypeBtn;
@property(nonatomic,strong)  UITextField *contactWay;
@property(nonatomic,strong) UITextView *feedContent;
@end

@implementation FeedbackViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"意见反馈";
    self.rightBarButtonTitle = @"提交";
    //[self.rightButton setTitleColor:[PUUtil getColorByHexadecimalColor:@"808080"] forState:UIControlStateNormal];
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self createUI];
}

-(void)createUI{
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    topView.backgroundColor = kApp_Corlor_1;
    UIView *topBottomlineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 1)];
     topBottomlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [topView addSubview:topBottomlineView];
    
    UIView *toplineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    toplineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [topView addSubview:toplineView];
    
    
    UILabel *topTitle = [[UILabel alloc] init];
    topTitle.backgroundColor = [UIColor clearColor];
    topTitle.numberOfLines = 1;
    topTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    topTitle.textAlignment = NSTextAlignmentLeft;
    topTitle.textColor = [PUUtil getColorByHexadecimalColor:@"808080"];
    topTitle.font = FONT_TITLE(kFont_Size_2);
    topTitle.width = 80;
    topTitle.left = 15;
    topTitle.height  = 20;
    topTitle.text = @"反馈类型：";
    [topTitle sizeToFit];
    topTitle.centerY = topView.height/2;
    [topView addSubview:topTitle];
    
    self.feedBackTypeBtn.centerY = topView.height/2;
    self.feedBackTypeBtn.left = topTitle.right+20;
    [topView addSubview:self.feedBackTypeBtn];

    
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 55, SCREEN_WIDTH, 127)];
    centerView.backgroundColor = kApp_Corlor_1;
    
    UIView *ceneterBottomlineView = [[UIView alloc] initWithFrame:CGRectMake(0, 126, SCREEN_WIDTH, 1)];
    ceneterBottomlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [centerView addSubview:ceneterBottomlineView];
    
    UIView *centerToplineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    centerToplineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [centerView addSubview:centerToplineView];

    
    
    
    UILabel *centerTitle = [[UILabel alloc] init];
    centerTitle.backgroundColor = [UIColor clearColor];
    centerTitle.numberOfLines = 1;
    centerTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    centerTitle.textAlignment = NSTextAlignmentLeft;
    centerTitle.textColor = [PUUtil getColorByHexadecimalColor:@"808080"];
    centerTitle.font = FONT_TITLE(kFont_Size_2);
    centerTitle.width = 80;
    centerTitle.left = 15;
    centerTitle.height  = 20;
    centerTitle.text = @"反馈内容：";
    [centerTitle sizeToFit];
    centerTitle.centerY = topView.height/2;
    [centerView addSubview:centerTitle];

    UIImageView *centerImage = [[UIImageView alloc] initWithImage: IMGNAMED(@"personal__Opinion_icon02")];
    centerImage.left = centerTitle.right+20;
    centerImage.top = centerTitle.top;
    [centerView addSubview:centerImage];
    self.feedContent.left = centerTitle.right+20;
    self.feedContent.top = centerTitle.top;
    [centerView addSubview:self.feedContent];
    
    
    
    UIView *BottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 187, SCREEN_WIDTH, 45)];
    BottomView.backgroundColor = kApp_Corlor_1;
    
    UIView *bottomBottomlineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 1)];
    bottomBottomlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [BottomView addSubview:bottomBottomlineView];
    
    UIView *bottomtoplineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    bottomtoplineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [BottomView addSubview:bottomtoplineView];

    UILabel *bottomTitle = [[UILabel alloc] init];
    bottomTitle.backgroundColor = [UIColor clearColor];
    bottomTitle.numberOfLines = 1;
    bottomTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    bottomTitle.textAlignment = NSTextAlignmentLeft;
    bottomTitle.textColor = [PUUtil getColorByHexadecimalColor:@"808080"];
    bottomTitle.font = FONT_TITLE(kFont_Size_2);
    bottomTitle.width = 80;
    bottomTitle.left = 15;
    bottomTitle.height  = 20;
    bottomTitle.text = @"联系方式：";
    [bottomTitle sizeToFit];
    bottomTitle.centerY = topView.height/2;
    [BottomView addSubview:bottomTitle];
    
    UIImageView *bottomImage = [[UIImageView alloc] initWithImage: IMGNAMED(@"personal__Opinion_icon03")];
    bottomImage.left = centerTitle.right+20;
    bottomImage.top = centerTitle.top;
    bottomImage.centerY = BottomView.height/2;
    [BottomView addSubview:bottomImage];
    self.contactWay.left = centerTitle.right+22;
    self.contactWay.top = centerTitle.top;
    self.contactWay.centerY = BottomView.height/2;
    [BottomView addSubview:self.contactWay];

    
    [self.containerView addSubview:topView];
    [self.containerView addSubview:centerView];
    [self.containerView addSubview:BottomView];
}

#pragma mark buttonAction

-(void)rightBarBtnClickAction{
    NSLog(@"提交");
}

-(void)selectTypeAction{
    
    [FeedBackSelectTypeView viewWithDelegate:self];
    
}

#pragma mark feedbackDelegate

-(void)didSelectType:(NSString *)selectValue{
    
    [_feedBackTypeBtn setTitle:selectValue forState:UIControlStateNormal];
}

#pragma mark get
-(UIButton *)feedBackTypeBtn{
    
    if (!_feedBackTypeBtn) {
        _feedBackTypeBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, 91, 30)];
        [_feedBackTypeBtn setTitle:@"功能意见" forState:UIControlStateNormal];
        _feedBackTypeBtn.titleLabel.font = FONT_TITLE(kFont_Size_2);
        [_feedBackTypeBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"808080"] forState:UIControlStateNormal];
        [_feedBackTypeBtn setBackgroundImage:[UIImage imageNamed:@"personal__Opinion_icon01"] forState:UIControlStateNormal];
        [_feedBackTypeBtn addTarget:self action:@selector(selectTypeAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _feedBackTypeBtn;
}

-(UITextField *)contactWay{
    
    if (!_contactWay) {
        _contactWay = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 186, 29)];
        _contactWay.clearButtonMode = UITextFieldViewModeWhileEditing;
        _contactWay.backgroundColor = [UIColor clearColor];
        _contactWay.font = FONT_TITLE(kFont_Size_2);
        _contactWay.placeholder = @"您的姓名，手机，邮箱等";
    }
    return _contactWay;
}


-(UITextView *)feedContent{
    
    if (!_feedContent) {
        _feedContent = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 186, 93)];
        _feedContent.dataDetectorTypes = UIDataDetectorTypeNone;
        _feedContent.backgroundColor = [UIColor clearColor];
        _feedContent.font = FONT_TITLE(kFont_Size_14);
    }
    return _feedContent;
}

@end
