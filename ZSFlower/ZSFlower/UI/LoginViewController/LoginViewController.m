//
//  LoginViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "PassWordGetBackViewController.h"
@interface LoginViewController()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_LoginSelectTable;
    UITextField *_accountField;
    UITextField *_passwordField;
    UIButton    *_accountSelectBtn;
    NSString    *_selectedAccountString;
    UIButton    *_loginAccountSelectBtn;
    BOOL        isSelected;
}
@property(nonatomic,strong)UITableView *LoginSelectTable;
@property(nonatomic,strong)UITextField *accountField;
@property(nonatomic,strong)UITextField *passwordField;
@property(nonatomic,strong)UIButton *accountSelectBtn;
@property(nonatomic,strong)UIButton *loginAccountSelectBtn;
@end
@implementation LoginViewController

-(void)dealloc{
     _LoginSelectTable = nil;
     _accountField = nil;
     _passwordField = nil;
     _accountSelectBtn =nil;
    _selectedAccountString = nil;
    _loginAccountSelectBtn = nil;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    isSelected = NO;
    [self initUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)initUI{
    self.titleText = @"登录";
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.containerView addSubview:self.LoginSelectTable];
    [self.topContainerView addSubview:self.backButton];
}



#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if (_loginAccountSelectBtn.selected) {
            return 2;
        }
        else{
            return 0;
        }
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    headView.backgroundColor = [UIColor whiteColor];
    
    UILabel *styleLabel = [[UILabel alloc] init];
    styleLabel.textColor = [PUUtil getColorByHexadecimalColor:@"808080"];
    styleLabel.backgroundColor = [UIColor clearColor];
    styleLabel.font = FONT_TITLE(kFont_Size_1);
    styleLabel.numberOfLines = 1;
    styleLabel.left = 15;
    styleLabel.width = 20;
    [headView addSubview:styleLabel];
    if (section == 0) {
        styleLabel.text = @"账户";
        [styleLabel sizeToFit];
        self.accountField.left = styleLabel.right+10;
        [headView addSubview:self.accountField];
        [headView addSubview:self.loginAccountSelectBtn];
            _loginAccountSelectBtn.selected = isSelected;
            _accountField.textColor = [PUUtil getColorByHexadecimalColor:@"808080"];
            if (_loginAccountSelectBtn.selected) {
                [_loginAccountSelectBtn setImage:[UIImage imageNamed:@"loginAccountSelected"] forState:UIControlStateNormal];
            }
            else{
                _accountField.textColor = kApp_Corlor_2;
                [_loginAccountSelectBtn setImage:[UIImage imageNamed:@"loginAccountUnSelected"] forState:UIControlStateNormal];
            }

    }
    else if(section == 1){
        styleLabel.text = @"密码";
        [styleLabel sizeToFit];
        self.passwordField.left = styleLabel.right+10;
        [headView addSubview:self.passwordField];
        
        UIButton * secureBtn = [[UIButton alloc] initWithFrame:CGRectMake(_accountField.right, 0, 24, 40)];
        [secureBtn addTarget:self action:@selector(securePassword) forControlEvents:UIControlEventTouchUpInside];
        [secureBtn setImage:[UIImage imageNamed:@"login_secureBtn"] forState:UIControlStateNormal];
        secureBtn.right = SCREEN_WIDTH - 15;
        [headView addSubview:secureBtn];
    }
     styleLabel.centerY = 20;
    return headView;
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *loginCell = @"LoginCell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginCell];
    }
    UILabel *accountLabel = [[UILabel alloc] init];
    accountLabel.textColor = [PUUtil getColorByHexadecimalColor:@"000000"];
    accountLabel.backgroundColor = [UIColor clearColor];
    accountLabel.font = FONT_TITLE(kFont_Size_2);
    accountLabel.numberOfLines = 1;
    accountLabel.text = @"loginPeople";
    accountLabel.left = _accountField.left;
    accountLabel.width = 200;
    [accountLabel sizeToFit];
    accountLabel.centerY = 20;
    [cell.contentView addSubview:accountLabel];
    return cell;
    
}



