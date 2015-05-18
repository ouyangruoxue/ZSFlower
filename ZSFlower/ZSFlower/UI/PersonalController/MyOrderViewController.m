//
//  MyOrderViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/13.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MyOrderViewController.h"
#import "personalOrderTableViewCell.h"
@interface MyOrderViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *allOrderBtn;
@property(nonatomic,strong)UIButton *waitingForPayBtn;
@property(nonatomic,strong)UIButton *waitingForSendBtn;
@property(nonatomic,strong)UIButton *waitingForTakeBtn;
@property(nonatomic,strong)UIButton *waitingForAppraiseBtn;
@property(nonatomic,strong)UIScrollView *allContentScrollView;
@property(nonatomic,assign)int currentSelectIndex;
@property(nonatomic,strong)UIView   *redlineView;
@property(nonatomic,strong)UITableView *allOrderTable;
@property(nonatomic,strong)UITableView *waitingForPayTable;
@property(nonatomic,strong)UITableView *waitingForSendTable;
@property(nonatomic,strong)UITableView *waitingForTakeTable;
@property(nonatomic,strong)UITableView *waitingForAppraiseTable;

@end

@implementation MyOrderViewController

-(void)dealloc{
    
}


-(id)initWithOrderIndex:(int)index{
    
    if (self ==[super init]) {
        _currentSelectIndex = index;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIinit];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)UIinit{
    self.titleText = @"我的订单";
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview: self.allOrderBtn];
    [self.containerView addSubview:self.waitingForPayBtn];
    [self.containerView addSubview:self.waitingForSendBtn];
    [self.containerView addSubview:self.waitingForTakeBtn];
    [self.containerView addSubview:self.waitingForAppraiseBtn];
    [self addlineView];
    //init table
    [self.allContentScrollView addSubview:self.allOrderTable];
    [self.allContentScrollView addSubview:self.waitingForPayTable];
    [self.allContentScrollView addSubview:self.waitingForSendTable];
    [self.allContentScrollView addSubview:self.waitingForTakeTable];
    [self.allContentScrollView addSubview:self.waitingForAppraiseTable];
    [self.containerView addSubview:self.allContentScrollView];

    [_allContentScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH*_currentSelectIndex, 0, SCREEN_WIDTH, self.containerView.height-35) animated:YES];
    [self setBtnColorForOrderIndex:_currentSelectIndex];
}

-(void)addlineView{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.allOrderBtn.bottom-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [self.containerView addSubview:lineView];
    
    
     _redlineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.allOrderBtn.bottom-1.5, SCREEN_WIDTH, 1)];
    _redlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
    [self.containerView addSubview:_redlineView];

}


-(void)setBtnColorForOrderIndex:(int)index{
    
    [_allOrderBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
    [_waitingForPayBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
    [_waitingForSendBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
    [_waitingForTakeBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
    [_waitingForAppraiseBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
    
    switch (index) {
        case 0:{
            [_allOrderBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
            CGSize redlineSize = [_allOrderBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:FONT_TITLE(kFont_Size_4)}];
            _redlineView.width = redlineSize.width;
            _redlineView.centerX = _allOrderBtn.centerX;
        }
            break;
        case 1:{
            [_waitingForPayBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
            CGSize redlineSize = [_waitingForPayBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:FONT_TITLE(kFont_Size_4)}];
            _redlineView.width = redlineSize.width;
            _redlineView.centerX = _waitingForPayBtn.centerX;
        }
            break;
        case 2:{
            [_waitingForSendBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
            CGSize redlineSize = [_waitingForSendBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:FONT_TITLE(kFont_Size_4)}];
            _redlineView.width = redlineSize.width;
            _redlineView.centerX = _waitingForSendBtn.centerX;
        }
            break;
        case 3:{
            [_waitingForTakeBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
            CGSize redlineSize = [_waitingForTakeBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:FONT_TITLE(kFont_Size_4)}];
            _redlineView.width = redlineSize.width;
            _redlineView.centerX = _waitingForTakeBtn.centerX;
        }
            break;
        case 4:{
            [_waitingForAppraiseBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateNormal];
            CGSize redlineSize = [_waitingForAppraiseBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:FONT_TITLE(kFont_Size_4)}];
            _redlineView.width = redlineSize.width;
            _redlineView.centerX = _waitingForAppraiseBtn.centerX;
        }
            break;
        default:
            break;
    }
}

#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"PersonalTableViewCell";
    personalOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[personalOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        cell.accessoryType =  UITableViewCellAccessoryNone;
    }
    if (tableView == _waitingForAppraiseTable) {
        [cell setOrderViewForOrderType:KwaitingForAppraise];
    }
    else if (tableView == _waitingForPayTable){
        [cell setOrderViewForOrderType:KwaitingForPay];
    }
    else if (tableView == _waitingForSendTable){
        [cell setOrderViewForOrderType:KwaitingForSend];
    }
    else if (tableView == _waitingForTakeTable){
        [cell setOrderViewForOrderType:KwaitingForTake];
    }else if(tableView == _allOrderTable){
        [cell setOrderViewForOrderType:korderCacel];
    }
    return cell;
    
}


#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _allContentScrollView) {
        //change view
        int currentpage = (int)(scrollView.contentOffset.x/SCREEN_WIDTH);
        [self setBtnColorForOrderIndex:currentpage];
        _currentSelectIndex = currentpage;
    }

}


#pragma mark btnaction

-(void)orderButtonPressed:(id)sender{
    
    UIButton *selectBtn = (UIButton *)sender;
    [self setBtnColorForOrderIndex:(int)selectBtn.tag];
    _currentSelectIndex = (int)selectBtn.tag;
    [_allContentScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH*_currentSelectIndex, 0, SCREEN_WIDTH, self.containerView.height-35) animated:YES];
}

