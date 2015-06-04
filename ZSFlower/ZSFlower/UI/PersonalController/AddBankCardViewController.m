//
//  AddBankCardViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/4.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AddBankCardViewController.h"
#import "AddBankCardMobileViewController.h"

@interface AddBankCardViewController ()<UITextFieldDelegate>;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITextField *bankCardNum;
@property(nonatomic,strong)UIButton *nextStepBtn;
@end

@implementation AddBankCardViewController

-(void)dealloc{
    
    _backBtn = nil;
    _bankCardNum = nil;
    _nextStepBtn = nil;
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
    self.titleText =@"添加银行卡";
    
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
    [self.topContainerView addSubview:lineView];
    
    UILabel *alertLabel = [[UILabel alloc] init];
    alertLabel.backgroundColor = [UIColor clearColor];
    alertLabel.textColor = [PUUtil getColorByHexadecimalColor:@"808080"];
    alertLabel.font = FONT_TITLE(kFont_Size_6);
    alertLabel.numberOfLines = 0;
    alertLabel.lineBreakMode = NSLineBreakByWordWrapping;
    alertLabel.width = SCREEN_WIDTH-30;
    alertLabel.left = 15;
    alertLabel.text =@"请绑定持卡人本人的银行卡";

    [alertLabel sizeToFit];
    alertLabel.centerY = 15;
    [self.containerView addSubview:alertLabel];
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 40)];
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
    cardNumTitle.text =@"卡号";
    
    [cardNumTitle sizeToFit];
    cardNumTitle.centerY = 20;

    self.bankCardNum.left = cardNumTitle.right+5;
    self.bankCardNum.width = SCREEN_WIDTH-30-5-cardNumTitle.width;
    
    [bottomView addSubview:cardNumTitle];
    [bottomView addSubview:self.bankCardNum];
    [bottomView addSubview:toplineView];
    [bottomView addSubview:bottomlineView];
    
    [self.containerView addSubview:bottomView];
    
    [self.containerView addSubview:self.nextStepBtn];
}
#pragma mark buttonaction

-(void)nextStepAction{
    
    AddBankCardMobileViewController *mobile = [[AddBankCardMobileViewController alloc] init];
    [self.navigationController pushViewController:mobile animated:YES];
    
}


#pragma mark uitextfieDelegate

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

-(UITextField *)bankCardNum{
    
    if (!_bankCardNum) {
        
        _bankCardNum = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30, 40)];
        _bankCardNum.clearButtonMode = UITextFieldViewModeWhileEditing;
        _bankCardNum.backgroundColor = [UIColor clearColor];
        _bankCardNum.font = FONT_TITLE(kFont_Size_5);
        _bankCardNum.placeholder = @"银行卡号";
        _bankCardNum.keyboardType = UIKeyboardTypeNumberPad;
        _bankCardNum.delegate = self;
        
    }
    return _bankCardNum;
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
       _nextStepBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 100, SCREEN_WIDTH-30, 45)];
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
