//
//  LoginPasswordViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/25.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "LoginPasswordViewController.h"
#import "CustomBadge.h"
@interface LoginPasswordViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)CustomBadge *stepOne;
@property(nonatomic,strong)CustomBadge *stepTwo;
@property(nonatomic,strong)UILabel  *authenticationLabel;
@property(nonatomic,strong)UILabel  *changePasswordLabel;
@property(nonatomic,strong)UILabel  *chooseVerifyTypeTitle;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIButton *chooseVerifyTypeBtn;
@property(nonatomic,strong)UIPickerView *typeView;
@property(nonatomic,strong)UILabel   *alreadyVerifyMobileNum;
@property(nonatomic,strong)UIButton  *getVerificodeBtn;
@property(nonatomic,strong)UIImageView *messageCodeBottom;
@property(nonatomic,strong)UITextField *messageCodeField;

@property(nonatomic,strong)UIImageView *setPasswordBottom;
@property(nonatomic,strong)UITextField *setPasswordField;

@property(nonatomic,strong)UIImageView *verifyPasswordBottom;
@property(nonatomic,strong)UITextField *verifyPasswordField;


@property(nonatomic,strong)UIButton  *nextStepBtn;
@property(nonatomic,assign)NSInteger stepIndex;
@property(nonatomic,strong)NSTimer  *resendPasswordTimer;
@property(nonatomic,assign)NSInteger canresendSeconds;

@property(nonatomic,strong)UIPickerView *typePickView;
@property(nonatomic,strong)UIView *pickHeaderView;
@property(nonatomic,strong)NSArray *changePasswordTypeArr;
@property(nonatomic,assign)BOOL ismobileType;

@property(nonatomic,strong)UIView *pickbottomView;
@end

@implementation LoginPasswordViewController

-(void)dealloc{
    _backBtn = nil;
    _stepOne = nil;
    _stepTwo = nil;
    _authenticationLabel = nil;
    _changePasswordLabel = nil;
    _chooseVerifyTypeTitle = nil;
    _bottomView = nil;
    _chooseVerifyTypeBtn = nil;
    _typeView = nil;
    _alreadyVerifyMobileNum = nil;
    _getVerificodeBtn = nil;
    _messageCodeBottom = nil;
    _messageCodeField = nil;
    
    _setPasswordBottom = nil;
    _setPasswordField = nil;
    
    _verifyPasswordBottom = nil;
    _verifyPasswordField = nil;
    
    _pickbottomView = nil;
    
    _nextStepBtn = nil;
    
    if ([_resendPasswordTimer isValid]) {
        [_resendPasswordTimer invalidate];
        _resendPasswordTimer = nil;
    }
    
    
    _typePickView = nil;
    _pickHeaderView = nil;
    _changePasswordTypeArr = nil;
    _pickbottomView = nil;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


-(void)initUI{
    _stepIndex = 1;
    
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"登陆密码";
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    
    _changePasswordTypeArr = @[@"已验证手机",@"已验证邮箱"];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
    [self.topContainerView addSubview:lineView];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = FONT_TITLE(kFont_Size_3);
    titleLabel.text = @"修改密码";
    titleLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    titleLabel.left = 15;
    titleLabel.centerY = 35/2;
    [self.containerView addSubview:titleLabel];
    
    _ismobileType = YES;
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH, 215)];
    _bottomView.backgroundColor = kApp_Corlor_1;
    
    [_bottomView addSubview:self.stepOne];
    [_bottomView addSubview:self.stepTwo];
    [_bottomView addSubview:self.authenticationLabel];
    [_bottomView addSubview:self.changePasswordLabel];
    [_bottomView addSubview:self.chooseVerifyTypeTitle];
    [_bottomView addSubview:self.chooseVerifyTypeBtn];
    [_bottomView addSubview:self.alreadyVerifyMobileNum];
    [_bottomView addSubview:self.getVerificodeBtn];
    [_bottomView addSubview:self.messageCodeBottom];
    [_bottomView addSubview:self.messageCodeField];
    [_bottomView addSubview:self.setPasswordBottom];
    [_bottomView addSubview:self.setPasswordField];
    
    [_bottomView addSubview:self.verifyPasswordBottom];
    [_bottomView addSubview:self.verifyPasswordField];
    
    [self.containerView addSubview:_bottomView];
    [self.containerView addSubview:self.nextStepBtn];
    
    _pickbottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height)];
    _pickbottomView.hidden = YES;
    _pickbottomView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCancel)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [_pickbottomView addGestureRecognizer:tapGesture];
    
    
    [_pickbottomView addSubview:self.typePickView];
    [_pickbottomView addSubview:self.pickHeaderView];
    
    
    [self.containerView addSubview:_pickbottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark uialrtDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}



#pragma mark NSTimer


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
#pragma mark buttonAction

