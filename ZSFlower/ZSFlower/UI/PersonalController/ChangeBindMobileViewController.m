//
//  ChangeBindMobileViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/22.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ChangeBindMobileViewController.h"
#import "CustomBadge.h"
@interface ChangeBindMobileViewController ()<UIAlertViewDelegate>
@property(nonatomic,strong)CustomBadge *stepOne;
@property(nonatomic,strong)CustomBadge *stepTwo;
@property(nonatomic,strong)CustomBadge *stepThree;
@property(nonatomic,strong)UILabel  *authenticationLabel;
@property(nonatomic,strong)UILabel  *changeMobileLabel;
@property(nonatomic,strong)UILabel  *completeLabel;
@property(nonatomic,strong)UILabel  *mobileAlertLabel;//提示已发送短信到手机
@property(nonatomic,strong)UILabel  *timeAlertLabel;//提示120秒
@property(nonatomic,strong)UITextField  *VerificodeField;
@property(nonatomic,strong)UITextField  *mobileTextField;
@property(nonatomic,strong)UIButton  *getVerificodeBtn;
@property(nonatomic,strong)UIButton  *nextStepBtn;
@property(nonatomic,assign)NSInteger stepIndex;
@property(nonatomic,strong)UIImageView *verifiBottomimage;
@property(nonatomic,strong)UIImageView *messageCodeBottom;
@property(nonatomic,strong)UITextField *messageCodeField;;
@property(nonatomic,strong)NSTimer  *resendPasswordTimer;
@property(nonatomic,assign)NSInteger canresendSeconds;
@property(nonatomic,strong)UIImageView *completeImage;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIButton *verifByPatPassword;
@end

@implementation ChangeBindMobileViewController
-(void)dealloc{
    _stepOne = nil;
    _stepTwo = nil;
    _stepThree = nil;
    _authenticationLabel = nil;
    _changeMobileLabel = nil;
    _completeLabel = nil;
    _mobileAlertLabel = nil;//提示已发送短信到手机
    _timeAlertLabel = nil;//提示120秒
    _VerificodeField = nil;
    _getVerificodeBtn  = nil;
    _nextStepBtn = nil;
    _verifiBottomimage = nil;
    if([_resendPasswordTimer isValid]){
        [_resendPasswordTimer invalidate];
        _resendPasswordTimer = nil;
    }
    _mobileTextField = nil;
    _verifByPatPassword = nil;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initUI{
    
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"修改手机验证";
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    _bottomView.backgroundColor = kApp_Corlor_1;
    
    [self.topContainerView addSubview:self.backButton];
    [_bottomView addSubview:self.stepOne];
    [_bottomView addSubview:self.authenticationLabel];
    [_bottomView addSubview:self.stepTwo];
    [_bottomView addSubview:self.changeMobileLabel];
    [_bottomView addSubview:self.stepThree];
    [_bottomView addSubview:self.completeLabel];
    [_bottomView addSubview:self.mobileAlertLabel];
    [_bottomView addSubview:self.verifiBottomimage];
    [_bottomView addSubview:self.VerificodeField];
    [_bottomView addSubview:self.getVerificodeBtn];
    [_bottomView addSubview:self.timeAlertLabel];
    [_bottomView addSubview:self.messageCodeBottom];
    [_bottomView addSubview:self.messageCodeField];
    [_bottomView addSubview:self.mobileTextField];
    [_bottomView addSubview:self.completeImage];
    [self.containerView addSubview:_bottomView];
    [self.containerView addSubview:self.nextStepBtn];
    [self.containerView addSubview:self.verifByPatPassword];
    [self setTimerForResendButton:-1];
    _stepIndex = 1;
}


- (void)setTimerForResendButton:(NSInteger)second {
    
    if([_resendPasswordTimer isValid]){
        [_resendPasswordTimer invalidate];
        _resendPasswordTimer = nil;
    }
    
    //显示重新发送倒计时的定时器
    _resendPasswordTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ontimer) userInfo:nil repeats:YES];
    if(second == -1){
        _canresendSeconds = 120;
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
        if ([_resendPasswordTimer isValid]) {
            [_resendPasswordTimer invalidate];
            _resendPasswordTimer = nil;
        }
    }
}


