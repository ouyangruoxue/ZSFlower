//
//  PasswordGetbackDetailViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/6.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "PasswordGetbackDetailViewController.h"

@interface PasswordGetbackDetailViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIImageView *validateBackground;
@property(nonatomic,strong)UITextField *validateCodeField;
@property(nonatomic,strong)UIButton *nextStepBtn;
@property(nonatomic,strong)UIButton *getValidateBtn;
@property(nonatomic,strong)UIButton *chooseTypeBtn;
@property(nonatomic,strong)UILabel *nickNameLabel;
@property(nonatomic,strong)UILabel *accountLabel;
@property(nonatomic,strong)UIPickerView *typePickView;
@property(nonatomic,strong)UIView *pickHeaderView;
@end

@implementation PasswordGetbackDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.titleText = @"密码找回";
    [self.containerView addSubview:self.nickNameLabel];
    [self.containerView addSubview:self.accountLabel];
    [self.topContainerView addSubview:self.backButton];
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.containerView addSubview:self.chooseTypeBtn];
    [self.containerView addSubview:self.validateBackground];
    [self.containerView addSubview:self.validateCodeField];
    [self.containerView addSubview:self.getValidateBtn];
    [self.containerView addSubview:self.nextStepBtn];
    [self.containerView addSubview:self.typePickView];
    [self.containerView addSubview:self.pickHeaderView];
    
    UILabel *chooseTypealert = [[UILabel alloc] init];
    chooseTypealert.font = FONT_TITLE(kFont_Size_3);
    chooseTypealert.text = @"选择找回密码方式:";
    chooseTypealert.numberOfLines = 1;
    chooseTypealert.lineBreakMode = NSLineBreakByTruncatingTail;
    chooseTypealert.backgroundColor= [UIColor clearColor];
    chooseTypealert.left = self.chooseTypeBtn.left;
    chooseTypealert.width = 200;
    chooseTypealert.height = 20;
    chooseTypealert.bottom = self.chooseTypeBtn.top - 12;
    [self.containerView addSubview:chooseTypealert];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
        return 3;
    
}
//返回每个item中的title
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        return @"手机";
    }else {
        return @"邮箱";
    }
}

//设置列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
        return 100;
}

//选择行的事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (row == 0) {
        DLog(@"第一行");
    }
    else if (row == 1) {
        DLog(@"第二行");
    }

    else if (row == 2) {
        DLog(@"第三行");
    }

}



#pragma mark btn action

-(void)chooseGetBackType{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-216-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _typePickView.top -40;
                     } completion:^(BOOL finished) {
                         
                     }];
    
}

-(void)nextStep{
    
}

-(void)getMobileValidate{
    
}

-(void)chooseTypeComplete{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                        _pickHeaderView.top = _typePickView.top;
                     } completion:^(BOOL finished) {

                     }];
}

#pragma mark get--

-(UILabel *)nickNameLabel{
    
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.chooseTypeBtn.left, 20, 100, 20)];
        _nickNameLabel.font = FONT_TITLE(kFont_Size_3);
        _nickNameLabel.text = @"青铜部落";
        _nickNameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _nickNameLabel.backgroundColor= [UIColor clearColor];
    }
    return _nickNameLabel;
}


-(UILabel *)accountLabel{
    
    if (!_accountLabel) {
        _accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.chooseTypeBtn.left, self.chooseTypeBtn.bottom+10, 100, 20)];
        _accountLabel.font = FONT_TITLE(kFont_Size_3);
        _accountLabel.text = @"青铜部落";
        _accountLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _accountLabel.backgroundColor = [UIColor clearColor];
    }
    return _accountLabel;
}


-(UIButton *)chooseTypeBtn{
    
    if (!_chooseTypeBtn) {
        _chooseTypeBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 82, SCREEN_WIDTH-30, 45)];
        _chooseTypeBtn.backgroundColor = [UIColor clearColor];
        [_chooseTypeBtn setBackgroundImage:[PUUtil stretchImage:[UIImage imageNamed:@"getback_choose_bg"] capInsets:UIEdgeInsetsMake(10, 10, 10, 40) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_chooseTypeBtn setTitle:@"已验证手机" forState:UIControlStateNormal];
        [_chooseTypeBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        _chooseTypeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _chooseTypeBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _chooseTypeBtn.titleLabel.font = FONT_TITLE(kFont_Size_4);
        [_chooseTypeBtn addTarget:self action:@selector(chooseGetBackType) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseTypeBtn;
}

-(UIImageView *)validateBackground{
    if (!_validateBackground) {
        _validateBackground = [[UIImageView alloc] initWithFrame:CGRectMake(self.chooseTypeBtn.left, self.chooseTypeBtn.bottom+40, self.chooseTypeBtn.width - 101, 43)];
        _validateBackground.image = [PUUtil stretchImage:[UIImage imageNamed:@"getback_validate"] capInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    }
    return _validateBackground;
}


-(UITextField *)validateCodeField{
    if (!_validateCodeField) {
        _validateCodeField = [[UITextField alloc] initWithFrame:CGRectMake(self.chooseTypeBtn.left+5, self.self.chooseTypeBtn.bottom+40, self.validateBackground.width-5, 43)];
        _validateCodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _validateCodeField.backgroundColor = [UIColor clearColor];
        _validateCodeField.font = FONT_TITLE(kFont_Size_2);
        _validateCodeField.placeholder = @"请输入验证码";
        
    }
    return _validateCodeField;
}

-(UIButton *)getValidateBtn{
    
    if (!_getValidateBtn) {
        _getValidateBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.validateBackground.right, self.validateBackground.top, 101, 43)];
        _getValidateBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"47c535"];
        [_getValidateBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getValidateBtn.titleLabel.font = FONT_TITLE(kFont_Size_4);
        [_getValidateBtn addTarget:self action:@selector(getMobileValidate) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getValidateBtn;
}

-(UIButton *)nextStepBtn{
    
    if (!_nextStepBtn) {
        _nextStepBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.validateBackground.left, self.validateBackground.bottom+20, SCREEN_WIDTH-30, 45)];
        _nextStepBtn.backgroundColor = [UIColor clearColor];
        [_nextStepBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
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
        
        [_pickHeaderView addSubview:completeBtn];
    }
    return _pickHeaderView;
}

@end
