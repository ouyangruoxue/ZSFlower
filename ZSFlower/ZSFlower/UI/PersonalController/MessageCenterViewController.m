//
//  MessageCenterViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MessageCenterViewController.h"
#import "MessageTableViewCell.h"
@interface MessageCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *myMessageTable;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@end

@implementation MessageCenterViewController

-(void)dealloc{
    _backBtn = nil;
    _myMessageTable = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"消息中心";
    self.titleLabel.textColor = kApp_Corlor_8;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.myMessageTable];
    [self.topContainerView addSubview:self.rightBtn];
}

#pragma  mark buttonaction
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBarBtnClickAction{
    
}

#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 68;
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
    
    static NSString *messageHistory = @"MessageTableViewCell";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:messageHistory];
    if (cell == nil) {
        cell = [[MessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:messageHistory];
        cell.accessoryType =  UITableViewCellAccessoryNone;
    }
    [cell setUnreadNumber:5];
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)myMessageTable{
    if (!_myMessageTable) {
        _myMessageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height) style:UITableViewStylePlain];
        _myMessageTable.delegate = self;
        _myMessageTable.dataSource = self;
        _myMessageTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _myMessageTable.backgroundColor = [UIColor clearColor];
        _myMessageTable.showsVerticalScrollIndicator = YES;
        _myMessageTable.showsHorizontalScrollIndicator = YES;
        _myMessageTable.tableFooterView = [[UIView alloc] init];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 29, SCREEN_WIDTH, 1)];
        lineView.backgroundColor = kApp_Corlor_8;
        _myMessageTable.tableHeaderView = lineView;
    }
    return _myMessageTable;
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

-(UIButton *)rightBtn{
    
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.exclusiveTouch = YES;
        _rightBtn.backgroundColor = [UIColor clearColor];
        _rightBtn.frame = CGRectMake(0, 0, 21, 21);
        _rightBtn.right  = SCREEN_WIDTH - 15;
        _rightBtn.centerY = self.topContainerView.height/2;
        [_rightBtn setImage:IMGNAMED(@"personal_set_up") forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(rightBarBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}


@end