#pragma mark uialrtDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark Btnaction

-(void)nextStep{
    
    if (_stepIndex == 1) {
        if ([NSString isBlankString: _VerificodeField.text]) {
            [PopupNotify showMessage:@"请填写验证码"];
            return;
        }
        
        _stepIndex = 2;
        _changeMobileLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _mobileAlertLabel.text = @"请输入新的手机号码：";
        _VerificodeField.hidden = YES;
        _timeAlertLabel.hidden = YES;
        _mobileTextField.hidden = NO;
        [_getVerificodeBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
        _getVerificodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"47c535"];
        _getVerificodeBtn.enabled = YES;
        _stepTwo.badgeFrameColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _stepTwo.badgeInsetColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        if ([_resendPasswordTimer isValid]) {
            [_resendPasswordTimer invalidate];
            _resendPasswordTimer = nil;
        }
        _messageCodeBottom.hidden = NO;
        _messageCodeField.hidden = NO;
        _verifByPatPassword.hidden = YES;
        [_stepTwo setNeedsDisplay];
    }
    else if(_stepIndex == 2){
        
        _stepIndex = 3;
        _stepThree.badgeFrameColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _stepThree.badgeInsetColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _completeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        [_stepThree setNeedsDisplay];
        _getVerificodeBtn.hidden = YES;
        _mobileTextField.hidden = YES;
        _messageCodeBottom.hidden = YES;
        _verifiBottomimage.hidden = YES;
        _completeImage.hidden = NO;
        _messageCodeField.hidden = YES;
        _mobileAlertLabel.hidden = YES;
        _nextStepBtn.hidden = YES;
        
        UILabel * label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = kApp_Corlor_8;
        label.font = FONT_TITLE(kFont_Size_5);
        label.text = @"手机验证已经完成";
        [label sizeToFit];
        label.centerX = SCREEN_WIDTH/2;
        label.top = _completeImage.bottom+5;
        [_bottomView addSubview:label];
        
    }
    
}

-(void)verifByPatPasswordAction{
    
    
}

-(void)getVerificode{
    
    
}


-(void)back{
    
    if (_stepIndex<3) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"手机验证未完成，确定退出？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",@"取消", nil];
        [alert show];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark get-


-(UILabel *)authenticationLabel{
    
    if (!_authenticationLabel) {
        _authenticationLabel = [[UILabel alloc] init];
        _authenticationLabel.font = FONT_TITLE(kFont_Size_5);
        _authenticationLabel.text = @"身份验证";
        _authenticationLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _authenticationLabel.backgroundColor = [UIColor clearColor];
        [_authenticationLabel sizeToFit];
        _authenticationLabel.centerX = self.stepOne.centerX;
        _authenticationLabel.top = _stepOne.bottom+5;
    }
    return _authenticationLabel;
}

