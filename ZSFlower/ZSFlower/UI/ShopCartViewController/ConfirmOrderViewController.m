//
//  ConfirmOrderViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/6/2.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ConfirmOrderViewController.h"

@interface ConfirmOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITableView *confirmTable;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *mobileLabel;
@property(nonatomic,strong)UILabel *addressLabel;
@end

@implementation ConfirmOrderViewController

-(void)dealloc{
    _backBtn = nil;
    _confirmTable = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"确认订单";
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = kApp_Corlor_8;
    lineView.alpha = 0.3;
    [self.topContainerView addSubview:lineView];
    [self.containerView addSubview:self.confirmTable];
}


-(void)createTableViewHeadr{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55)];
    headView.backgroundColor = [UIColor whiteColor];
    
    UIButton *enterAddressBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55)];
    enterAddressBtn.backgroundColor = [UIColor clearColor];
    [enterAddressBtn addTarget:self action:@selector(enterAddress) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:enterAddressBtn];
    
    UIImageView *imageAddress = [[UIImageView alloc] initWithImage:IMGNAMED(@"shoppingcar_order_ad")];
    imageAddress.left = 15;
    imageAddress.centerY = headView.height/2;
    [headView addSubview:imageAddress];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageAddress.right+5, imageAddress.top-5, 100, 15)];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.font = FONT_TITLE(kFont_Size_4);
    _nameLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeLeft];
    _nameLabel.text = @"尉迟旌德";
    [headView addSubview:_nameLabel];
    
    
    _mobileLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.right+5, imageAddress.top-5, 100, 15)];
    _mobileLabel.backgroundColor = [UIColor clearColor];
    _mobileLabel.font = FONT_TITLE(kFont_Size_4);
    _mobileLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeLeft];
    _mobileLabel.text = @"18551718588";
    [headView addSubview:_mobileLabel];
    
    
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageAddress.right+5, _nameLabel.bottom+5, SCREEN_WIDTH-70, 15)];
    _addressLabel.backgroundColor = [UIColor clearColor];
    _addressLabel.font = FONT_TITLE(kFont_Size_6);
    _addressLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeLeft];
    _addressLabel.textColor = kApp_Corlor_8;
    _addressLabel.text = @"江苏省南京市雨花台区宁双路28号汇智大厦1106室";
    [headView addSubview:_addressLabel];

    UIImageView *imageDisclosureIndicator = [[UIImageView alloc] initWithImage:IMGNAMED(@"arrowhead")];
    imageDisclosureIndicator.centerY = headView.height/2;
    imageDisclosureIndicator.right = SCREEN_WIDTH -15;
    [headView addSubview:imageDisclosureIndicator];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, headView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = kApp_Corlor_8;
    lineView.alpha = 0.3;
    [headView addSubview:lineView];
    
    _confirmTable.tableHeaderView = headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark buttonaction

-(void)enterAddress{
    
    
}

-(void)switchChange:(UISwitch*)sender {


}

