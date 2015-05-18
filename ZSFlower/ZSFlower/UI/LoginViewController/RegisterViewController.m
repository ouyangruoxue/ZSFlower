//
//  RegisterViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/28.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginManager.h"
@interface RegisterViewController ()<UITableViewDelegate,UITableViewDataSource>
{

}
@property(nonatomic,strong)UITableView *registerTable;
@property(nonatomic,strong)UITextField *mobileTextfield;
@property(nonatomic,strong)UITextField *passwordTextfield;
@property(nonatomic,strong)UITextField *passwordValidate;
@property(nonatomic,strong)UITextField *veriCodeTextfield;
@property(nonatomic,strong)UIButton    *selectBtn;
@end



@implementation RegisterViewController

-(void)dealloc{
    _registerTable = nil;
    _mobileTextfield = nil;
    _passwordTextfield = nil;
    _passwordValidate = nil;
    _veriCodeTextfield = nil;
    _selectBtn = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.titleText = @"快速注册";
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.registerTable];
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    headView.backgroundColor = K_BACKGROUND_COLOR;
    return headView;
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *loginCell = @"LoginCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:loginCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginCell];
    }
    if (indexPath.row == 0) {
        [cell.contentView addSubview:self.mobileTextfield];
    }
    else if(indexPath.row == 1){
        [cell.contentView addSubview:self.veriCodeTextfield];
        UIButton * vericodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 101, 43)];
        [vericodeBtn setBackgroundImage:[UIImage imageNamed:@"register_gainCode"] forState:UIControlStateNormal];
        [vericodeBtn addTarget:self action:@selector(getVerisonCode) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = vericodeBtn;
    }
    else if (indexPath.row == 2){
        [cell.contentView addSubview:self.passwordTextfield];
    }
    else if (indexPath.row == 3){
        [cell.contentView addSubview:self.passwordValidate];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 39, SCREEN_WIDTH-10, 1)];
    lineView.backgroundColor = K_BACKGROUND_COLOR;
    [cell.contentView addSubview:lineView];
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark about tableFoot

-(void)creatTableViewFooter{
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 95)];
    [footerView setBackgroundColor:[UIColor clearColor]];
    
    [footerView addSubview:self.selectBtn];
    self.selectBtn.selected = YES;
    
    
    UILabel * protocolLabel = [[UILabel alloc] init];
    protocolLabel.text = @"同意爱森林注册协议";
    protocolLabel.backgroundColor = [UIColor clearColor];
    protocolLabel.textColor = kApp_Corlor_8;
    protocolLabel.font = FONT_TITLE(kFont_Size_4);
    protocolLabel.left = _selectBtn.right+2;
    [protocolLabel sizeToFit];
    protocolLabel.centerY = _selectBtn.centerY;
    [footerView addSubview:protocolLabel];
    
    UIButton * loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 48, SCREEN_WIDTH-30, 45)];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
    [loginBtn addTarget:self action:@selector(regiester) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:loginBtn];
    
    _registerTable.tableFooterView = footerView;
    
}

#pragma mark -- button @selector

-(void)regiester{
    
    if ([[LoginManager shareInstance] isMoblieNum:_mobileTextfield.text]) {
        
        if (!_selectBtn.selected) {
            [PopupNotify showMessage:@"请同意爱森林注册协议"];
            return;
        }
        
        if ([NSString isBlankString:_veriCodeTextfield.text]) {
            [PopupNotify showMessage:@"验证码不可以为空"];
            return;
        }
        
        if ([_passwordTextfield.text isEqualToString:_passwordValidate.text]) {
            
        }
        else{
            [PopupNotify showMessage:@"登陆密码两次输入不一致"];
            return;
        }
    }
    else{
        [PopupNotify showMessage:@"请输入正确的手机号"];
    }
}


-(void)getVerisonCode{

    if ([[LoginManager shareInstance] isMoblieNum:_mobileTextfield.text]) {
        

    }
    else{
        [PopupNotify showMessage:@"请输入正确的手机号"];
    }
}

-(void)procotolSelect:(id)sender{
    
    for (UIButton *btn in [_registerTable.tableFooterView subviews]) {
        if (btn == sender) {
            if (btn.selected) {
                btn.selected = NO;
                [_selectBtn setBackgroundImage:[UIImage imageNamed:@"register_icon_unselected"] forState:UIControlStateNormal];
            }
            else{
                btn.selected = YES;
                [_selectBtn setBackgroundImage:[UIImage imageNamed:@"register_icon_slected"] forState:UIControlStateNormal];
            }
        }
    }
}


#pragma mark get--

-(UITableView *)registerTable{
    if (!_registerTable) {
        _registerTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.topImageView.height) style:UITableViewStylePlain];
        _registerTable.delegate = self;
        _registerTable.dataSource = self;
        _registerTable.backgroundColor = [UIColor clearColor];
        _registerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _registerTable.showsHorizontalScrollIndicator = NO;
        _registerTable.showsVerticalScrollIndicator = NO;
        _registerTable.bounces = NO;
        _registerTable.allowsSelection = NO;
        [self creatTableViewFooter];
    }
    return _registerTable;
}


-(UITextField *)mobileTextfield{
    if (!_mobileTextfield) {
        _mobileTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-110, 40)];
        _mobileTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _mobileTextfield.backgroundColor = [UIColor redColor];
        _mobileTextfield.font = FONT_TITLE(kFont_Size_2);
        _mobileTextfield.placeholder = @"请输入您的手机号";
        _mobileTextfield.backgroundColor = [UIColor clearColor];
    }
    return _mobileTextfield;
}

-(UITextField *)veriCodeTextfield{
    if (!_veriCodeTextfield) {
        _veriCodeTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-110, 40)];
        _veriCodeTextfield.backgroundColor = [UIColor clearColor];
        _veriCodeTextfield.font = FONT_TITLE(kFont_Size_2);
        _veriCodeTextfield.placeholder = @"验证码";

    }
    return _veriCodeTextfield;
}

-(UITextField *)passwordTextfield{
    if (!_passwordTextfield) {
        _passwordTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-110, 40)];
        _passwordTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextfield.backgroundColor = [UIColor clearColor];
        _passwordTextfield.font = FONT_TITLE(kFont_Size_2);
        _passwordTextfield.placeholder = @"登陆密码";
    }
    return _passwordTextfield;
}

-(UITextField *)passwordValidate{
    if (!_passwordValidate) {
        _passwordValidate = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-110, 40)];
        _passwordValidate.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordValidate.font = FONT_TITLE(kFont_Size_2);
        _passwordValidate.placeholder = @"确认密码";
        _passwordValidate.backgroundColor = [UIColor clearColor];
    }
    return _passwordValidate;
}

-(UIButton *)selectBtn{
    
    if (!_selectBtn) {
         _selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 10, 16, 16)];
        _selectBtn.backgroundColor = [UIColor clearColor];
        [_selectBtn setBackgroundImage:[UIImage imageNamed:@"register_icon_slected"] forState:UIControlStateNormal];
        [_selectBtn setBackgroundImage:[UIImage imageNamed:@"register_icon_unslected"] forState:UIControlStateSelected];
        [_selectBtn addTarget:self action:@selector(procotolSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}

@end