-(void)nextStep{
    if (_ismobileType) {
        if (_stepIndex == 1) {
            if ([NSString isBlankString: _messageCodeField.text]) {
                [PopupNotify showMessage:@"请填写验证码"];
                return;
            }
            
            _stepIndex = 2;
            _getVerificodeBtn.hidden = YES;
            _chooseVerifyTypeTitle.text = @"设置登陆密码：";
            _alreadyVerifyMobileNum.text = @"重新输入一遍：";
            _verifyPasswordBottom.hidden = NO;
            _verifyPasswordField.hidden = NO;
            _setPasswordBottom.hidden = NO;
            _setPasswordField.hidden = NO;
            
            _chooseVerifyTypeBtn.hidden = YES;
            _stepTwo.badgeFrameColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
            _stepTwo.badgeInsetColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
            if ([_resendPasswordTimer isValid]) {
                [_resendPasswordTimer invalidate];
                _resendPasswordTimer = nil;
            }
            _messageCodeBottom.hidden = NO;
            _messageCodeField.hidden = NO;
            [_stepTwo setNeedsDisplay];
        }
    }
    else{
        
        if (_stepIndex == 1) {
            
        _stepIndex = 2;
        _bottomView .hidden = YES;
            _nextStepBtn.hidden = YES;
        UIView *tempBottom = [[UIView alloc] init];
        tempBottom.width = SCREEN_WIDTH -45;
        tempBottom.centerX  = SCREEN_WIDTH/2;

        tempBottom.top = 50;
        tempBottom.height = 60;
        tempBottom.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        

        
        UILabel *alertLabel = [[UILabel alloc] init];
        alertLabel.font = FONT_TITLE(kFont_Size_3);
        alertLabel.text = @"验证邮件已发送，请前往您的邮箱，登陆并完成验证";
        alertLabel.numberOfLines = 0;
        alertLabel.lineBreakMode = NSLineBreakByWordWrapping;
        alertLabel.width = 200;
        alertLabel.textColor = kApp_Corlor_1;
        alertLabel.backgroundColor = [UIColor clearColor];
        [alertLabel sizeToFit];
        alertLabel.centerX = tempBottom.width/2;
        alertLabel.centerY = tempBottom.height/2;
        [tempBottom addSubview:alertLabel];
        
        [self.containerView addSubview:tempBottom];
        }
    }
}

-(void)chooseChangePasswordType{
    _pickbottomView.hidden = NO;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-216-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _typePickView.top -40;
                     } completion:^(BOOL finished) {
                         
                     }];
    
}


-(void)chooseTypeComplete{
    _pickbottomView.hidden = YES;
    if (_ismobileType) {
        
        _messageCodeBottom.hidden = NO;
        _messageCodeField.hidden = NO;
        _getVerificodeBtn.hidden = NO;
        _alreadyVerifyMobileNum.text = @"已验证手机号：188****8132";
        [_chooseVerifyTypeBtn setTitle:@"已验证手机" forState:UIControlStateNormal];
        [_alreadyVerifyMobileNum sizeToFit];
        [_nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];

    }
    else{
        _messageCodeField.hidden = YES;
        _messageCodeBottom.hidden = YES;
        _getVerificodeBtn.hidden = YES;
        [_chooseVerifyTypeBtn setTitle:@"已验证邮箱" forState:UIControlStateNormal];
        _alreadyVerifyMobileNum.text = @"邮箱地址：188****8132@qq.com";
        [_alreadyVerifyMobileNum sizeToFit];
        [_nextStepBtn setTitle:@"发送验证邮件" forState:UIControlStateNormal];
    }
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _typePickView.top;
                     } completion:^(BOOL finished) {
                         
                     }];
}

-(void)cancelChoosePickView{
    
    _pickbottomView.hidden = YES;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _typePickView.top;
                     } completion:^(BOOL finished) {
                         
                     }];
    
    
}

-(void)tapCancel{
    
    [self cancelChoosePickView];
}

-(void)getVerificode{
   
    [self setTimerForResendButton:-1];
    
}

-(void)back{
    
    if (_stepIndex<2) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"手机验证未完成，确定退出？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",@"取消", nil];
        [alert show];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


#pragma mark PickerViewDataSource---

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

#pragma mark PickerViewDelegate--
// 返回组中的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
    
}
//返回每个item中的title
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_changePasswordTypeArr objectAtIndex:row];
}

//设置列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return SCREEN_WIDTH;
}

//选择行的事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (row == 0) {
        DLog(@"第一行");
        _ismobileType = YES;
    }
    else if (row == 1) {
        DLog(@"第二行");
        _ismobileType = NO;
    }
    
}



#pragma mark  get --


