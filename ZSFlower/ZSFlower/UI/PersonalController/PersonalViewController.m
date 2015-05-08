//
//  personalViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/8.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalTableViewCell.h"
@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *personalTable;
@property (nonatomic,strong)UIButton *messageBtn;
@property (nonatomic,strong)UILabel *attentionLabel;
@property (nonatomic,strong)UILabel *browseRecordLabel;
@end

@implementation PersonalViewController

-(void)dealloc{
    _personalTable = nil;
    _messageBtn = nil;
    _attentionLabel = nil;
    _browseRecordLabel = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark UI init


-(void)initUI{
    
    [self.view addSubview:self.personalTable];
}

-(void)creatTableViewHeader{
    
    UIView *tableheadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 225)];
    tableheadView.backgroundColor = [UIColor clearColor];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 225)];
    [backImageView setImage:[PUUtil stretchImage:[UIImage imageNamed:@"personal_center-top"] capInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch]];
    
    [tableheadView addSubview:backImageView];
    
   UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 34, 18, 18)];
    settingBtn.backgroundColor = [UIColor clearColor];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"personal_center_set"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(projectSet) forControlEvents:UIControlEventTouchUpInside];
    [tableheadView addSubview:settingBtn];
    
    
    _messageBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 15 -22, 34, 22, 19)];
    _messageBtn.backgroundColor = [UIColor clearColor];
    [_messageBtn setBackgroundImage:[UIImage imageNamed:@"personal_center_news"] forState:UIControlStateNormal];
    [_messageBtn addTarget:self action:@selector(messageAction) forControlEvents:UIControlEventTouchUpInside];
    [tableheadView addSubview:_messageBtn];
    
    
    UIButton *loginbtn = [[UIButton alloc] init];
    loginbtn.top = 44;
    loginbtn.width = 94;
    loginbtn.height = 94;
    loginbtn.centerX = SCREEN_WIDTH/2;
    loginbtn.backgroundColor = [UIColor clearColor];
    [loginbtn setBackgroundImage:[UIImage imageNamed:@"personal_center_head"] forState:UIControlStateNormal];
    [loginbtn addTarget:self action:@selector(longinAction) forControlEvents:UIControlEventTouchUpInside];
    [tableheadView addSubview:loginbtn];
    
    
    UIView *lineView  = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    lineView.width = 1;
    lineView.height = 32;
    lineView.centerX = SCREEN_WIDTH/2;
    lineView.bottom = tableheadView.height - 4;
    [tableheadView addSubview:lineView];
    
    
    _attentionLabel = [[UILabel alloc] init];
    _attentionLabel.font = FONT_TITLE(kFont_Size_3);
    _attentionLabel.text = @"15";
    _attentionLabel.textColor = kApp_Corlor_1;
    _attentionLabel.backgroundColor = [UIColor clearColor];
    _attentionLabel.top = lineView.top;
    _attentionLabel.numberOfLines = 1;
    _attentionLabel.width = 100;
    _attentionLabel.height = 16;
    [_attentionLabel sizeToFit];
    _attentionLabel.centerX = SCREEN_WIDTH/4;
    [tableheadView addSubview:_attentionLabel];
    
    UILabel *attentionTitleLabel = [[UILabel alloc] init];
    attentionTitleLabel.font = FONT_TITLE(kFont_Size_4);
    attentionTitleLabel.textColor = kApp_Corlor_1;
    attentionTitleLabel.text = @"我的关注";
    attentionTitleLabel.backgroundColor = [UIColor clearColor];
    attentionTitleLabel.top = _attentionLabel.bottom;
    attentionTitleLabel.numberOfLines = 1;
    attentionTitleLabel.width = 100;
    attentionTitleLabel.height = 16;
    [attentionTitleLabel sizeToFit];
    attentionTitleLabel.centerX = SCREEN_WIDTH/4;
    [tableheadView addSubview:attentionTitleLabel];
    
    
    _browseRecordLabel = [[UILabel alloc] init];
    _browseRecordLabel.font = FONT_TITLE(kFont_Size_3);
    _browseRecordLabel.textColor = kApp_Corlor_1;
    _browseRecordLabel.text = @"25";
    _browseRecordLabel.backgroundColor = [UIColor clearColor];
    _browseRecordLabel.top = lineView.top;
    _browseRecordLabel.numberOfLines = 1;
    _browseRecordLabel.width = 100;
    _browseRecordLabel.height = 16;
    [_browseRecordLabel sizeToFit];
    _browseRecordLabel.centerX = SCREEN_WIDTH*3/4;
    [tableheadView addSubview:_browseRecordLabel];
    
    UILabel *browseRecordTitleLabel = [[UILabel alloc] init];
    browseRecordTitleLabel.font = FONT_TITLE(kFont_Size_4);
    browseRecordTitleLabel.textColor = kApp_Corlor_1;
    browseRecordTitleLabel.text = @"浏览记录";
    browseRecordTitleLabel.backgroundColor = [UIColor clearColor];
    browseRecordTitleLabel.top = _browseRecordLabel.bottom;
    browseRecordTitleLabel.numberOfLines = 1;
    browseRecordTitleLabel.width = 100;
    browseRecordTitleLabel.height = 16;
    [browseRecordTitleLabel sizeToFit];
    browseRecordTitleLabel.centerX = SCREEN_WIDTH*3/4;
    [tableheadView addSubview:browseRecordTitleLabel];
    
    
    UIButton *myattentionBtn = [[UIButton alloc] init];
    [myattentionBtn setBackgroundColor:[UIColor clearColor]];
    myattentionBtn.width = SCREEN_WIDTH/2;
    myattentionBtn.centerX = SCREEN_WIDTH/4;
    myattentionBtn.height = 40;
    myattentionBtn.centerY = lineView.centerY;
    [myattentionBtn addTarget:self action:@selector(myAttention) forControlEvents:UIControlEventTouchUpInside];
    [tableheadView addSubview:myattentionBtn];
    
    UIButton *browseRecorderBtn = [[UIButton alloc] init];
    [browseRecorderBtn setBackgroundColor:[UIColor clearColor]];
    browseRecorderBtn.width = SCREEN_WIDTH/2;
    browseRecorderBtn.height = 40;
    browseRecorderBtn.centerX = SCREEN_WIDTH*3/4;
    browseRecorderBtn.centerY = lineView.centerY;

    [browseRecorderBtn addTarget:self action:@selector(myBrowseRecorders) forControlEvents:UIControlEventTouchUpInside];
    [tableheadView addSubview:browseRecorderBtn];
    
    _personalTable.tableHeaderView = tableheadView;
    
}

