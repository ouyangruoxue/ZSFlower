//
//  ViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/19.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyCollectionCommodityTableViewCell.h"
#import "MycollectionShopTableViewCell.h"
@interface MyCollectionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView *titleSegmentBack;
@property(nonatomic,strong)UITableView  *myCollectionTable;
@property(nonatomic,strong)UIButton    *commodityBtn;
@property(nonatomic,strong)UIButton    *shopBtn;
@property(nonatomic,assign)NSInteger   currentIndex;
@property(nonatomic,strong)UIButton *defalutBtn;
@property(nonatomic,strong)UIButton *cutPriceBtn;
@property(nonatomic,strong)UIButton *promotionBtn;
@property(nonatomic,strong)UIButton *screeningBtn;
@property(nonatomic,assign)myAttentionType attentionType;
@property(nonatomic,strong)UIButton *backBtn;
@end

@implementation MyCollectionViewController

-(void)dealloc{
    _titleSegmentBack = nil;
    _myCollectionTable = nil;
    _commodityBtn = nil;
    _shopBtn = nil;
    _defalutBtn = nil;
    _cutPriceBtn = nil;
    _promotionBtn = nil;
    _screeningBtn = nil;
    _backBtn = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    [self.topContainerView addSubview:self.titleSegmentBack];
    [self.topContainerView addSubview:self.commodityBtn];
    [self.topContainerView addSubview:self.shopBtn];
    [self.containerView addSubview:self.myCollectionTable];
    _currentIndex = 0;
    _attentionType = Kdefault;
}


-(void)createTableHeadr{
    
    UIView * headrView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headrView.backgroundColor = K_BACKGROUND_COLOR;
  
    [headrView addSubview:self.defalutBtn];
    [headrView addSubview:self.cutPriceBtn];
    [headrView addSubview:self.promotionBtn];
    [headrView addSubview:self.screeningBtn];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 29, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = kApp_Corlor_8;
    [headrView addSubview:lineView];
    
    self.myCollectionTable.tableHeaderView = headrView;

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
    
    return 5;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_currentIndex == 0) {
        return 125;
    }
    else{
        return 65;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_currentIndex == 0) {
        
        static NSString *BrowseHistory = @"MyCollectionCommodityTableViewCell";
        MyCollectionCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BrowseHistory];
        if (cell == nil) {
            cell = [[MyCollectionCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BrowseHistory];
            cell.accessoryType =  UITableViewCellAccessoryNone;
        }
        
        return cell;

    }
    else{
        static NSString *BrowseHistory = @"MycollectionShopTableViewCell";
        MycollectionShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BrowseHistory];
        if (cell == nil) {
            cell = [[MycollectionShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BrowseHistory];
            cell.accessoryType =  UITableViewCellAccessoryNone;
        }
        
        return cell;

    }
    
}


#pragma  mark button action

-(void)commoditySelect{
    if (_currentIndex == 0) {
        return;
    }
    self.rightBarButtonTitle = nil;
    _currentIndex = 0;
    _shopBtn.selected = NO;
    _commodityBtn.selected = YES;
    _titleSegmentBack.image = [PUUtil stretchImage:[UIImage imageNamed:@"personal__concern_Commodity"] capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch];
    _myCollectionTable.tableHeaderView.height = 30;
    [self createTableHeadr];
    [_myCollectionTable reloadData];
}