-(UILabel *)changeMobileLabel{
    
    if (!_changeMobileLabel) {
        _changeMobileLabel = [[UILabel alloc] init];
        _changeMobileLabel.font = FONT_TITLE(kFont_Size_5);
        _changeMobileLabel.text = @"修改已验证手机";
        _changeMobileLabel.textColor =  [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
        _changeMobileLabel.backgroundColor = [UIColor clearColor];
        [_changeMobileLabel sizeToFit];
        _changeMobileLabel.centerX = self.stepTwo.centerX;
        _changeMobileLabel.top = _stepTwo.bottom+5;
    }
    return _changeMobileLabel;
}


-(UILabel *)completeLabel{
    
    if (!_completeLabel) {
        _completeLabel = [[UILabel alloc] init];
        _completeLabel.font = FONT_TITLE(kFont_Size_5);
        _completeLabel.text = @"完成";
        _completeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
        _completeLabel.backgroundColor = [UIColor clearColor];
        [_completeLabel sizeToFit];
        _completeLabel.centerX = self.stepThree.centerX;
        _completeLabel.top = _stepThree.bottom+5;
    }
    return _completeLabel;
}

-(UILabel *)mobileAlertLabel{
    
    if (!_mobileAlertLabel) {
        _mobileAlertLabel = [[UILabel alloc] init];
        _mobileAlertLabel.font = FONT_TITLE(kFont_Size_5);
        _mobileAlertLabel.text = @"我们已经给您的手机号185****8588发送了短信验证码";
        _mobileAlertLabel.textColor = kApp_Corlor_2;
        _mobileAlertLabel.backgroundColor = [UIColor clearColor];
        [_mobileAlertLabel sizeToFit];
        _mobileAlertLabel.left = 15;
        _mobileAlertLabel.top = self.authenticationLabel.bottom+25;
    }
    return _mobileAlertLabel;
}

-(UIImageView *)verifiBottomimage{
    
    if (!_verifiBottomimage) {
        _verifiBottomimage = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.mobileAlertLabel.bottom+15, SCREEN_WIDTH/375*232, 25)];
        [_verifiBottomimage setImage:[PUUtil stretchImage:IMGNAMED(@"personal__bank_input") capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch]];
    }
    return _verifiBottomimage;
}


-(UITextField *)VerificodeField{

    if (!_VerificodeField) {
        
        _VerificodeField = [[UITextField alloc] initWithFrame:CGRectMake(19, self.mobileAlertLabel.bottom+15, SCREEN_WIDTH/375*228, 25)];
        _VerificodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _VerificodeField.backgroundColor = [UIColor clearColor];
        _VerificodeField.font = FONT_TITLE(kFont_Size_2);
        _VerificodeField.placeholder = @"填写手机短信验证码";
    }
    return _VerificodeField;
}

-(UITextField *)mobileTextField{

    if (!_mobileTextField) {
        
        _mobileTextField = [[UITextField alloc] initWithFrame:CGRectMake(19, self.mobileAlertLabel.bottom+15, SCREEN_WIDTH/375*228, 25)];
        _mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _mobileTextField.backgroundColor = [UIColor clearColor];
        _mobileTextField.font = FONT_TITLE(kFont_Size_2);
        _mobileTextField.placeholder = @"填写手机号码";
        _mobileTextField.hidden =YES;
    }
    return _mobileTextField;
}


-(UILabel *)timeAlertLabel{
    
    if (!_timeAlertLabel) {
        _timeAlertLabel = [[UILabel alloc] init];
        _timeAlertLabel.numberOfLines = 0;
        _timeAlertLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _timeAlertLabel.font = FONT_TITLE(kFont_Size_5);
        _timeAlertLabel.text = @"短信已经发送到您的手机，如在120秒内还没收到短信验证码，请重新获取验证码";
        _timeAlertLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _timeAlertLabel.backgroundColor = [UIColor clearColor];
        _timeAlertLabel.left = 15;
        _timeAlertLabel.width = SCREEN_WIDTH - 30;
        _timeAlertLabel.top = self.VerificodeField.bottom+15;
        [_timeAlertLabel sizeToFit];
    }
    return _timeAlertLabel;
}

-(UIImageView *)messageCodeBottom{
    
    if (!_messageCodeBottom) {
        _messageCodeBottom = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.VerificodeField.bottom+15, SCREEN_WIDTH-30, 25)];
        [_messageCodeBottom setImage:[PUUtil stretchImage:IMGNAMED(@"personal__bank_input") capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch]];
        _messageCodeBottom.hidden = YES;
    }
    return _messageCodeBottom;
}

-(UIImageView *)completeImage{
    
    if (!_completeImage) {
        _completeImage = [[UIImageView alloc] initWithImage:[PUUtil stretchImage:IMGNAMED(@"personal__phoneVerification_complete") capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch]];
        _completeImage.hidden = YES;
    }
    _completeImage.centerX = SCREEN_WIDTH/2;
    _completeImage.centerY = 130;
    return _completeImage;
}


