//
//  AddBankCardMobileViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/4.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AddBankCardMobileViewController.h"
#import "AddBankCardCodeViewController.h"
@interface AddBankCardMobileViewController ()<UITextFieldDelegate>;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITextField *mobileNum;
@property(nonatomic,strong)UIButton *nextStepBtn;
@property(nonatomic,strong)UIButton *mobileTipBtn;
@end

@implementation AddBankCardMobileViewController

-(void)dealloc{
    
    _backBtn = nil;
    _mobileNum = nil;
    _nextStepBtn =nil;
    _mobileTipBtn = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    topView.backgroundColor = kApp_Corlor_1;
    
    UIView *firstToplineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    firstToplineView.backgroundColor = kApp_Corlor_8;
    firstToplineView.alpha = 0.3;
    
    UIView *firstbottomlineView = [[UIView alloc] initWithFrame:CGRectMake(0, topView.height-0.5, SCREEN_WIDTH, 0.5)];
    firstbottomlineView.backgroundColor = kApp_Corlor_8;
    firstbottomlineView.alpha = 0.3;

    UILabel *cardTypeTitle = [[UILabel alloc] init];
    cardTypeTitle.backgroundColor = [UIColor clearColor];
    cardTypeTitle.textColor = kApp_Corlor_2;
    cardTypeTitle.font = FONT_TITLE(kFont_Size_2);
    cardTypeTitle.numberOfLines = 0;
    cardTypeTitle.lineBreakMode = NSLineBreakByWordWrapping;
    cardTypeTitle.width = SCREEN_WIDTH-30;
    cardTypeTitle.left = 15;
    cardTypeTitle.text =@"卡类型";
    
    [cardTypeTitle sizeToFit];
    cardTypeTitle.centerY = 20;
    [topView addSubview:cardTypeTitle];
    
    
    UILabel *cardName = [[UILabel alloc] init];
    cardName.backgroundColor = [UIColor clearColor];
    cardName.textColor = [PUUtil getColorByHexadecimalColor:@"47c535"];
    cardName.font = FONT_TITLE(kFont_Size_3);
    cardName.numberOfLines = 0;
    cardName.lineBreakMode = NSLineBreakByWordWrapping;
    cardName.width = SCREEN_WIDTH-30;
    cardName.left = cardTypeTitle.right+40;
    cardName.text =@"交通银行";
    
    [cardName sizeToFit];
    cardName.centerY = 20;
    [topView addSubview:cardName];
    
    
    UILabel *cardType = [[UILabel alloc] init];
    cardType.backgroundColor = [UIColor clearColor];
    cardType.textColor = [PUUtil getColorByHexadecimalColor:@"47c535"];
    cardType.font = FONT_TITLE(kFont_Size_3);
    cardType.numberOfLines = 0;
    cardType.lineBreakMode = NSLineBreakByWordWrapping;
    cardType.width = SCREEN_WIDTH-30;
    cardType.left = cardName.right+30;
    cardType.text =@"信用卡";
    
    [cardType sizeToFit];
    cardType.centerY = 20;
    [topView addSubview:cardType];
    [topView addSubview:firstToplineView];
    [topView addSubview:firstbottomlineView];
    
    [self.containerView addSubview:topView];
    
    
    
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, topView.bottom+10, SCREEN_WIDTH, 40)];
    bottomView.backgroundColor = kApp_Corlor_1;
    
    UIView *toplineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    toplineView.backgroundColor = kApp_Corlor_8;
    toplineView.alpha = 0.3;
    
    UIView *bottomlineView = [[UIView alloc] initWithFrame:CGRectMake(0, bottomView.height-0.5, SCREEN_WIDTH, 0.5)];
    bottomlineView.backgroundColor = kApp_Corlor_8;
    bottomlineView.alpha = 0.3;
    
    
    UILabel *cardNumTitle = [[UILabel alloc] init];
    cardNumTitle.backgroundColor = [UIColor clearColor];
    cardNumTitle.textColor = kApp_Corlor_2;
    cardNumTitle.font = FONT_TITLE(kFont_Size_2);
    cardNumTitle.numberOfLines = 0;
    cardNumTitle.lineBreakMode = NSLineBreakByWordWrapping;
    cardNumTitle.width = SCREEN_WIDTH-30;
    cardNumTitle.left = 15;
    cardNumTitle.text =@"手机号";
    
    [cardNumTitle sizeToFit];
    cardNumTitle.centerY = 20;
    
    self.mobileNum.left = cardNumTitle.right+40;
    self.mobileNum.width = SCREEN_WIDTH-30-cardNumTitle.width-40;
    
    [bottomView addSubview:cardNumTitle];
    [bottomView addSubview:self.mobileNum];
    [bottomView addSubview:toplineView];
    [bottomView addSubview:bottomlineView];
    
    [self.containerView addSubview:bottomView];
    
    [self.containerView addSubview:self.nextStepBtn];
}
#pragma mark buttonaction

-(void)nextStepAction{
    
    if ([PUUtil isMoblieNum:_mobileNum.text]) {
        AddBankCardCodeViewController *code = [[AddBankCardCodeViewController alloc] init];
        [self.navigationController pushViewController:code animated:YES];
    }
    else{
        [PopupNotify showMessage:@"手机号错误"];
    }
}

-(void)mobileTipAction{
    
}

#pragma mark uitextfielddelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSMutableString *newtext =[NSMutableString stringWithString:textField.text];
    [newtext replaceCharactersInRange:range withString:string];
    
    if (newtext.length>0) {
        self.nextStepBtn.enabled = YES;
    }
    else{
        self.nextStepBtn.enabled = NO;
    }
    return YES;
    
}
#pragma mark get--

-(UITextField *)mobileNum{
    
    if (!_mobileNum) {
        
        _mobileNum = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30, 40)];
        _mobileNum.clearButtonMode = UITextFieldViewModeWhileEditing;
        _mobileNum.backgroundColor = [UIColor clearColor];
        _mobileNum.font = FONT_TITLE(kFont_Size_3);
        _mobileNum.placeholder = @"银行预留手机号码";
        _mobileNum.keyboardType = UIKeyboardTypeNumberPad;
        _mobileNum.delegate = self;
        _mobileNum.rightViewMode = UITextFieldViewModeUnlessEditing;
        _mobileNum.rightView = self.mobileTipBtn;
        
    }
    return _mobileNum;
}

-(UIButton *)mobileTipBtn{
    
    if (!_mobileTipBtn) {
        _mobileTipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _mobileTipBtn.exclusiveTouch = YES;
        _mobileTipBtn.backgroundColor = [UIColor clearColor];
        _mobileTipBtn.frame = CGRectMake(0, 0, 20, 20);
        [_mobileTipBtn setImage:IMGNAMED(@"personal__bank_tip") forState:UIControlStateNormal];
        [_mobileTipBtn addTarget:self action:@selector(mobileTipAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mobileTipBtn;
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
        _nextStepBtn.enabled = NO;
    }
    return _nextStepBtn;
}
@end
