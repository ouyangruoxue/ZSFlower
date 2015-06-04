//
//  AddBankCardCodeViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/4.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AddBankCardCodeViewController.h"

@interface AddBankCardCodeViewController ()
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *nextStepBtn;
@property(nonatomic,strong)NSTimer  *resendCodeTimer;
@property(nonatomic,assign)NSInteger canresendSeconds;
@property(nonatomic,strong)UIButton *getVerificodeBtn;
@property(nonatomic,strong)UITextField *VerificodeField;
@property(nonatomic,strong)UILabel *mobileAlertLabel;
@property(nonatomic,strong)UIImageView *verifiBottomimage;
@end

@implementation AddBankCardCodeViewController

-(void)dealloc{
    if ([_resendCodeTimer isValid]) {
        [_resendCodeTimer invalidate];
        _resendCodeTimer = nil;
    }

    _backBtn = nil;
    _nextStepBtn = nil;
    _getVerificodeBtn = nil;
    _verifiBottomimage = nil;
    _VerificodeField = nil;
    _mobileAlertLabel =nil;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"填写银行卡信息";
    
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
    [self.topContainerView addSubview:lineView];
    
     [self setTimerForResendButton:-1];
    
    
    [self.containerView addSubview:self.mobileAlertLabel];
    [self.containerView addSubview:self.verifiBottomimage];
    [self.containerView addSubview:self.VerificodeField];
    [self.containerView addSubview:self.getVerificodeBtn];
    [self.containerView addSubview:self.nextStepBtn];
}

#pragma mark NSTimer


- (void)setTimerForResendButton:(NSInteger)second {
    
    if([_resendCodeTimer isValid]){
        [_resendCodeTimer invalidate];
        _resendCodeTimer = nil;
    }
    
    //显示重新发送倒计时的定时器
    _resendCodeTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ontimer) userInfo:nil repeats:YES];
    if(second == -1){
        _canresendSeconds = 60;
    }else{
        _canresendSeconds = second;
    }
}

- (void)ontimer {
    if (_canresendSeconds >0){
        [_getVerificodeBtn setTitle:[NSString stringWithFormat:@"重新发送(%ld)", (long)_canresendSeconds] forState:UIControlStateNormal];
        _getVerificodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
        _getVerificodeBtn.enabled = NO;
        _canresendSeconds --;
    } else {
        [_getVerificodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getVerificodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"47c535"];
        _getVerificodeBtn.enabled = YES;
        if ([_resendCodeTimer isValid]) {
            [_resendCodeTimer invalidate];
            _resendCodeTimer = nil;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark buttonaction

-(void)nextStepAction{
    
    if (_VerificodeField.text.length == 0) {
        
        [PopupNotify showMessage:@"验证码不能为空"];
        return;
    }
    
}

-(void)getVerificode{
    
}

#pragma mark get--

-(UILabel *)mobileAlertLabel{
    
    if (!_mobileAlertLabel) {
        _mobileAlertLabel = [[UILabel alloc] init];
        _mobileAlertLabel.font = FONT_TITLE(kFont_Size_5);
        _mobileAlertLabel.text = @"我们已经给您的手机号185****8588发送了短信验证码";
        _mobileAlertLabel.textColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
        _mobileAlertLabel.backgroundColor = [UIColor clearColor];
        [_mobileAlertLabel sizeToFit];
        _mobileAlertLabel.left = 15;
        _mobileAlertLabel.centerY = 22.5;
    }
    return _mobileAlertLabel;
}

-(UIImageView *)verifiBottomimage{
    
    if (!_verifiBottomimage) {
        _verifiBottomimage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 45, SCREEN_WIDTH/375*236, 36)];
        [_verifiBottomimage setImage:[PUUtil stretchImage:IMGNAMED(@"personal__bank_input") capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch]];
    }
    return _verifiBottomimage;
}


-(UITextField *)VerificodeField{
    
    if (!_VerificodeField) {
        
        _VerificodeField = [[UITextField alloc] initWithFrame:CGRectMake(19, 45, SCREEN_WIDTH/375*232, 36)];
        _VerificodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _VerificodeField.backgroundColor = [UIColor clearColor];
        _VerificodeField.font = FONT_TITLE(kFont_Size_2);
        _VerificodeField.placeholder = @"短信验证码";
    }
    return _VerificodeField;
}

-(UIButton *)getVerificodeBtn{
    
    if (!_getVerificodeBtn) {
        _getVerificodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.VerificodeField.right+10, self.VerificodeField.top, SCREEN_WIDTH/375*97, 36)];
        [_getVerificodeBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
        [_getVerificodeBtn setBackgroundColor:[PUUtil getColorByHexadecimalColor:@"47c535"]];
        _getVerificodeBtn.layer.cornerRadius = 2;
        _getVerificodeBtn.layer.masksToBounds = YES;
        _getVerificodeBtn.titleLabel.font = FONT_TITLE(kFont_Size_4);
        [_getVerificodeBtn addTarget:self action:@selector(getVerificode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getVerificodeBtn;
}


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


-(UIButton *)nextStepBtn{
    if (!_nextStepBtn) {
        _nextStepBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 140, SCREEN_WIDTH-30, 45)];
        [_nextStepBtn setBackgroundImage:[PUUtil stretchImage:IMGNAMED(@"loginBtn") capInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_nextStepBtn setBackgroundImage:[PUUtil stretchImage:IMGNAMED(@"personal__bank_buttom") capInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch] forState:UIControlStateDisabled];
        [_nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextStepBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
        [_nextStepBtn addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepBtn;
}

@end