-(CustomBadge *)stepOne{
    
    if (!_stepOne) {
        _stepOne = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%d",1]
                                      withStringColor:[UIColor whiteColor]
                                       withInsetColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                       withBadgeFrame:YES
                                  withBadgeFrameColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                            withScale:2
                                          withShining:YES];
        _stepOne.centerX = SCREEN_WIDTH/4;
        _stepOne.centerY = 20;
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
        _stepTwo.centerX = SCREEN_WIDTH/4*3;
        _stepTwo.centerY = 20;
        
    }
    return _stepTwo;
    
}

-(UILabel *)authenticationLabel{
    
    if (!_authenticationLabel) {
        _authenticationLabel = [[UILabel alloc] init];
        _authenticationLabel.font = FONT_TITLE(kFont_Size_5);
        _authenticationLabel.text = @"验证身份";
        _authenticationLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _authenticationLabel.backgroundColor = [UIColor clearColor];
        [_authenticationLabel sizeToFit];
        _authenticationLabel.centerX = self.stepOne.centerX;
        _authenticationLabel.top = _stepOne.bottom+5;
    }
    return _authenticationLabel;
}

-(UILabel *)changePasswordLabel{
    
    if (!_changePasswordLabel) {
        _changePasswordLabel = [[UILabel alloc] init];
        _changePasswordLabel.font = FONT_TITLE(kFont_Size_5);
        _changePasswordLabel.text = @"修改密码";
        _changePasswordLabel.textColor =  [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
        _changePasswordLabel.backgroundColor = [UIColor clearColor];
        [_changePasswordLabel sizeToFit];
        _changePasswordLabel.centerX = self.stepTwo.centerX;
        _changePasswordLabel.top = _stepTwo.bottom+5;
    }
    return _changePasswordLabel;
}


-(UILabel *)chooseVerifyTypeTitle{
    
    if (!_chooseVerifyTypeTitle) {
        _chooseVerifyTypeTitle = [[UILabel alloc] init];
        _chooseVerifyTypeTitle.font = FONT_TITLE(kFont_Size_4);
        _chooseVerifyTypeTitle.text = @"请选择验证身份的方式";
        _chooseVerifyTypeTitle.textColor = kApp_Corlor_2;
        _chooseVerifyTypeTitle.backgroundColor = [UIColor clearColor];
        [_chooseVerifyTypeTitle sizeToFit];
        _chooseVerifyTypeTitle.left = 15;
        _chooseVerifyTypeTitle.top = self.authenticationLabel.bottom+15;
    }
    return _chooseVerifyTypeTitle;
}


-(UILabel *)alreadyVerifyMobileNum{
    
    if (!_alreadyVerifyMobileNum) {
        _alreadyVerifyMobileNum = [[UILabel alloc] init];
        _alreadyVerifyMobileNum.font = FONT_TITLE(kFont_Size_5);
        _alreadyVerifyMobileNum.text = @"已验证手机号：188****8132";
        _alreadyVerifyMobileNum.textColor = kApp_Corlor_2;
        _alreadyVerifyMobileNum.backgroundColor = [UIColor clearColor];
        [_alreadyVerifyMobileNum sizeToFit];
        _alreadyVerifyMobileNum.left = 15;
        _alreadyVerifyMobileNum.centerY = self.getVerificodeBtn.centerY;
    }
    return _alreadyVerifyMobileNum;
}

-(UIButton *)chooseVerifyTypeBtn{
    
    if (!_chooseVerifyTypeBtn) {
        _chooseVerifyTypeBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.chooseVerifyTypeTitle.bottom+10, SCREEN_WIDTH-30, 25)];
        _chooseVerifyTypeBtn.backgroundColor = [UIColor clearColor];
        [_chooseVerifyTypeBtn setBackgroundImage:[PUUtil stretchImage:[UIImage imageNamed:@"personal__changeloginpassword_type"] capInsets:UIEdgeInsetsMake(10, 10, 10, 40) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_chooseVerifyTypeBtn setTitle:@"已验证手机" forState:UIControlStateNormal];
        [_chooseVerifyTypeBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        _chooseVerifyTypeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _chooseVerifyTypeBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _chooseVerifyTypeBtn.titleLabel.font = FONT_TITLE(kFont_Size_4);
        [_chooseVerifyTypeBtn addTarget:self action:@selector(chooseChangePasswordType) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseVerifyTypeBtn;
}



-(UIImageView *)messageCodeBottom{
    
    if (!_messageCodeBottom) {
        _messageCodeBottom = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.getVerificodeBtn.bottom+15, SCREEN_WIDTH-30, 25)];
        [_messageCodeBottom setImage:[PUUtil stretchImage:IMGNAMED(@"personal__bank_input") capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch]];
        //_messageCodeBottom.hidden = YES;
    }
    return _messageCodeBottom;
}

-(UITextField *)messageCodeField{
    //personal__bank_input//
    if (!_messageCodeField) {
        
        _messageCodeField = [[UITextField alloc] initWithFrame:CGRectMake(19, self.getVerificodeBtn.bottom+15, SCREEN_WIDTH -38, 25)];
        _messageCodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _messageCodeField.backgroundColor = [UIColor clearColor];
        _messageCodeField.font = FONT_TITLE(kFont_Size_2);
        _messageCodeField.placeholder = @"填写手机短信验证码";
       // _messageCodeField.hidden = YES;
    }
    return _messageCodeField;
}

-(UIImageView *)verifyPasswordBottom{
    
    if (!_verifyPasswordBottom) {
        _verifyPasswordBottom = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.getVerificodeBtn.bottom+15, SCREEN_WIDTH-30, 25)];
        [_verifyPasswordBottom setImage:[PUUtil stretchImage:IMGNAMED(@"personal__bank_input") capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch]];
        _verifyPasswordBottom.hidden = YES;
    }
    return _verifyPasswordBottom;
}

