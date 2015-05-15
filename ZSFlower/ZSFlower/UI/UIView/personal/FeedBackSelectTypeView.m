//
//  FeedBackSelectTypeView.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/15.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "FeedBackSelectTypeView.h"
static FeedBackSelectTypeView *instance = nil;
@interface FeedBackSelectTypeView ()<UITableViewDelegate,UITableViewDataSource>{
    
    
}
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)NSArray *sourceDataArr;
@property(nonatomic,strong)UITableView *sourceTable;
@property(nonatomic,assign)NSInteger currentIndex;
@end
@implementation FeedBackSelectTypeView



+(id)viewWithDelegate:(id)aDelegate {
    if (instance == nil) {
        instance = [[FeedBackSelectTypeView alloc] initWithDelegate:aDelegate];
    }
    return instance;
}

-(void)dealloc{
    _bottomView = nil;
    _sourceTable = nil;
    _sourceDataArr = nil;
}

-(id)initWithDelegate:(id)aDelegate {
    if (self = [super init]) {
        
        _feedBackTypeDelegate = aDelegate;
        self.hidden = NO;
        self.alpha = 1.0f;
        self.windowLevel = UIWindowLevelStatusBar + 1.0f;
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        
        _currentIndex = 0;
        
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-60, 340)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.masksToBounds = YES;
        _bottomView.layer.cornerRadius = 4;

        _bottomView.center = self.center;
        [self addSubview:_bottomView];
        
        
       UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.top = 10;
        titleLabel.height = 20;
        titleLabel.width = SCREEN_WIDTH-60;
        titleLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeCenter];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = @"请选择反馈类型";
        titleLabel.centerX = (SCREEN_WIDTH-60)/2;
        titleLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        [_bottomView addSubview:titleLabel];
        
        
        [_bottomView addSubview:self.sourceTable];
        
        _sourceDataArr = @[@"功能意见",@"页面意见",@"操作意见",@"您的新需求",@"流量问题",@"其他"];
        
        [self creatTableViewFooter];
    }
    return self;
}


-(void)creatTableViewFooter{
    
    
    UIButton * closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(_bottomView.width-31, 10, 21, 21)];
    closeBtn.adjustsImageWhenHighlighted = NO;
    [closeBtn setBackgroundImage:IMGNAMED(@"personal__Opinion_close") forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:closeBtn];
    
    
    UIButton * okBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, _sourceTable.bottom, SCREEN_WIDTH-80, 30)];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    okBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
    okBtn.titleLabel.font = FONT_TITLE(kFont_Size_4);
    okBtn.layer.masksToBounds = YES;
    okBtn.layer.cornerRadius = 4;
    [okBtn addTarget:self action:@selector(ConfirmTheSelection) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:okBtn];
    
}

-(void)ConfirmTheSelection{
    
    [_feedBackTypeDelegate didSelectType:[_sourceDataArr objectAtIndex:_currentIndex]];
    [self hide];
}

- (void)hide {
    [UIView animateWithDuration:.3 animations:^{
        instance.alpha = 0;
    } completion:^(BOOL finished) {
        instance = nil;
    }];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_sourceDataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *settingTableViewCell = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingTableViewCell];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:settingTableViewCell];

    }
    cell.textLabel.text = [_sourceDataArr objectAtIndex:indexPath.row];
    cell.textLabel.font = FONT_TITLE(kFont_Size_4);
    if (indexPath.row == _currentIndex) {
        
            cell.imageView.image = IMGNAMED(@"personal__address_red");
    }
    else{
            cell.imageView.image = IMGNAMED(@"personal__address_gray");
    }
    cell.accessoryView = nil;
    if (indexPath.row == 0) {
                UIView  *toplineView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-80, 0.5)];
        toplineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [cell.contentView addSubview:toplineView];
        
        UIView  *bottomlineView = [[UIView alloc] initWithFrame:CGRectMake(10, 39.5, SCREEN_WIDTH-80, 0.5)];
        bottomlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [cell.contentView addSubview:bottomlineView];

    }
    else{
        UIView  *toplineView = [[UIView alloc] initWithFrame:CGRectMake(10, 39.5, SCREEN_WIDTH-80, 0.5)];
        toplineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [cell.contentView addSubview:toplineView];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40.0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _currentIndex = indexPath.row;
    [_sourceTable reloadData];
}


- (UITableView *)sourceTable{
    if (!_sourceTable) {
        _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, _bottomView.width, 260) style:UITableViewStylePlain];
        _sourceTable.rowHeight = 40;
        _sourceTable.delegate = self;
        _sourceTable.dataSource = self;
        _sourceTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _sourceTable.backgroundColor = [UIColor clearColor];
        _sourceTable.showsVerticalScrollIndicator = YES;
        _sourceTable.showsHorizontalScrollIndicator = YES;
        
    }
    return _sourceTable;
}


@end