#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  6;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
        return 10;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 70;
    }
    else if(indexPath.row == 1){
        return 40;
    }
    else if(indexPath.row == 2){
        return 35;
    }

    else if(indexPath.row == 3){
        
        return 45;
    }

    else{
        return 35;
    }
    return 0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *personalCell = @"UITableViewCell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
    
        cell.accessoryType =  UITableViewCellAccessoryNone;
        cell.contentView.backgroundColor =K_BACKGROUND_COLOR;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 0) {
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        headView.backgroundColor= [UIColor whiteColor];
        [cell.contentView addSubview:headView];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];

        [headView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, headView.height-0.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];

        [headView addSubview:bottomLine];
        
        
        //商品图片
       UIImageView *articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 45, 45)];
        articleImage.contentMode = UIViewContentModeCenter;
        articleImage.backgroundColor = [UIColor redColor];
        articleImage.layer.cornerRadius = 4;
        articleImage.layer.masksToBounds = YES;
        articleImage.centerY = 30;
        [headView addSubview:articleImage];
        
        
       UILabel *articletitleLabel = [[UILabel alloc] init];
        articletitleLabel.backgroundColor = [UIColor clearColor];
        articletitleLabel.numberOfLines = 2;
        articletitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        articletitleLabel.textAlignment = NSTextAlignmentLeft;
        articletitleLabel.textColor = kApp_Corlor_8;
        articletitleLabel.font = FONT_TITLE(kFont_Size_5);
        articletitleLabel.width = SCREEN_WIDTH-60-30-60;
        articletitleLabel.left = articleImage.right+5;
        articletitleLabel.top = articleImage.top;
        articletitleLabel.height  = 20;
        articletitleLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖";
        [articletitleLabel sizeToFit];
        [headView addSubview:articletitleLabel];
        
       UILabel *numberLabel = [[UILabel alloc] init];
        numberLabel.backgroundColor = [UIColor clearColor];
        numberLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        numberLabel.textAlignment = NSTextAlignmentLeft;
        numberLabel.textColor = kApp_Corlor_8;
        numberLabel.font = FONT_TITLE(kFont_Size_8);
        numberLabel.width = 50;
        numberLabel.left = articletitleLabel.left;
        numberLabel.top = articletitleLabel.bottom+5;
        numberLabel.height  = 13;
        numberLabel.text = @"x1";
        [headView addSubview:numberLabel];
        
       UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor clearColor];
        priceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        priceLabel.font = FONT_TITLE(kFont_Size_7);
        priceLabel.width = 100;
        priceLabel.right = SCREEN_WIDTH-15;
        priceLabel.top = articletitleLabel.bottom+5;
        priceLabel.height  = 15;
        priceLabel.text = @"￥166666.00";
        [headView addSubview:priceLabel];

        
    }
    else if (indexPath.row == 1){
        cell.contentView.backgroundColor = kApp_Corlor_1;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.textColor = kApp_Corlor_8;
        cell.textLabel.font = FONT_TITLE(kFont_Size_5);
        cell.textLabel.text =@"支付配送";
        
        UILabel *typeLabel = [[UILabel alloc] init];
        typeLabel.backgroundColor = [UIColor clearColor];
        typeLabel.numberOfLines = 2;
        typeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        typeLabel.textAlignment = NSTextAlignmentLeft;
        typeLabel.textColor = kApp_Corlor_2;
        typeLabel.font = FONT_TITLE(kFont_Size_7);
        typeLabel.width = SCREEN_WIDTH-60-30-60;
        typeLabel.height  = 30;
        typeLabel.text = @"在线支付，普通快递";
        [typeLabel sizeToFit];
        typeLabel.right = SCREEN_WIDTH - 30;
        typeLabel.centerY = 20;
        [cell.contentView addSubview:typeLabel];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [cell.contentView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [cell.contentView addSubview:bottomLine];
        
    }
    else if (indexPath.row ==2){
        cell.contentView.backgroundColor = kApp_Corlor_1;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = kApp_Corlor_8;
        cell.textLabel.font = FONT_TITLE(kFont_Size_5);
        
        cell.textLabel.text = @"发票信息";
        
        UILabel *receiptContent = [[UILabel alloc] init];
        receiptContent.backgroundColor = [UIColor clearColor];
        receiptContent.numberOfLines = 2;
        receiptContent.lineBreakMode = NSLineBreakByTruncatingTail;
        receiptContent.textAlignment = NSTextAlignmentLeft;
        receiptContent.textColor = kApp_Corlor_2;
        receiptContent.font = FONT_TITLE(kFont_Size_7);
        receiptContent.width = SCREEN_WIDTH-60-30-60;
        receiptContent.height  = 15;
        receiptContent.text = @"不开发票";
        [receiptContent sizeToFit];
        receiptContent.right = SCREEN_WIDTH - 30;
        receiptContent.centerY = 35/2;
        [cell.contentView addSubview:receiptContent];
        
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 34.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [cell.contentView addSubview:bottomLine];

    }
    else if(indexPath.row == 3){
        cell.contentView.backgroundColor = K_BACKGROUND_COLOR;
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 40)];
        bottomView.backgroundColor = kApp_Corlor_1;
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [bottomView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [bottomView addSubview:bottomLine];

        
        UILabel *title = [[UILabel alloc] init];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = NSTextAlignmentLeft;
        title.textColor = kApp_Corlor_8;
        title.font = FONT_TITLE(kFont_Size_7);
        title.width = 60;
        title.height  = 15;
        title.text = @"红包";
        title.left = 15;
        title.centerY = 20;
        
        [bottomView addSubview:title];
        
        
        UISwitch *redpacketSwitch = [[UISwitch alloc]init];
        redpacketSwitch.tag = 1001;
        [redpacketSwitch setOn:NO];
        redpacketSwitch.centerY = 20;
        redpacketSwitch.right = SCREEN_WIDTH -15;
        [redpacketSwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
        
        [bottomView addSubview:redpacketSwitch];
        
        [cell.contentView addSubview:bottomView];
    }
    else if(indexPath.row == 4){
        cell.contentView.backgroundColor = kApp_Corlor_1;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = kApp_Corlor_8;
        cell.textLabel.font = FONT_TITLE(kFont_Size_5);
        cell.textLabel.text = @"商品金额";
        
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor clearColor];
        priceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        priceLabel.font = FONT_TITLE(kFont_Size_7);
        priceLabel.width = 100;
        priceLabel.height  = 15;
        priceLabel.text = @"￥166666.00";
        cell.accessoryView = priceLabel;
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [cell.contentView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 34.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [cell.contentView addSubview:bottomLine];

        
    }
    else if(indexPath.row == 5){
        cell.contentView.backgroundColor = kApp_Corlor_1;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = kApp_Corlor_8;
        cell.textLabel.font = FONT_TITLE(kFont_Size_5);
        
        cell.textLabel.text = @"运费";
        
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor clearColor];
        priceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        priceLabel.font = FONT_TITLE(kFont_Size_7);
        priceLabel.width = 100;
        priceLabel.height  = 15;
        priceLabel.text = @"￥166666.00";
        cell.accessoryView = priceLabel;
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [cell.contentView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 34.5, SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        
        [cell.contentView addSubview:bottomLine];

    }

    return cell;
}



#pragma mark get -
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

-(UITableView *)confirmTable{
    
    if (!_confirmTable) {
        _confirmTable = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height)];
        _confirmTable.delegate = self;
        _confirmTable.dataSource = self;
        _confirmTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _confirmTable.allowsSelection = YES;
        _confirmTable.backgroundColor = K_BACKGROUND_COLOR;
        _confirmTable.showsVerticalScrollIndicator = NO;
        _confirmTable.showsHorizontalScrollIndicator = NO;
        _confirmTable.tableFooterView = [[UIView alloc] init];
        [self createTableViewHeadr];
    }
    return _confirmTable;
}

@end
