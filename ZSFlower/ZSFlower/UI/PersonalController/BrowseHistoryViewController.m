//
//  BrowseHistoryViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/14.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BrowseHistoryViewController.h"
#import "BrowseHistoryTableViewCell.h"
@interface BrowseHistoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *historyTable;
@end
@implementation BrowseHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{

    self.titleText = @"浏览记录";
    self.rightBarButtonTitle = @"清空";
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.historyTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    
    return 85;
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
    
    static NSString *BrowseHistory = @"BrowseHistoryTableViewCell";
    BrowseHistoryTableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[BrowseHistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BrowseHistory];
        cell.accessoryType =  UITableViewCellAccessoryNone;
    }
    
    return cell;
    
}

#pragma mark get
-(UITableView *)historyTable{
    if (!_historyTable) {
        _historyTable = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height)];
        _historyTable.delegate = self;
        _historyTable.dataSource = self;
        _historyTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _historyTable.allowsSelection = YES;
        _historyTable.backgroundColor = K_BACKGROUND_COLOR;
        _historyTable.showsVerticalScrollIndicator = NO;
        _historyTable.showsHorizontalScrollIndicator = NO;
    }
    return _historyTable;
}

@end