#pragma  mark  get --

-(UITableView *)allOrderTable{
    if (!_allOrderTable) {
        _allOrderTable = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height-35)];
        _allOrderTable.delegate = self;
        _allOrderTable.dataSource = self;
        _allOrderTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _allOrderTable.allowsSelection = YES;
        _allOrderTable.backgroundColor = K_BACKGROUND_COLOR;
        _allOrderTable.showsVerticalScrollIndicator = NO;
        _allOrderTable.showsHorizontalScrollIndicator = NO;
    }
    return _allOrderTable;
}

-(UITableView *)waitingForPayTable{
    if (!_waitingForPayTable) {
        _waitingForPayTable = [[UITableView alloc]initWithFrame: CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.containerView.height-35)];
        _waitingForPayTable.delegate = self;
        _waitingForPayTable.dataSource = self;
        _waitingForPayTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _waitingForPayTable.allowsSelection = YES;
        _waitingForPayTable.backgroundColor = K_BACKGROUND_COLOR;
        _waitingForPayTable.showsVerticalScrollIndicator = NO;
        _waitingForPayTable.showsHorizontalScrollIndicator = NO;
    }
    return _waitingForPayTable;
}


-(UITableView *)waitingForSendTable{
    if (!_waitingForSendTable) {
        _waitingForSendTable = [[UITableView alloc]initWithFrame: CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.containerView.height-35)];
        _waitingForSendTable.delegate = self;
        _waitingForSendTable.dataSource = self;
        _waitingForSendTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _waitingForSendTable.allowsSelection = YES;
        _waitingForSendTable.backgroundColor = K_BACKGROUND_COLOR;
        _waitingForSendTable.showsVerticalScrollIndicator = NO;
        _waitingForSendTable.showsHorizontalScrollIndicator = NO;
    }
    return _waitingForSendTable;
}


-(UITableView *)waitingForTakeTable{
    if (!_waitingForTakeTable) {
        _waitingForTakeTable = [[UITableView alloc]initWithFrame: CGRectMake(SCREEN_WIDTH*3, 0, SCREEN_WIDTH, self.containerView.height-35)];
        _waitingForTakeTable.delegate = self;
        _waitingForTakeTable.dataSource = self;
        _waitingForTakeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _waitingForTakeTable.allowsSelection = YES;
        _waitingForTakeTable.backgroundColor = K_BACKGROUND_COLOR;
        _waitingForTakeTable.showsVerticalScrollIndicator = NO;
        _waitingForTakeTable.showsHorizontalScrollIndicator = NO;
    }
    return _waitingForTakeTable;
}


-(UITableView *)waitingForAppraiseTable{
    if (!_waitingForAppraiseTable) {
        _waitingForAppraiseTable = [[UITableView alloc]initWithFrame: CGRectMake(SCREEN_WIDTH*4, 0, SCREEN_WIDTH, self.containerView.height-35)];
        _waitingForAppraiseTable.delegate = self;
        _waitingForAppraiseTable.dataSource = self;
        _waitingForAppraiseTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _waitingForAppraiseTable.allowsSelection = YES;
        _waitingForAppraiseTable.backgroundColor = K_BACKGROUND_COLOR;
        _waitingForAppraiseTable.showsVerticalScrollIndicator = NO;
        _waitingForAppraiseTable.showsHorizontalScrollIndicator = NO;
    }
    return _waitingForAppraiseTable;
}



