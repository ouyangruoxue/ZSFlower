//
//  SetNickNameViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/4.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "SetNickNameViewController.h"

@interface SetNickNameViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITextField *nickNameField;
@property(nonatomic,strong)UILabel *alertLabel;
@end

@implementation SetNickNameViewController

-(void)dealloc{
    
    _backBtn = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"修改昵称";
    [self.rightButton setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[PUUtil getColorByHexadecimalColor:@"b2b2b2"] forState:UIControlStateDisabled];
    self.rightBarButtonTitle = @"确定";
    self.rightButton.enabled = NO;
    
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
    [self.topContainerView addSubview:lineView];
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    bottomView.backgroundColor = kApp_Corlor_1;
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, bottomView.height-0.5, SCREEN_WIDTH, 0.5)];
    lineView1.backgroundColor = kApp_Corlor_8;
    lineView1.alpha = 0.3;
    [bottomView addSubview:self.nickNameField];
    [bottomView addSubview:lineView1];
    [self.containerView addSubview:bottomView];
    
    [self.containerView addSubview:self.alertLabel];
    
}


-(void)rightBarBtnClickAction{
    
    NSLog(@"确定");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark uitextfieDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //int max = 16;
    NSMutableString *newtext =[NSMutableString stringWithString:textField.text];
    [newtext replaceCharactersInRange:range withString:string];
    
    if (newtext.length>0) {
        self.rightButton.enabled = YES;
    }
    else{
        self.rightButton.enabled = NO;
    }
    return YES;
    
}

#pragma mark get --

-(UIButton *)backBtn{
    
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.exclusiveTouch = YES;
        _backBtn.backgroundColor = [UIColor clearColor];
        _backBtn.frame = CGRectMake(0, 0, 40, 45);
        [_backBtn setImage:IMGNAMED(@"getback_back") forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(UITextField *)nickNameField{
    
    if (!_nickNameField) {
        
        _nickNameField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30, 40)];
        _nickNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _nickNameField.backgroundColor = [UIColor clearColor];
        _nickNameField.font = FONT_TITLE(kFont_Size_2);
        _nickNameField.delegate = self;
        _nickNameField.placeholder = @"请输入昵称";

    }
    return _nickNameField;
}


-(UILabel *)alertLabel{
    
    if (!_alertLabel) {
        _alertLabel = [[UILabel alloc] init];
        _alertLabel.backgroundColor = [UIColor clearColor];
        _alertLabel.textColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
        _alertLabel.font = FONT_TITLE(kFont_Size_5);
        _alertLabel.numberOfLines = 0;
        _alertLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _alertLabel.width = SCREEN_WIDTH-30;
        _alertLabel.top = 45;
        _alertLabel.left = 15;
        _alertLabel.text =@"6-16位，可由中英文、数字和“_”组成";
        [_alertLabel sizeToFit];
    }
    return _alertLabel;
}


@end