#pragma mark BUTTONACTION

-(void)projectSet{
    
}

-(void)messageAction{
    
}

-(void)longinAction{
    
}

-(void)myAttention{
    DLog(@"进入我的关注");
}

-(void)myBrowseRecorders{
    DLog(@"进入浏览记录");
}

#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else{
        return 5;
    }
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 8;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        
        return 10;
    }
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
    
        if (indexPath.row == 0) {
            return 64;
        }
        else{
            return 44;
        }
    }
    else{
        return 44;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"PersonalTableViewCell";
    PersonalTableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            cell.lineView.bottom = 64;
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        else{
            cell.iconImage.image = [UIImage imageNamed:@"personal_center_order"];
            cell.nameLabel.text = @"全部订单";
            cell.accessLabel.text = @"查看全部订单";
        }
        
    }
    else{
        
        NSInteger index = [indexPath row];
        switch (index) {
            case 0:{
                cell.iconImage.image = [UIImage imageNamed:@"personal_center_address"];
                cell.nameLabel.text = @"收货地址";
                }
                break;
            case 1:{
                cell.iconImage.image = [UIImage imageNamed:@"personal_center_bank"];
                cell.nameLabel.text = @"银行卡绑定";
            }
                
                break;
                
            case 2:{
                cell.iconImage.image = [UIImage imageNamed:@"personal_center_redpaper"];
                cell.nameLabel.text = @"我的红包";
                cell.redPoint.hidden = NO;
               
            }
                
                break;
            case 3:{
                cell.iconImage.image = [UIImage imageNamed:@"personal_center_suggestion"];
                cell.nameLabel.text = @"意见反馈";
            }
                
                break;
            case 4:{
                cell.iconImage.image = [UIImage imageNamed:@"personal_center_enjoy"];
                cell.nameLabel.text = @"猜你喜欢";
                cell.accessoryType =  UITableViewCellAccessoryNone;
            }
                
                break;
                
            default:
                break;
        }
    }
    return cell;
    
}




#pragma mark get --

-(UITableView *)personalTable{
    if (!_personalTable) {
        _personalTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-KTABBARHEIGHT) style:UITableViewStylePlain];
        _personalTable.delegate = self;
        _personalTable.dataSource = self;
        _personalTable.backgroundColor = [UIColor clearColor];
        _personalTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _personalTable.showsHorizontalScrollIndicator = NO;
        _personalTable.showsVerticalScrollIndicator = NO;
        _personalTable.bounces = NO;
        [self creatTableViewHeader];
    }
    return _personalTable;
}

@end
