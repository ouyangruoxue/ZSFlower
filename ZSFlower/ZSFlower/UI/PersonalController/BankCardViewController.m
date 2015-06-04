//
//  BankCardViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardManagerTableViewCell.h"
#import "AddBankCardViewController.h"
@interface BankCardViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *bankManagerTable;
@end

@implementation BankCardViewController

-(void)dealloc{
    _bankManagerTable = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


-(void)initUI{
    
    self.titleText = @"银行卡管理";
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.bankManagerTable];
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma  mark buttonAction

-(void)addBankCard{
    
    AddBankCardViewController *addBankcard = [[AddBankCardViewController alloc] init];
    [self.navigationController pushViewController:addBankcard animated:YES];
    
}

#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *BanktableCell = @"BankCardManagerTableViewCell";
    BankCardManagerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BanktableCell];
    if (cell == nil) {
        cell = [[BankCardManagerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BanktableCell];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 1) {
        cell.lineView.hidden = YES;
    }
    return cell;
    
}


-(void)creatTableViewFooter{
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 65)];
    footView.backgroundColor = K_BACKGROUND_COLOR;
    
    UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
           lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [footView addSubview:lineView];

    
    
    UIButton * AddBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 45)];
    [AddBtn setBackgroundImage:[PUUtil stretchImage:IMGNAMED(@"loginBtn") capInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]  forState:UIControlStateNormal];
    [AddBtn setTitle:@" ╋ 添加银行卡" forState:UIControlStateNormal];
    AddBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
    [AddBtn addTarget:self action:@selector(addBankCard) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:AddBtn];
    
    _bankManagerTable.tableFooterView = footView;
    
}


- (UITableView *)bankManagerTable{
    if (!_bankManagerTable) {
        _bankManagerTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height-65) style:UITableViewStylePlain];
        _bankManagerTable.rowHeight = 65;
        _bankManagerTable.delegate = self;
        _bankManagerTable.dataSource = self;
        _bankManagerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _bankManagerTable.backgroundColor = [UIColor whiteColor];
        if ([_bankManagerTable respondsToSelector:@selector(setSeparatorInset:)]) {
            [_bankManagerTable setSeparatorInset:UIEdgeInsetsZero];
        }
        _bankManagerTable.showsVerticalScrollIndicator = YES;
        _bankManagerTable.showsHorizontalScrollIndicator = YES;
        [self creatTableViewFooter];
    }
    return _bankManagerTable;
}



@end
