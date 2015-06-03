//
//  ShopCartViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/10.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ShopCartViewController.h"
#import "ShopCartTableViewCell.h"
#import "ConfirmOrderViewController.h"
@interface ShopCartViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)BOOL isFromTabbar;
@property(nonatomic,strong)UITableView *shopCartTable;
@property(nonatomic,strong)UIButton *allSelectBtn;
@property(nonatomic,strong)UILabel  *totalPriceLabel;
@property(nonatomic,strong)UIButton *payButton;
@property(nonatomic,strong)UIView   *payBottomView;
@property(nonatomic,strong)UIButton *backBtn;
@end

@implementation ShopCartViewController

-(void)dealloc{
    _shopCartTable = nil;
    _allSelectBtn = nil;
    _totalPriceLabel = nil;
    _payButton = nil;
    _payBottomView = nil;
}


-(id)initISFromTabbar:(BOOL)yesOrNo{
    
    if (self = [super init]) {
        
        _isFromTabbar = yesOrNo;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)initUI{
    
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"购物车";
    self.titleLabel.textColor = kApp_Corlor_2;
    if (!_isFromTabbar) {
        self.backButton = self.backBtn;
      [self.topContainerView addSubview:self.backButton];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = kApp_Corlor_8;
    lineView.alpha = 0.3;
    [self.topContainerView addSubview:lineView];
    [self.containerView addSubview:self.shopCartTable];
    
    CGFloat yoffset = 0;
    
    if (_isFromTabbar) {
        yoffset = self.containerView.height -KTABBARHEIGHT -40;
    }
    else{
        yoffset = self.containerView.height - 40;
    }
    
    _payBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, yoffset, SCREEN_WIDTH, 40)];
    _payBottomView.backgroundColor = kApp_Corlor_1;
    
    [_payBottomView addSubview:self.allSelectBtn];
    
    UILabel *allSelectLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 30, 20)];
    allSelectLabel.backgroundColor = [UIColor clearColor];
    allSelectLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    allSelectLabel.textAlignment = NSTextAlignmentCenter;
    allSelectLabel.textColor = kApp_Corlor_2;
    allSelectLabel.font = FONT_TITLE(kFont_Size_14);
    allSelectLabel.text = @"全选";
    [_payBottomView addSubview:allSelectLabel];
    
    [_payBottomView addSubview:self.totalPriceLabel];
    [_payBottomView addSubview:self.payButton];
    
    [self.containerView addSubview:_payBottomView];
}

#pragma mark buttonAction

-(void)allSelectAction:(id)sender{
    
    _allSelectBtn.selected = !((UIButton *)sender).selected;
    
    [_shopCartTable reloadData];
}


-(void)payAction{
    
    ConfirmOrderViewController *tempOrder  = [[ConfirmOrderViewController alloc] init];
    [self .navigationController pushViewController:tempOrder animated:YES];
}

#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 155;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"ShopCartTableViewCell";
    ShopCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[ShopCartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        //cell.personalOrderDelegate =self;
        cell.accessoryType =  UITableViewCellAccessoryNone;
    }
    if (_allSelectBtn.selected) {
        cell.orderSelectBtn.selected = YES;
    }
    else{
        cell.orderSelectBtn.selected = NO;
    }
    return cell;
}


#pragma mark get--
-(UITableView *)shopCartTable{
    if (!_shopCartTable) {
        _shopCartTable = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height-KTABBARHEIGHT-40)];
        if (!_isFromTabbar) {
            _shopCartTable.height = self.containerView.height-40;
        }
        _shopCartTable.delegate = self;
        _shopCartTable.dataSource = self;
        _shopCartTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _shopCartTable.allowsSelection = YES;
        _shopCartTable.backgroundColor = K_BACKGROUND_COLOR;
        _shopCartTable.showsVerticalScrollIndicator = NO;
        _shopCartTable.showsHorizontalScrollIndicator = NO;
        _shopCartTable.tableFooterView = [[UIView alloc] init];
    }
    return _shopCartTable;
}

#pragma mark get --

-(UIButton *)allSelectBtn{
    
    if (!_allSelectBtn) {
        _allSelectBtn = [[UIButton alloc] init];
        _allSelectBtn.width = 15;
        _allSelectBtn.height = 15;
        _allSelectBtn.centerY = 20;
        _allSelectBtn.left = 15;
        _allSelectBtn.backgroundColor = [UIColor clearColor];
        [_allSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_gray"] forState:UIControlStateNormal];
        [_allSelectBtn setBackgroundImage:[UIImage imageNamed:@"personal__address_red"] forState:UIControlStateSelected];
        [_allSelectBtn addTarget:self action:@selector(allSelectAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allSelectBtn;
}

-(UIButton *)payButton{
    
    if (!_payButton) {
        _payButton = [[UIButton alloc] init];
        _payButton.width = 80;
        _payButton.height = 40;
        _payButton.centerY = 20;
        _payButton.right = SCREEN_WIDTH;
        _payButton.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        [_payButton setTitle:@"结算" forState:UIControlStateNormal];
        [_payButton addTarget:self action:@selector(payAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payButton;
}


-(UILabel *)totalPriceLabel{
    
    if (!_totalPriceLabel) {
        
        _totalPriceLabel = [[UILabel alloc] init];
        _totalPriceLabel.backgroundColor = [UIColor clearColor];
        _totalPriceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _totalPriceLabel.textAlignment = NSTextAlignmentCenter;
        _totalPriceLabel.textColor = kApp_Corlor_2;
        _totalPriceLabel.font = FONT_TITLE(kFont_Size_14);
        _totalPriceLabel.width = 150;
        _totalPriceLabel.top = 10;
        _totalPriceLabel.height  = 20;
        _totalPriceLabel.centerX = SCREEN_WIDTH/2;
        _totalPriceLabel.text = @"合计：￥368";
        //[_totalPriceLabel sizeToFit];
    }
    return _totalPriceLabel;
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