-(UIButton *)allOrderBtn{
    if (!_allOrderBtn) {
        _allOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _allOrderBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH/5, 35);
        _allOrderBtn.adjustsImageWhenHighlighted = NO;
        _allOrderBtn.backgroundColor = kApp_Corlor_1;
        [_allOrderBtn.titleLabel setFont:FONT_TITLE(kFont_Size_4)];
        _allOrderBtn.tag = 0;
        [_allOrderBtn addTarget:self action:@selector(orderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_allOrderBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_allOrderBtn setTitle:@"全部订单" forState:UIControlStateNormal];
    }
    return _allOrderBtn;
}

-(UIButton *)waitingForPayBtn{
    if (!_waitingForPayBtn) {
        _waitingForPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _waitingForPayBtn.frame = CGRectMake(SCREEN_WIDTH/5, 0, SCREEN_WIDTH/5, 35);
        _waitingForPayBtn.adjustsImageWhenHighlighted = NO;
        [_waitingForPayBtn.titleLabel setFont:FONT_TITLE(kFont_Size_4)];
        _waitingForPayBtn.backgroundColor = kApp_Corlor_1;
        _waitingForPayBtn.tag = 1;
        [_waitingForPayBtn addTarget:self action:@selector(orderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_waitingForPayBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_waitingForPayBtn setTitle:@"待付款" forState:UIControlStateNormal];
    }
    return _waitingForPayBtn;
}

-(UIButton *)waitingForSendBtn{
    if (!_waitingForSendBtn) {
        _waitingForSendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _waitingForSendBtn.frame = CGRectMake((SCREEN_WIDTH/5)*2, 0, SCREEN_WIDTH/5, 35);
        _waitingForSendBtn.adjustsImageWhenHighlighted = NO;
        [_waitingForSendBtn.titleLabel setFont:FONT_TITLE(kFont_Size_4)];
        _waitingForSendBtn.tag = 2;
        _waitingForSendBtn.backgroundColor = kApp_Corlor_1;
        [_waitingForSendBtn addTarget:self action:@selector(orderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_waitingForSendBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_waitingForSendBtn setTitle:@"待发货" forState:UIControlStateNormal];
    }
    return _waitingForSendBtn;
}
-(UIButton *)waitingForTakeBtn{
    if (!_waitingForTakeBtn) {
        _waitingForTakeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _waitingForTakeBtn.frame = CGRectMake((SCREEN_WIDTH/5)*3, 0, SCREEN_WIDTH/5, 35);
        _waitingForTakeBtn.adjustsImageWhenHighlighted = NO;
        [_waitingForTakeBtn.titleLabel setFont:FONT_TITLE(kFont_Size_4)];
        _waitingForTakeBtn.tag = 3;
        _waitingForTakeBtn.backgroundColor = kApp_Corlor_1;
        [_waitingForTakeBtn addTarget:self action:@selector(orderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_waitingForTakeBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_waitingForTakeBtn setTitle:@"待收货" forState:UIControlStateNormal];
    }
    return _waitingForTakeBtn;
}
-(UIButton *)waitingForAppraiseBtn{
    if (!_waitingForAppraiseBtn) {
        _waitingForAppraiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _waitingForAppraiseBtn.frame = CGRectMake((SCREEN_WIDTH/5)*4, 0, SCREEN_WIDTH/5, 35);
        _waitingForAppraiseBtn.adjustsImageWhenHighlighted = NO;
        [_waitingForAppraiseBtn.titleLabel setFont:FONT_TITLE(kFont_Size_4)];
        _waitingForAppraiseBtn.tag = 4;
        _waitingForAppraiseBtn.backgroundColor = kApp_Corlor_1;
        [_waitingForAppraiseBtn addTarget:self action:@selector(orderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_waitingForAppraiseBtn setTitleColor:kApp_Corlor_2 forState:UIControlStateNormal];
        [_waitingForAppraiseBtn setTitle:@"待评价" forState:UIControlStateNormal];
    }
    return _waitingForAppraiseBtn;
}

-(UIScrollView *)allContentScrollView{
    if (!_allContentScrollView) {
        _allContentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.allOrderBtn.bottom, SCREEN_WIDTH,self.containerView.height-self.allOrderBtn.height)];
        _allContentScrollView.delegate = self;
        _allContentScrollView.bounces = NO;
        _allContentScrollView.showsVerticalScrollIndicator = NO;
        _allContentScrollView.showsHorizontalScrollIndicator = NO;
        [_allContentScrollView setPagingEnabled:YES];
        _allContentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*5, self.containerView.height-self.allOrderBtn.height);
        _allContentScrollView.backgroundColor = [UIColor clearColor];
    }
    return _allContentScrollView;
}

@end
