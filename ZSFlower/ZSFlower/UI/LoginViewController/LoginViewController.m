//
//  LoginViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/4/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "LoginViewController.h"
#import "MobileLoginViewController.h"
#import "EmailLoginViewController.h"
#import "UserNameLoginViewController.h"
@interface LoginViewController()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_LoginSelectTable;
}
@end
@implementation LoginViewController

-(void)dealloc{
    
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.titleText = @"登录";
    self.view.backgroundColor = [UIColor grayColor];
    [self initUI];
}


-(void)initUI{
 
    _LoginSelectTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.topImageView.height) style:UITableViewStylePlain];
    _LoginSelectTable.delegate = self;
    _LoginSelectTable.dataSource = self;
    _LoginSelectTable.backgroundColor = [UIColor clearColor];
    _LoginSelectTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _LoginSelectTable.showsHorizontalScrollIndicator = NO;
    _LoginSelectTable.showsVerticalScrollIndicator = NO;
    _LoginSelectTable.bounces = NO;
    [self.containerView addSubview:_LoginSelectTable];
}



#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        MobileLoginViewController *moblieVc = [[MobileLoginViewController alloc] init];
        [self.navigationController pushViewController:moblieVc animated:YES];
    }
    else if(indexPath.row == 1){
        UserNameLoginViewController *useNameLog = [[UserNameLoginViewController alloc] init];
        [self.navigationController pushViewController:useNameLog animated:YES];
    }
    else if(indexPath.row == 2){
        EmailLoginViewController *emailLog = [[EmailLoginViewController alloc] init];
        [self.navigationController pushViewController:emailLog animated:YES];
    }
    
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *loginCell = @"LoginCell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginCell];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"手机登录";
    }
    else if(indexPath.row == 1){
        cell.textLabel.text = @"用户名登录";
    }
    else if(indexPath.row == 2){
        cell.textLabel.text = @"邮箱登录";
    }
    else{
        cell.textLabel.text = @"其他";
    }
    return cell;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}



@end
