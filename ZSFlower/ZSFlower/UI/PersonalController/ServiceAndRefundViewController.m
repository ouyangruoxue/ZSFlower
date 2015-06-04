//
//  ServiceAndRefundViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/21.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ServiceAndRefundViewController.h"
#import "ServiceAndRefundCell.h"
@interface ServiceAndRefundViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITableView *serviceTable;
@end

@implementation ServiceAndRefundViewController

-(void)dealloc{
    _backBtn = nil;
    _serviceTable = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"售后/退款";
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b2b2b2"];
    [self.topContainerView addSubview:lineView];
    [self.containerView addSubview:self.serviceTable];
}

#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  UITableViewCellEditingStyleDelete;  //返回此值时,Cell会做出响应显示Delete按键,点击Delete后会调用下面的函数,别给传递
}



- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
        
    {
        
    }
    
    
}

#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *serviceHistory = @"ServiceAndRefundCell";
    ServiceAndRefundCell *cell = [tableView dequeueReusableCellWithIdentifier:serviceHistory];
    if (cell == nil) {
        cell = [[ServiceAndRefundCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:serviceHistory];
        cell.accessoryType =  UITableViewCellAccessoryNone;
    }
    if (indexPath.row == 0) {
        [cell setObjectWithType:serviceRebund];
    }
    else if (indexPath.row == 1){
        [cell setObjectWithType:serviceRebunding];
    }
    else if (indexPath.row == 2){
        [cell setObjectWithType:serviceRebundDisabled];
    }
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Buttonaction
-(void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark get

- (UITableView *)serviceTable{
    if (!_serviceTable) {
        _serviceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height) style:UITableViewStylePlain];
        _serviceTable.delegate = self;
        _serviceTable.dataSource = self;
        _serviceTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _serviceTable.backgroundColor = [UIColor clearColor];
        _serviceTable.showsVerticalScrollIndicator = YES;
        _serviceTable.showsHorizontalScrollIndicator = YES;
        _serviceTable.tableFooterView = [[UIView alloc] init];
    }
    return _serviceTable;
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


@end