-(UITextField *)verifyPasswordField{
    //personal__bank_input//
    if (!_verifyPasswordField) {
        
        _verifyPasswordField = [[UITextField alloc] initWithFrame:CGRectMake(19, self.getVerificodeBtn.bottom+15, SCREEN_WIDTH -38, 25)];
        _verifyPasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _verifyPasswordField.backgroundColor = [UIColor clearColor];
        _verifyPasswordField.font = FONT_TITLE(kFont_Size_2);
        _verifyPasswordField.placeholder = @"请再次输入密码";
         _verifyPasswordField.hidden = YES;
    }
    return _verifyPasswordField;
}

-(UIImageView *)setPasswordBottom{
    
    if (!_setPasswordBottom) {
        _setPasswordBottom = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.chooseVerifyTypeTitle.bottom+10, SCREEN_WIDTH-30, 25)];
        [_setPasswordBottom setImage:[PUUtil stretchImage:IMGNAMED(@"personal__bank_input") capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch]];
        _setPasswordBottom.hidden = YES;
    }
    return _setPasswordBottom;
}

-(UITextField *)setPasswordField{
    //personal__bank_input//
    if (!_setPasswordField) {
        
        _setPasswordField = [[UITextField alloc] initWithFrame:CGRectMake(19, self.chooseVerifyTypeTitle.bottom+10, SCREEN_WIDTH -38, 25)];
        _setPasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _setPasswordField.backgroundColor = [UIColor clearColor];
        _setPasswordField.font = FONT_TITLE(kFont_Size_2);
        _setPasswordField.placeholder = @"输入密码";
        _setPasswordField.hidden = YES;
    }
    return _setPasswordField;
}

-(UIButton *)getVerificodeBtn{
    
    if (!_getVerificodeBtn) {
        _getVerificodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.chooseVerifyTypeBtn.right+10, self.self.chooseVerifyTypeBtn.bottom+10, SCREEN_WIDTH/375*106, 27)];
        _getVerificodeBtn.right = SCREEN_WIDTH-15;
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
        _nextStepBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, _bottomView.bottom+15, SCREEN_WIDTH-30, 45)];
        [_nextStepBtn setBackgroundImage:[PUUtil stretchImage:IMGNAMED(@"loginBtn") capInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]  forState:UIControlStateNormal];
        [_nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextStepBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
        [_nextStepBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepBtn;
}


-(UIPickerView *)typePickView{
    
    if (!_typePickView) {
        _typePickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0)];
        _typePickView.delegate = self;
        _typePickView.dataSource = self;
        _typePickView.showsSelectionIndicator =YES;
        _typePickView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"d2d5db"];
        
    }
    return _typePickView;
}

-(UIView *)pickHeaderView{
    
    if (!_pickHeaderView) {
        
        _pickHeaderView  = [[UIView alloc] initWithFrame:CGRectMake(0, self.typePickView.top, SCREEN_WIDTH, 40)];
        
        _pickHeaderView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f0f1f2"];
        UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 0, 60, 40)];
        completeBtn.backgroundColor = [UIColor clearColor];
        [completeBtn setTitleColor:kApp_Corlor_5 forState:UIControlStateNormal];
        [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
        completeBtn.titleLabel.font = FONT_TITLE(kFont_Size_3);
        [completeBtn addTarget:self action:@selector(chooseTypeComplete) forControlEvents:UIControlEventAllEvents];
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
        cancelBtn.backgroundColor = [UIColor clearColor];
        [cancelBtn setTitleColor:kApp_Corlor_5 forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = FONT_TITLE(kFont_Size_3);
        [cancelBtn addTarget:self action:@selector(cancelChoosePickView) forControlEvents:UIControlEventAllEvents];
        
        [_pickHeaderView addSubview:cancelBtn];

        
        
        [_pickHeaderView addSubview:completeBtn];
    }
    return _pickHeaderView;
}

@end