-(UITextField *)messageCodeField{
    //personal__bank_input//
    if (!_messageCodeField) {
        
        _messageCodeField = [[UITextField alloc] initWithFrame:CGRectMake(19, self.VerificodeField.bottom+15, SCREEN_WIDTH -38, 25)];
        _messageCodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _messageCodeField.backgroundColor = [UIColor clearColor];
        _messageCodeField.font = FONT_TITLE(kFont_Size_2);
        _messageCodeField.placeholder = @"短信验证码";
        _messageCodeField.hidden = YES;
    }
    return _messageCodeField;
}



-(CustomBadge *)stepOne{
    
    if (!_stepOne) {
        _stepOne = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%d",1]
                                      withStringColor:[UIColor whiteColor]
                                       withInsetColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                       withBadgeFrame:YES
                                  withBadgeFrameColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                            withScale:2
                                          withShining:YES];
        _stepOne.centerX = SCREEN_WIDTH/6;
        _stepOne.centerY = 40;
    }
    return _stepOne;
    
}


-(CustomBadge *)stepTwo{
    
    if (!_stepTwo) {
        _stepTwo = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%d",2]
                                      withStringColor:[UIColor whiteColor]
                                       withInsetColor:[PUUtil getColorByHexadecimalColor:@"b2b2b2"]
                                       withBadgeFrame:YES
                                  withBadgeFrameColor:[PUUtil getColorByHexadecimalColor:@"b2b2b2"]
                                            withScale:2
                                          withShining:YES];
        _stepTwo.centerX = SCREEN_WIDTH/2;
        _stepTwo.centerY = 40;

    }
    return _stepTwo;
    
}


-(CustomBadge *)stepThree{
    
    if (!_stepThree) {
        _stepThree = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%d",3]
                                      withStringColor:[UIColor whiteColor]
                                       withInsetColor:[PUUtil getColorByHexadecimalColor:@"b2b2b2"]
                                       withBadgeFrame:YES
                                  withBadgeFrameColor:[PUUtil getColorByHexadecimalColor:@"b2b2b2"]
                                            withScale:2
                                          withShining:YES];
        _stepThree.centerX = SCREEN_WIDTH/6*5;
        _stepThree.centerY = 40;

    }
    return _stepThree;
    
}


-(UIButton *)getVerificodeBtn{
    
    if (!_getVerificodeBtn) {
        _getVerificodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.VerificodeField.right+10, self.VerificodeField.top-2, SCREEN_WIDTH/375*106, 27)];
        [_getVerificodeBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
        [_getVerificodeBtn setBackgroundColor:[PUUtil getColorByHexadecimalColor:@"47c535"]];
        _getVerificodeBtn.layer.cornerRadius = 2;
        _getVerificodeBtn.layer.masksToBounds = YES;
        _getVerificodeBtn.titleLabel.font = FONT_TITLE(kFont_Size_4);
        [_getVerificodeBtn addTarget:self action:@selector(getVerificode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getVerificodeBtn;
}

-(UIButton *)nextStepBtn{
    
    if (!_nextStepBtn) {
        _nextStepBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 220, SCREEN_WIDTH-30, 45)];
        [_nextStepBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
        [_nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextStepBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
        [_nextStepBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepBtn;
}

-(UIButton *)verifByPatPassword{
    
    if (!_verifByPatPassword) {
        _verifByPatPassword = [[UIButton alloc] initWithFrame:CGRectMake(15, self.nextStepBtn.bottom+10, 120, 20)];
        [_verifByPatPassword setTitle:@"通过支付密码来验证" forState:UIControlStateNormal];
        _verifByPatPassword.titleLabel.font = FONT_TITLE(kFont_Size_5);
        _verifByPatPassword.titleLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeLeft];
        [_verifByPatPassword setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [_verifByPatPassword addTarget:self action:@selector(verifByPatPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verifByPatPassword;
}

@end