-(void)shopBtnSelect{
    if (_currentIndex == 1) {
        return;
    }
    self.rightBarButtonTitle = @"筛选";
    [self.rightButton setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
    [self.rightButton.titleLabel setFont:FONT_TITLE(kFont_Size_14)];
    _currentIndex = 1;
    _commodityBtn.selected = NO;
    _shopBtn.selected = YES;
    _titleSegmentBack.image = [PUUtil stretchImage:[UIImage imageNamed:@"personal__concern_shop"] capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch];

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 29, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = kApp_Corlor_8;
    _myCollectionTable.tableHeaderView = lineView;
    [_myCollectionTable reloadData];
}

-(void)defalutCommoditySelect{
    
    if (!_defalutBtn.selected) {
        _attentionType = Kdefault;
        _defalutBtn.selected = YES;
        _cutPriceBtn.selected = NO;
        _promotionBtn.selected = NO;
        _screeningBtn.selected = NO;
    }
}

-(void)cutPriceFirstCommoditySelect{
    if (!_cutPriceBtn.selected) {
        _attentionType = kcutPrice;
        _defalutBtn.selected = NO;
        _cutPriceBtn.selected = YES;
        _promotionBtn.selected = NO;
        _screeningBtn.selected = NO;
    }
}

-(void)promotionCommoditySelect{
    if (!_promotionBtn.selected) {
        _attentionType = Kpromotion;
        _defalutBtn.selected = NO;
        _cutPriceBtn.selected = NO;
        _promotionBtn.selected = YES;
        _screeningBtn.selected = NO;
    }
}

-(void)screeningCommoditySelect{
    if (!_screeningBtn.selected) {
        _attentionType = Ksceening;
        _defalutBtn.selected = NO;
        _cutPriceBtn.selected = NO;
        _promotionBtn.selected = NO;
        _screeningBtn.selected = YES;
    }
}
#pragma  mark get--

-(UIButton *)defalutBtn{
    
    if (!_defalutBtn) {
        _defalutBtn = [[UIButton alloc] init];
        [_defalutBtn setTitle:@"默认" forState:UIControlStateNormal];
        _defalutBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        _defalutBtn.selected = YES;
        _defalutBtn.height = 30;
        _defalutBtn.width = SCREEN_WIDTH/4;
        _defalutBtn.centerY = 15;
        _defalutBtn.centerX = SCREEN_WIDTH/8;
        
        [_defalutBtn addTarget:self action:@selector(defalutCommoditySelect) forControlEvents:UIControlEventTouchUpInside];
        [_defalutBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [_defalutBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateSelected];
    }
    return _defalutBtn;
}


-(UIButton *)cutPriceBtn{
    
    if (!_cutPriceBtn) {
        _cutPriceBtn = [[UIButton alloc] init];
        [_cutPriceBtn setTitle:@"降价优先" forState:UIControlStateNormal];
        _cutPriceBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        _cutPriceBtn.selected = NO;
        _cutPriceBtn.height = 30;
        _cutPriceBtn.width = SCREEN_WIDTH/4;
        _cutPriceBtn.centerY = 15;
        _cutPriceBtn.centerX = SCREEN_WIDTH/8*3;
        
        [_cutPriceBtn addTarget:self action:@selector(cutPriceFirstCommoditySelect) forControlEvents:UIControlEventTouchUpInside];
        [_cutPriceBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [_cutPriceBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateSelected];
    }
    return _cutPriceBtn;
}


-(UIButton *)promotionBtn{
    
    if (!_promotionBtn) {
        _promotionBtn = [[UIButton alloc] init];
        [_promotionBtn setTitle:@"促销优先" forState:UIControlStateNormal];
        _promotionBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        _promotionBtn.selected = NO;
        _promotionBtn.height = 30;
        _promotionBtn.width = SCREEN_WIDTH/4;
        _promotionBtn.centerY = 15;
        _promotionBtn.centerX = SCREEN_WIDTH/8*5;
        
        [_promotionBtn addTarget:self action:@selector(promotionCommoditySelect) forControlEvents:UIControlEventTouchUpInside];
        [_promotionBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [_promotionBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateSelected];
    }
    return _promotionBtn;
}


-(UIButton *)screeningBtn{
    
    if (!_screeningBtn) {
        _screeningBtn = [[UIButton alloc] init];
        [_screeningBtn setTitle:@"筛选" forState:UIControlStateNormal];
        _screeningBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        _screeningBtn.selected = NO;
        _screeningBtn.height = 30;
        _screeningBtn.width = SCREEN_WIDTH/4;
        _screeningBtn.centerY = 15;
        _screeningBtn.centerX = SCREEN_WIDTH/8*7;
        
        [_screeningBtn addTarget:self action:@selector(screeningCommoditySelect) forControlEvents:UIControlEventTouchUpInside];
        [_screeningBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [_screeningBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"f66060"] forState:UIControlStateSelected];
    }
    return _screeningBtn;
}


- (UITableView *)myCollectionTable{
    if (!_myCollectionTable) {
        _myCollectionTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height) style:UITableViewStylePlain];
        _myCollectionTable.delegate = self;
        _myCollectionTable.dataSource = self;
        _myCollectionTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _myCollectionTable.backgroundColor = [UIColor clearColor];
        _myCollectionTable.showsVerticalScrollIndicator = YES;
        _myCollectionTable.showsHorizontalScrollIndicator = YES;
        _myCollectionTable.tableFooterView = [[UIView alloc] init];
        [self createTableHeadr];
        
    }
    return _myCollectionTable;
}



-(UIButton *)commodityBtn{
    
    if (!_commodityBtn) {
        
        _commodityBtn = [[UIButton alloc] init];
        [_commodityBtn setTitle:@"商品" forState:UIControlStateNormal];
        _commodityBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        _commodityBtn.selected = YES;
        _commodityBtn.height = 20;
        _commodityBtn.width = 60;
        _commodityBtn.centerY = self.topContainerView.height/2;
        _commodityBtn.centerX = self.titleSegmentBack.centerX - 30;

        [_commodityBtn addTarget:self action:@selector(commoditySelect) forControlEvents:UIControlEventTouchUpInside];
        [_commodityBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"47c535"] forState:UIControlStateNormal];
        [_commodityBtn setTitleColor:kApp_Corlor_1 forState:UIControlStateSelected];
    }
    return _commodityBtn;
}

-(UIButton *)shopBtn{
    
    if (!_shopBtn) {
        
        _shopBtn = [[UIButton alloc] init];
        [_shopBtn setTitle:@"店铺" forState:UIControlStateNormal];
        _shopBtn.titleLabel.font = FONT_TITLE(kFont_Size_5);
        _shopBtn.selected = NO;
        _shopBtn.width = 60;
        _shopBtn.height = 20;
        _shopBtn.centerY = self.topContainerView.height/2;
        _shopBtn.centerX = self.titleSegmentBack.centerX + 30;
        [_shopBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"47c535"] forState:UIControlStateNormal];
        [_shopBtn setTitleColor:kApp_Corlor_1 forState:UIControlStateSelected];
        [_shopBtn addTarget:self action:@selector(shopBtnSelect) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shopBtn;
}


-(UIImageView *)titleSegmentBack{
    
    if (!_titleSegmentBack) {
        _titleSegmentBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 20)];
        _titleSegmentBack.image = [PUUtil stretchImage:[UIImage imageNamed:@"personal__concern_Commodity"] capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch];
        _titleSegmentBack.centerX = SCREEN_WIDTH/2;
        _titleSegmentBack.centerY = self.topContainerView.height/2;
    }
    return _titleSegmentBack;

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
