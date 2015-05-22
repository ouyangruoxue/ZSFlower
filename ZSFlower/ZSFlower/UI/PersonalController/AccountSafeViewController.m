//
//  AccountSafeViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/22.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AccountSafeViewController.h"
#import "ChangeBindMobileViewController.h"

@interface AccountSafeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *accountTable;
@end

@implementation AccountSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


-(void)initUI{
    
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"我的账号";
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.accountTable];
}


#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0;
}

#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *acountcell = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:acountcell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acountcell];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"登陆密码";
    }
    else if (indexPath.row == 1){
        cell.textLabel.text = @"更改手机验证";
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-90, 10, 80, 20)];
        label.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        label.font = FONT_TITLE(kFont_Size_5);
        label.backgroundColor = [UIColor clearColor];
        label.lineBreakMode = NSLineBreakByTruncatingMiddle;
        NSRange range1 =  NSMakeRange(4, 4);
        NSString *textS = [@"18551718588" stringByReplacingCharactersInRange:range1 withString:@"****"];

        label.text = textS;
        [cell.contentView addSubview:label];
    }
    else if (indexPath.row == 2){
        cell.textLabel.text = @"支付密码";
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        ChangeBindMobileViewController *changemobile = [[ChangeBindMobileViewController alloc] init];
        [self.navigationController pushViewController:changemobile animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)accountTable{
    if (!_accountTable) {
        _accountTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height) style:UITableViewStylePlain];
        _accountTable.rowHeight = 40;
        _accountTable.delegate = self;
        _accountTable.dataSource = self;
        _accountTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _accountTable.backgroundColor = K_BACKGROUND_COLOR;
        if ([_accountTable respondsToSelector:@selector(setSeparatorInset:)]) {
            [_accountTable setSeparatorInset:UIEdgeInsetsZero];
        }
        _accountTable.tableFooterView = [[UIView alloc] init];
        _accountTable.showsVerticalScrollIndicator = YES;
        _accountTable.showsHorizontalScrollIndicator = YES;

    }
    return _accountTable;
}

@end
