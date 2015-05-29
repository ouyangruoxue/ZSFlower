//
//  ShowScrollImgeViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/28.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ShowScrollImgeViewController.h"

@interface ShowScrollImgeViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *imageScrollView;
@property(nonatomic,assign)NSInteger currentindex;
@property(nonatomic,strong)NSMutableArray *appraiseImageArr;
@property(nonatomic,strong)UIButton *ScrollrightBtn;
@property(nonatomic,strong)NSMutableArray *imageViewArr;
@end

@implementation ShowScrollImgeViewController

-(void)dealloc{
    _imgeScrolldelegate = nil;
    _imageScrollView = nil;
   // _rightBtn = nil;
    _appraiseImageArr = nil;
}


-(id)initWithindex:(NSInteger)index andImageArr:(NSMutableArray *)imageArr{
    
    if (self = [super init]) {
        
        _currentindex = index;
        _appraiseImageArr = [NSMutableArray arrayWithArray:imageArr];
        _imageViewArr = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.topImageView.backgroundColor = [UIColor clearColor];
    self.topContainerView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
   // [self.topContainerView addSubview:self.rightBtn];
    self.titleText =[NSString stringWithFormat:@"%ld/%lu",(long)_currentindex+1,(unsigned long)_appraiseImageArr.count];
    self.titleLabel.textColor = kApp_Corlor_2;
    [self.containerView addSubview:self.imageScrollView];
    [self.topContainerView addSubview:self.backButton];
    [self ScrollViewInitForImageArr];
    
    [self.imageScrollView scrollRectToVisible:CGRectMake(_currentindex*SCREEN_WIDTH, 0, SCREEN_WIDTH, self.containerView.height) animated:NO];
}


-(void)ScrollViewInitForImageArr{
    
    _imageScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_appraiseImageArr.count, self.containerView.height);
    
    for (int i = 0; i<_appraiseImageArr.count; i++) {
        UIImage *tempImage = [_appraiseImageArr objectAtIndex:i];
        UIImageView *tempimageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, self.containerView.height)];
        [tempimageView setImage:tempImage];
        tempimageView.contentMode = UIViewContentModeScaleAspectFit;
        tempimageView.tag = i;
        [_imageScrollView addSubview:tempimageView];
        [_imageViewArr addObject:tempimageView];
    }
    
    
}

-(void)resetImageView{
    _imageScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_appraiseImageArr.count, self.containerView.height);
    for (int i = 0; i<_imageViewArr.count; i++) {
        UIImageView *tempImageView = [_imageViewArr objectAtIndex:i];
        [tempImageView setFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, self.containerView.height)];
        tempImageView.tag = i;
    }
}

#pragma mark ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

        if (((int )scrollView.contentOffset.x) % ((int)SCREEN_WIDTH) == 0) {
            int currentPage = ((int )scrollView.contentOffset.x)/((int)SCREEN_WIDTH);
            _currentindex = currentPage;
            self.titleText =[NSString stringWithFormat:@"%ld/%lu",(long)_currentindex+1,(unsigned long)_appraiseImageArr.count];
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark buttonaction

-(void)rightBarBtnClickAction{
    
    [_appraiseImageArr removeObjectAtIndex:_currentindex];
    UIImageView *appraiseImageView = [_imageViewArr objectAtIndex:_currentindex];
    [appraiseImageView removeFromSuperview];
    [_imageViewArr removeObjectAtIndex:_currentindex];
  
    [self resetImageView];
}


#pragma mark get --

-(UIButton *)ScrollrightBtn{
    
    if (!_ScrollrightBtn) {
        _ScrollrightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _ScrollrightBtn.exclusiveTouch = YES;
        _ScrollrightBtn.backgroundColor = [UIColor clearColor];
        _ScrollrightBtn.frame = CGRectMake(0, 0, 15, 15);
        _ScrollrightBtn.right  = SCREEN_WIDTH - 15;
        _ScrollrightBtn.centerY = self.topContainerView.height/2;
        [_ScrollrightBtn setImage:IMGNAMED(@"delete") forState:UIControlStateNormal];
        [_ScrollrightBtn addTarget:self action:@selector(rightBarBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ScrollrightBtn;
}

-(UIScrollView *)imageScrollView{
    
    if (!_imageScrollView) {
        _imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height)];
        _imageScrollView.bounces = YES;
        _imageScrollView.delegate = self;
        _imageScrollView.pagingEnabled = YES;
    }
    return _imageScrollView;
}

@end
