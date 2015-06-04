//
//  PassWordGetBackViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/4.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "PassWordGetBackViewController.h"
#import "LoginManager.h"
#import "PasswordGetbackDetailViewController.h"

@interface PassWordGetBackViewController ()
@property(nonatomic,strong)UITextField *accountField;
@property(nonatomic,strong)UITextField *validateCodeField;
@property(nonatomic,strong)UIImageView *validateImageView;
@property(nonatomic,strong)UIButton    *nextStepBtn;
@property(nonatomic,strong)UIButton    *changeValidateImageBtn;
@property(nonatomic,strong)UIImageView *accountFieldBackground;
@property(nonatomic,strong)UIImageView *validateBackground;
@end

@implementation PassWordGetBackViewController

-(void)dealloc{
    _accountField = nil;
    _validateCodeField = nil;
    _validateImageView = nil;
    _nextStepBtn = nil;
    _changeValidateImageBtn = nil;
    _accountFieldBackground = nil;
    _validateBackground = nil;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.titleText = @"密码找回";
    [self.topContainerView addSubview:self.backButton];
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.containerView addSubview:self.accountFieldBackground];
    [self.containerView addSubview:self.validateBackground];
    [self.containerView addSubview:self.accountField];
    [self .containerView addSubview:self.validateCodeField];
    [self.containerView addSubview:self.validateImageView];
    [self.containerView addSubview:self.changeValidateImageBtn];
    [self.containerView addSubview:self.nextStepBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button action

-(void)nextStep{
    
    if ([NSString isBlankString:_accountField.text]) {
        [PopupNotify showMessage:@"账号不能为空"];
        return;
    }
    else if ([NSString isBlankString:_validateCodeField.text]){
        
        [PopupNotify showMessage:@"验证码不能为空"];
        return;
    }
    
    if ([PUUtil isMoblieNum:_accountField.text]) {
        
    }
    else if ([PUUtil isEmailFormat:_accountField.text]){
        
    }
    else if ([PUUtil hasCorrectAccountStr:_accountField.text]){
        
    }
    else{
        [PopupNotify showMessage:@"账号有误"];
    }
    
    
    PasswordGetbackDetailViewController *passwordDetail = [[PasswordGetbackDetailViewController alloc] init];
    [self.navigationController pushViewController:passwordDetail animated:YES];
    
}

-(void)changeValidateImage{
    
    
}

#pragma mark get--

-(UIImageView *)accountFieldBackground{
    if (!_accountFieldBackground) {
        _accountFieldBackground = [[UIImageView alloc] initWithFrame:CGRectMake(15, 18, SCREEN_WIDTH-30, 43)];
        _accountFieldBackground.image = [PUUtil stretchImage:[UIImage imageNamed:@"getback_acount"] capInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    }
    return _accountFieldBackground;
}


-(UIImageView *)validateBackground{
    if (!_validateBackground) {
        _validateBackground = [[UIImageView alloc] initWithFrame:CGRectMake(self.accountFieldBackground.left, self.accountFieldBackground.bottom+10, 120, 43)];
        _validateBackground.image = [PUUtil stretchImage:[UIImage imageNamed:@"getback_validate"] capInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    }
    return _validateBackground;
}


-(UITextField *)accountField{
    if (!_accountField) {
        _accountField = [[UITextField alloc] initWithFrame:CGRectMake(20, 18, SCREEN_WIDTH-40, 43)];
        _accountField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _accountField.backgroundColor = [UIColor clearColor];
        _accountField.font = FONT_TITLE(kFont_Size_2);
        _accountField.placeholder = @"用户名/手机号/邮箱";
    }
    return _accountField;
}

-(UITextField *)validateCodeField{
    if (!_validateCodeField) {
        _validateCodeField = [[UITextField alloc] initWithFrame:CGRectMake(self.accountField.left, self.accountField.bottom+10, 110, 43)];
        _validateCodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
         _validateCodeField.backgroundColor = [UIColor clearColor];
        _validateCodeField.font = FONT_TITLE(kFont_Size_2);
        _validateCodeField.placeholder = @"请输入验证码";
       
    }
    return _validateCodeField;
}

-(UIImageView *)validateImageView{
    if (!_validateImageView) {
        _validateImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.validateBackground.right+10, self.validateBackground.top, 120, 43)];
        _validateImageView.backgroundColor = [UIColor whiteColor];

    }
    return _validateImageView;
}

-(UIButton *)nextStepBtn{
    
    if (!_nextStepBtn) {
        _nextStepBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.accountFieldBackground.left, self.validateBackground.bottom+20, SCREEN_WIDTH-30, 45)];
        _nextStepBtn.backgroundColor = [UIColor clearColor];
        [_nextStepBtn setBackgroundImage:[PUUtil stretchImage:IMGNAMED(@"loginBtn") capInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]  forState:UIControlStateNormal];
        [_nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextStepBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
        [_nextStepBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepBtn;
}

-(UIButton *)changeValidateImageBtn{
    
    if (!_changeValidateImageBtn) {
        _changeValidateImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.validateImageView.right, self.validateImageView.bottom-20, 100, 16)];
        _changeValidateImageBtn.backgroundColor = [UIColor clearColor];
        [_changeValidateImageBtn setTitle:@"换一张" forState:UIControlStateNormal];
        [_changeValidateImageBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"47c535"] forState:UIControlStateNormal];
        [_changeValidateImageBtn addTarget:self action:@selector(changeValidateImage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeValidateImageBtn;
}

@end