#pragma mark  button action

-(void)back{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(void)selectAccountAction{
     isSelected = !isSelected;
    _loginAccountSelectBtn.selected = isSelected;
    [_LoginSelectTable reloadData];
}


-(void)securePassword{
    _passwordField.secureTextEntry = !_passwordField.secureTextEntry;
}


-(void)login{
    
}

-(void)registerAccount{
    
    RegisterViewController *regester = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:regester animated:YES];
    
}

-(void)forgetPassword{
    
    PassWordGetBackViewController *getbackPassword = [[PassWordGetBackViewController alloc] init];
    [self.navigationController pushViewController:getbackPassword animated:YES];
}

#pragma mark about table

-(void)creatTableViewHeaderAndFooter{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 18)];
    [headerView setBackgroundColor:[UIColor clearColor]];
    _LoginSelectTable.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 95)];
    [footerView setBackgroundColor:[UIColor clearColor]];
    
    UIButton * loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 45)];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:loginBtn];
    
    UIButton * registBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, loginBtn.bottom+10, 60, 20)];
    [registBtn setTitle:@"快速注册" forState:UIControlStateNormal];
    registBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
    registBtn.titleLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeLeft];
    [registBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"808080"] forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(registerAccount) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:registBtn];
    
    UIButton * forgetBtn = [[UIButton alloc] initWithFrame:CGRectMake(loginBtn.right-60, loginBtn.bottom+10, 60, 20)];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetBtn.titleLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeLeft];
    [forgetBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"808080"] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
    [forgetBtn addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:forgetBtn];
    _LoginSelectTable.tableFooterView = footerView;
    
}

#pragma mark get--
-(UITableView *)LoginSelectTable{
    if (!_LoginSelectTable) {
        _LoginSelectTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.topImageView.height) style:UITableViewStylePlain];
        _LoginSelectTable.delegate = self;
        _LoginSelectTable.dataSource = self;
        _LoginSelectTable.backgroundColor = [UIColor clearColor];
        _LoginSelectTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _LoginSelectTable.showsHorizontalScrollIndicator = NO;
        _LoginSelectTable.showsVerticalScrollIndicator = NO;
        _LoginSelectTable.bounces = NO;
        [self creatTableViewHeaderAndFooter];
    }
    return _LoginSelectTable;
}

-(UITextField *)accountField{
    if (!_accountField) {
        _accountField = [[UITextField alloc] initWithFrame:CGRectMake(46, 0, SCREEN_WIDTH-110, 40)];
        _accountField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _accountField.backgroundColor = [UIColor clearColor];
        _accountField.font = FONT_TITLE(kFont_Size_2);
        _accountField.placeholder = @"用户名/邮箱/手机号";
    }
    return _accountField;
}


-(UIButton *)loginAccountSelectBtn{
    
    if (!_loginAccountSelectBtn) {
        _loginAccountSelectBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.accountField.right, 0, 24, 40)];
        _loginAccountSelectBtn.selected = isSelected;
        [_loginAccountSelectBtn setImage:[UIImage imageNamed:@"loginAccountUnSelected"] forState:UIControlStateNormal];
        [_loginAccountSelectBtn setBackgroundImage:[UIImage imageNamed:@"loginAccountSelected"] forState:UIControlStateSelected|UIControlStateHighlighted];
        [_loginAccountSelectBtn addTarget:self action:@selector(selectAccountAction) forControlEvents:UIControlEventTouchUpInside];
        _loginAccountSelectBtn.right =  SCREEN_WIDTH - 15;
        
    }
    return _loginAccountSelectBtn;
}

-(UITextField *)passwordField{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(46, 0, SCREEN_WIDTH-110, 40)];
        _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordField.backgroundColor = [UIColor clearColor];
        _passwordField.font = FONT_TITLE(kFont_Size_2);
        _passwordField.placeholder = @"请输入密码";
        _passwordField.secureTextEntry = YES;
    }
    return _passwordField;
}

@end
