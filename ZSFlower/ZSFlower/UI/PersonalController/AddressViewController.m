//
//  AddressViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressManagerTableViewCell.h"
@interface AddressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *addAddressBtn;
@property(nonatomic,strong)UITableView *AddressManagerTable;
@end

@implementation AddressViewController

-(void)dealloc{
    _addAddressBtn = nil;
    _AddressManagerTable = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"地址管理";
    [self.containerView addSubview:self.addAddressBtn];
    [self.containerView addSubview:self.AddressManagerTable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 103;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *addresstableCell = @"AddressManagerTableViewCell";
    AddressManagerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addresstableCell];
    if (cell == nil) {
        cell = [[AddressManagerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addresstableCell];
        cell.accessoryType =  UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
    
}

#pragma mark BtnAction
-(void)addAddressAction{
    
}



#pragma mark get--

- (UITableView *)AddressManagerTable{
    if (!_AddressManagerTable) {
        _AddressManagerTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height-75) style:UITableViewStylePlain];
        _AddressManagerTable.rowHeight = 65;
        _AddressManagerTable.delegate = self;
        _AddressManagerTable.dataSource = self;
        _AddressManagerTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _AddressManagerTable.backgroundColor = [UIColor whiteColor];
        if ([_AddressManagerTable respondsToSelector:@selector(setSeparatorInset:)]) {
            [_AddressManagerTable setSeparatorInset:UIEdgeInsetsZero];
        }
        _AddressManagerTable.tableFooterView = [[UIView alloc] init];
        _AddressManagerTable.showsVerticalScrollIndicator = YES;
        _AddressManagerTable.showsHorizontalScrollIndicator = YES;
    }
    return _AddressManagerTable;
}


-(UIButton *)addAddressBtn{
    
    if (!_addAddressBtn) {
        
        _addAddressBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.containerView.height-75, SCREEN_WIDTH-30, 45)];
        [_addAddressBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
        [_addAddressBtn setTitle:@" ╋ 新增地址" forState:UIControlStateNormal];
        _addAddressBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
        [_addAddressBtn addTarget:self action:@selector(addAddressAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addAddressBtn;
}
@end
