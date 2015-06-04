//
//  SettingViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/14.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{


}
@property (nonatomic,strong)  UISwitch  *noPicSwitch;
@property (nonatomic, assign) CGFloat     cachefileSize;
@property (nonatomic, strong) UITableView *setTableView;
@end

@implementation SettingViewController


- (void)dealloc {
    
    //view
    
    _noPicSwitch = nil;
    _setTableView = nil;
    
    self.containerView = nil;
    self.topContainerView = nil;
    
}


- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


-(void)initUI{
    
    self.view.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText = @"设置";
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.setTableView];
    //无图模式开关switch
    _noPicSwitch = [[UISwitch alloc]init];
    _noPicSwitch.tag = 1001;
    BOOL isNoPic =[USER_DEFAULT  boolForKey:kNoPictureMode];
    [_noPicSwitch setOn:isNoPic];
    [_noPicSwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)reloadData{
    [self.setTableView reloadData];
}


#pragma mark btnAction

-(void)loginOut{
    
    
}


#pragma mark ----
-(void)creatTableViewFooter{
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 65)];
    [footerView setBackgroundColor:[UIColor clearColor]];
    
    UIButton * loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 45)];
    [loginBtn setBackgroundImage:[PUUtil stretchImage:IMGNAMED(@"loginBtn") capInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]  forState:UIControlStateNormal];
    [loginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
    [loginBtn addTarget:self action:@selector(loginOut) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:loginBtn];
    
    _setTableView.tableFooterView = footerView;
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *settingTableViewCell = @"settingTableViewCell";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingTableViewCell];
    if(cell == nil) {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:settingTableViewCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.accessoryView = nil;
    if(indexPath.section == 0){
        
        if(indexPath.row == 0){
            cell.textLabel.text = @"2G/3G/4G网络为无图模式";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryView = _noPicSwitch;
            cell.bottomlineView.hidden = YES;
        }else if(indexPath.row == 1){
            cell.bottomlineView.left =0;
            cell.bottomlineView.width = SCREEN_WIDTH;
            cell.toplineView.hidden = YES;
            cell.textLabel.text = @"清除缓存";
            UILabel * label = [[UILabel alloc] init];
            label.textColor = kApp_Corlor_8;
            label.font = FONT_TITLE(kFont_Size_6);
            label.backgroundColor = [UIColor clearColor];
            
            if(self.cachefileSize<1.0){
                label.text = [NSString stringWithFormat:@"%0.1f KB",self.cachefileSize*1000];
            }else{
                
                label.text = [NSString stringWithFormat:@"%0.2f MB", self.cachefileSize];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [label sizeToFit];
            cell.accessoryView = label;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0){
            cell.bottomlineView.left =0;
            cell.bottomlineView.width = SCREEN_WIDTH;
            cell.textLabel.text = @"关于我们";
            UILabel * label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = kApp_Corlor_8;
            label.font = FONT_TITLE(kFont_Size_6);
#if DEBUG
            label.text = [NSString stringWithFormat:@"%@", APP_SUB_VERSION];
#else
            label.text = [NSString stringWithFormat:@"%@", APP_VERSION];
#endif
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [label sizeToFit];
            cell.accessoryView = label;
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 0;
    }
    else{
        return 10;
    }
    return 15.0;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40.0;
}

//切换无图模式
-(void)switchChange:(UISwitch*)sender {
    [USER_DEFAULT  setBool:sender.on forKey:kNoPictureMode];
    [USER_DEFAULT  synchronize];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.section ==0){
        if (indexPath.row == 1) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"清除缓存" message:@"确定要清除缓存的内容吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            alertView.tag = 1002;
            [alertView show];
        }
    }
    else if (indexPath.section == 1){
        
        if (indexPath.row == 1){
            //AboutUsViewController *serviceVC = [[AboutUsViewController alloc]init];
            //[self.navigationController pushViewController:serviceVC animated:YES];
        }
    }
}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(alertView.tag == 1002){
        if(buttonIndex == 1){
            [PopupNotify showIndicatorViewWithMessage:@"正在清理中..."];
            
            __block __typeof(self) weakSelf = self;
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [[SDImageCache sharedImageCache]clearMemory];
                [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
                    [weakSelf reloadTable];
                }];
            });
            
            //no need delete the files in document
            NSString *documemtPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)objectAtIndex:0];
            NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:documemtPath];
            for (NSString *p in files){
                DLog(@"document file :%@",p);
            }
            
            //delete all cache files
            dispatch_async(
                           dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                           , ^{
                               NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
                               NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                               for (NSString *p in files) {
                                   DLog(@"cache file :%@",p);
                                   NSError *error;
                                   NSString *path = [cachPath stringByAppendingPathComponent:p];
                                   if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                                       [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                                       if (error) {
                                           DLog(@"delete failed");
                                       }
                                   }
                               }});
        }
    }
}

- (void)reloadTable{
    _cachefileSize = 0;
    [_setTableView reloadData];
    [PopupNotify hideIndicatorView];
}

#pragma mark - getter
- (CGFloat)cachefileSize{
    if (_cachefileSize<=0) {
        SDImageCache *cache = [SDImageCache sharedImageCache];
        NSUInteger cachesize = [cache getSize];
        NSString *stringInt = [NSString stringWithFormat:@"%lu",(unsigned long)cachesize];
        _cachefileSize = [stringInt floatValue]/1024/1024;
    }
    return _cachefileSize;
}

- (UITableView *)setTableView{
    if (!_setTableView) {
        _setTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height) style:UITableViewStylePlain];
        _setTableView.rowHeight = 40;
        _setTableView.delegate = self;
        _setTableView.dataSource = self;
        _setTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _setTableView.backgroundColor = [UIColor clearColor];
        if ([_setTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_setTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        _setTableView.showsVerticalScrollIndicator = YES;
        _setTableView.showsHorizontalScrollIndicator = YES;
        [self creatTableViewFooter];
    }
    return _setTableView;
}


@end
