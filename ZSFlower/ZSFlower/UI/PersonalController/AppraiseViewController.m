//
//  AppraiseViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/27.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "AppraiseViewController.h"
#import "MarkerView.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ELCImagePickerController.h"
#import "ShowScrollImgeViewController.h"


@interface AppraiseViewController ()<MarkerViewDelegate,UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ELCImagePickerControllerDelegate>
@property(nonatomic,strong)UIScrollView *appriaseScrollContainer;
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UIView *centerView;
@property(nonatomic,strong)UIView *BottomView;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITextView *appraiseContent;
@property(nonatomic,strong)UIButton  *addImageBtn;
@property(nonatomic,strong)UILabel *placeholderLabel;
@property(nonatomic,assign)int currentTotalImageNum;
@property(nonatomic,strong)NSMutableArray *addImageArr;
@property(nonatomic,strong)NSMutableArray *addImageBtnArr;
@property(nonatomic,strong)UIView *scrollBottom;
@property(nonatomic,strong)UIView *scrollHeadView;
@property(nonatomic,strong)UIScrollView *imageScrollView;
@property(nonatomic,strong)UIButton *ScrollrightBtn;
@property(nonatomic,strong)UILabel *scollTitleLabel;
@property(nonatomic,strong)NSMutableArray *imageViewArr;
@property(nonatomic,strong)UIButton *scrollBackBtn;
@property(nonatomic,assign)NSInteger currentIndex;

@end

@implementation AppraiseViewController

-(void)dealloc{
    
    _headView = nil;
    _centerView = nil;
    _BottomView = nil;
    _backBtn = nil;
    _appriaseScrollContainer = nil;
    _appraiseContent = nil;
    _addImageBtn = nil;
    _placeholderLabel =nil;
    _scrollBottom = nil;
    _scrollHeadView = nil;
    _ScrollrightBtn = nil;
    _scollTitleLabel = nil;
    _imageViewArr = nil;
    _addImageArr = nil;
    _addImageBtnArr = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


-(void)initUI{
    _addImageArr = [[NSMutableArray alloc] init];
    _addImageBtnArr = [[NSMutableArray alloc] init];
    _imageViewArr = [[NSMutableArray alloc] init];
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"评价晒单";
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.appriaseScrollContainer];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topContainerView.height-1, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = kApp_Corlor_8;
    [self.topContainerView addSubview:lineView];
    
     [self createHeaderView];
     [self createCenterView];
     [self createBottomView];
    [self imageScrollviewInit];
}


-(void)imageScrollviewInit{
    
    if (!_scrollBottom) {
        
        _scrollBottom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollBottom.backgroundColor = [UIColor colorWithWhite:0.0 alpha:1.0];
        _scrollBottom.hidden = YES;
    }
    
    CGFloat  height = 44;
    if (IOS7_OR_LATER) {
        height = 64;
    }

    if (!_scrollHeadView) {
        _scrollHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _scrollHeadView.userInteractionEnabled = YES;
        _scrollHeadView.backgroundColor = [UIColor clearColor];
        _scrollHeadView.top = height - _scrollHeadView.height;
        [_scrollHeadView addSubview:self.scollTitleLabel];
    }
    
    [_scrollHeadView addSubview:self.ScrollrightBtn];
    [_scrollHeadView addSubview:self.scrollBackBtn];
    [_scrollBottom addSubview:_scrollHeadView];
    
    [_scrollBottom addSubview:self.imageScrollView];
    
    [self.view addSubview:_scrollBottom];
}


-(void)createHeaderView{
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 85)];
    _headView.backgroundColor = [UIColor whiteColor];
    //商品图片
    UIImageView *articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 60, 60)];
    articleImage.contentMode = UIViewContentModeCenter;
    articleImage.backgroundColor = [UIColor redColor];
    articleImage.layer.cornerRadius = 4;
    articleImage.layer.masksToBounds = YES;
    articleImage.centerY = 42.5;
    [_headView addSubview:articleImage];
    
    
    UILabel *articletitleLabel = [[UILabel alloc] init];
    articletitleLabel.backgroundColor = [UIColor clearColor];
    articletitleLabel.numberOfLines = 2;
    articletitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    articletitleLabel.textAlignment = NSTextAlignmentLeft;
    articletitleLabel.textColor = kApp_Corlor_2;
    articletitleLabel.font = FONT_TITLE(kFont_Size_5);
    articletitleLabel.width = SCREEN_WIDTH-60-30-60;
    articletitleLabel.left = articleImage.right+5;
    articletitleLabel.top = articleImage.top+5;
    articletitleLabel.height  = 20;
    articletitleLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖";
    [articletitleLabel sizeToFit];
    [_headView addSubview:articletitleLabel];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.backgroundColor = [UIColor clearColor];
    priceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    priceLabel.textAlignment = NSTextAlignmentRight;
    priceLabel.textColor = kApp_Corlor_2;
    priceLabel.font = FONT_TITLE(kFont_Size_7);
    priceLabel.width = 60;
    priceLabel.left = articletitleLabel.left;
    priceLabel.top = articletitleLabel.bottom+5;
    priceLabel.height  = 15;
    priceLabel.text = @"￥166666.00";
    [_headView addSubview:priceLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _headView.height-0.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = kApp_Corlor_8;
    lineView.alpha = 0.3;
    [_headView addSubview:lineView];

    
    [self.appriaseScrollContainer addSubview:_headView];
    
    
}

-(void)createCenterView{
    _centerView = [[UIView alloc] initWithFrame:CGRectMake(0, _headView.bottom+10, SCREEN_WIDTH, 150)];
    _centerView.backgroundColor = [UIColor whiteColor];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    lineView.alpha = 0.3;
    lineView.backgroundColor = kApp_Corlor_8;
    [_centerView addSubview:lineView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = kApp_Corlor_2;
    titleLabel.font = FONT_TITLE(kFont_Size_5);
    titleLabel.text = @"服务评价";
    [_centerView addSubview:titleLabel];

    
    UILabel *advicetitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-115, 0, 100, 30)];
    advicetitleLabel.backgroundColor = [UIColor clearColor];
    advicetitleLabel.textAlignment = NSTextAlignmentRight;
    advicetitleLabel.textColor = kApp_Corlor_8;
    advicetitleLabel.font = FONT_TITLE(kFont_Size_5);
    advicetitleLabel.text = @"满意请给五星";
    [_centerView addSubview:advicetitleLabel];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 29.5, SCREEN_WIDTH, 0.5)];
    lineView1.backgroundColor = kApp_Corlor_8;
    lineView1.alpha = 0.3;
    [_centerView addSubview:lineView1];

   // articleMatching ,//商品描述相符
   // sellersAttitude,//卖家服务态度
   // logisticSpeed,//物流速度
   // courierAttitude,//配送人员态度
   // articleAppraise //商品评价
    
    UILabel *articleMatchingLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 75, 20)];
    articleMatchingLabel.backgroundColor = [UIColor clearColor];
    articleMatchingLabel.textAlignment = NSTextAlignmentLeft;
    articleMatchingLabel.textColor = kApp_Corlor_8;
    articleMatchingLabel.font = FONT_TITLE(kFont_Size_7);
    articleMatchingLabel.text = @"商品描述相符";
    [_centerView addSubview:articleMatchingLabel];

    
    MarkerView *articleMatchingMarkView = [[MarkerView alloc] initWithFrame:CGRectMake(articleMatchingLabel.right, 40, 100, 20) withType:articleMatching];
    articleMatchingMarkView.delegate = self;
    
    [_centerView addSubview:articleMatchingMarkView];
    
    
    UILabel *sellersAttitudeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, 75, 20)];
    sellersAttitudeLabel.backgroundColor = [UIColor clearColor];
    sellersAttitudeLabel.textAlignment = NSTextAlignmentLeft;
    sellersAttitudeLabel.textColor = kApp_Corlor_8;
    sellersAttitudeLabel.font = FONT_TITLE(kFont_Size_7);
    sellersAttitudeLabel.text = @"卖家服务态度";
    [_centerView addSubview:sellersAttitudeLabel];

    MarkerView *sellersAttitudeMarkView = [[MarkerView alloc] initWithFrame:CGRectMake(sellersAttitudeLabel.right, 60, 100, 20) withType:sellersAttitude];
    sellersAttitudeMarkView.delegate = self;
    
    [_centerView addSubview:sellersAttitudeMarkView];
    
    UILabel *logisticSpeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, 75, 20)];
    logisticSpeedLabel.backgroundColor = [UIColor clearColor];
    logisticSpeedLabel.textAlignment = NSTextAlignmentLeft;
    logisticSpeedLabel.textColor = kApp_Corlor_8;
    logisticSpeedLabel.font = FONT_TITLE(kFont_Size_7);
    logisticSpeedLabel.text = @"物流发货速度";
    [_centerView addSubview:logisticSpeedLabel];

    MarkerView *logisticSpeedMarkView = [[MarkerView alloc] initWithFrame:CGRectMake(logisticSpeedLabel.right, 80, 100, 20) withType:logisticSpeed];
    logisticSpeedMarkView.delegate = self;
    
    [_centerView addSubview:logisticSpeedMarkView];
    
    UILabel *courierAttitudeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, 75, 20)];
    courierAttitudeLabel.backgroundColor = [UIColor clearColor];
    courierAttitudeLabel.textAlignment = NSTextAlignmentLeft;
    courierAttitudeLabel.textColor = kApp_Corlor_8;
    courierAttitudeLabel.font = FONT_TITLE(kFont_Size_7);
    courierAttitudeLabel.text = @"配送人员态度";
    [_centerView addSubview:courierAttitudeLabel];
    
    MarkerView *courierAttitudeMarkView = [[MarkerView alloc] initWithFrame:CGRectMake(courierAttitudeLabel.right, 100, 100, 20) withType:courierAttitude];
    courierAttitudeMarkView.delegate = self;
    
    [_centerView addSubview:courierAttitudeMarkView];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, _centerView.height-0.5, SCREEN_WIDTH, 0.5)];
    lineView3.backgroundColor = kApp_Corlor_8;
    lineView3.alpha = 0.3;
    [_centerView addSubview:lineView3];
    
    [self.appriaseScrollContainer addSubview:_centerView];
}


-(void)createBottomView{
    
    _BottomView = [[UIView alloc] initWithFrame:CGRectMake(0, _centerView.bottom+10, SCREEN_WIDTH, 150)];
    _BottomView.backgroundColor = [UIColor whiteColor];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    lineView.alpha = 0.3;
    lineView.backgroundColor = kApp_Corlor_8;
    [_BottomView addSubview:lineView];
    
    UILabel *articleAppraiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 60, 30)];
    articleAppraiseLabel.backgroundColor = [UIColor clearColor];
    articleAppraiseLabel.textAlignment = NSTextAlignmentLeft;
    articleAppraiseLabel.textColor = kApp_Corlor_2;
    articleAppraiseLabel.font = FONT_TITLE(kFont_Size_5);
    articleAppraiseLabel.text = @"商品评价";
    [_BottomView addSubview:articleAppraiseLabel];
    
    
    MarkerView *articleAppraiseMarkView = [[MarkerView alloc] initWithFrame:CGRectMake(articleAppraiseLabel.right, 0, 100, 30) withType:articleAppraise];
    articleAppraiseMarkView.delegate = self;
    [_BottomView addSubview:articleAppraiseMarkView];
    
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(15, 29.5, SCREEN_WIDTH, 0.5)];
    lineView1.backgroundColor = kApp_Corlor_8;
    lineView1.alpha = 0.3;
    [_BottomView addSubview:lineView1];
    
    
     _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, lineView1.bottom, 120, 30)];
    _placeholderLabel.backgroundColor = [UIColor clearColor];
    _placeholderLabel.textAlignment = NSTextAlignmentLeft;
    _placeholderLabel.textColor = kApp_Corlor_8;
    _placeholderLabel.font = FONT_TITLE(kFont_Size_7);
    _placeholderLabel.text = @"长度在10—200个字之间";
    [_BottomView addSubview:_placeholderLabel];
    
    _appraiseContent = [[UITextView alloc] initWithFrame:CGRectMake(12, lineView1.bottom, SCREEN_WIDTH-30, 50)];
    _appraiseContent.delegate = self;
    _appraiseContent.backgroundColor =[UIColor clearColor];
    [_BottomView addSubview:_appraiseContent];
    
    
    //personal__Evaluation_Add
    _addImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _addImageBtn.exclusiveTouch = YES;
    _addImageBtn.tag = 100;
    _addImageBtn.backgroundColor = [UIColor clearColor];
    _addImageBtn.frame = CGRectMake(15, _BottomView.height-60, 55, 55);
    [_addImageBtn setImage:IMGNAMED(@"personal__Evaluation_Add") forState:UIControlStateNormal];
    [_addImageBtn addTarget:self action:@selector(addImageAction) forControlEvents:UIControlEventTouchUpInside];
    [_BottomView addSubview:_addImageBtn];
    
    [self.appriaseScrollContainer addSubview:_BottomView];
}

-(void)createBtnWithImage{
    
    _BottomView.height = 150;
    
    
    for (UIButton *temp in _addImageBtnArr) {
        
        [temp removeFromSuperview];
    }
    [_addImageBtnArr removeAllObjects];
    
    for (int i = 0; i<_addImageArr.count; i++) {
        
        UIImage *selectImage = [_addImageArr objectAtIndex:i];
        
      UIButton  *ImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        ImageBtn.exclusiveTouch = YES;
        ImageBtn.tag = i;
        ImageBtn.backgroundColor = [UIColor clearColor];
        ImageBtn.frame = CGRectMake(15+(15+(SCREEN_WIDTH-45)/2)*(i%2), _appraiseContent.bottom+15+(15+(SCREEN_WIDTH-45)/2)*(i/2), (SCREEN_WIDTH-45)/2, (SCREEN_WIDTH-45)/2);
        [ImageBtn setImage:selectImage forState:UIControlStateNormal];
        [ImageBtn addTarget:self action:@selector(showImageDetailAction:) forControlEvents:UIControlEventTouchUpInside];
        [_BottomView addSubview:ImageBtn];
        [_addImageBtnArr addObject:ImageBtn];
    }
    if (_addImageBtnArr.count >0) {
        
        _BottomView.height += (15+(SCREEN_WIDTH-45)/2)*((_addImageBtnArr.count)/2)+(15+(SCREEN_WIDTH-45)/2)*((_addImageBtnArr.count)%2);
        _appriaseScrollContainer.contentSize = CGSizeMake(SCREEN_WIDTH, _BottomView.height+255);
    }
    
    if (_addImageBtnArr.count<10) {
        _addImageBtn.frame = CGRectMake(15, _BottomView.height-60, 55, 55);
        _addImageBtn.hidden = NO;
    }
    else{
        _addImageBtn.hidden = YES;
        _BottomView.height -= 55;
    }
}


#pragma  mark buttonAction
//显示图片预览
-(void)showImageDetailAction:(id)sender{
    _scrollBottom.hidden = NO;
    UIButton *tapBtn = (UIButton *)sender;
    
    for (UIImageView* temp in _imageViewArr) {
        
        [temp removeFromSuperview];
    }
    [_imageViewArr removeAllObjects];
    
        _imageScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_addImageArr.count, SCREEN_HEIGHT-self.topImageView.height);
        
        for (int i = 0; i<_addImageArr.count; i++) {
            UIImage *tempImage = [_addImageArr objectAtIndex:i];
            UIImageView *tempimageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.topImageView.height)];
            [tempimageView setImage:tempImage];
            tempimageView.contentMode = UIViewContentModeScaleAspectFit;
            tempimageView.tag = i;
            [_imageScrollView addSubview:tempimageView];
            [_imageViewArr addObject:tempimageView];

        }
    [self.imageScrollView scrollRectToVisible:CGRectMake(tapBtn.tag*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.topImageView.height) animated:NO];
    self.scollTitleLabel.text =[NSString stringWithFormat:@"%ld/%lu",(long)tapBtn.tag+1,(unsigned long)_addImageArr.count];
    _currentIndex = tapBtn.tag;
}
-(void)addImageAction{
    
    UIActionSheet * sheet= [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"我的相册", nil];
    [sheet showInView:self.containerView];
}
//图片预览返回
-(void)scrollViewBack{
    
    _scrollBottom.hidden = YES;
    [self createBtnWithImage];
}

//图片预览删除
-(void)ScrollrightDeleteAction{
   
    if (_imageViewArr.count > 1) {
        
        UIImageView *selectImage = [_imageViewArr objectAtIndex:_currentIndex];
        [selectImage removeFromSuperview];
        
        [_imageViewArr removeObjectAtIndex:_currentIndex];
        
        [_addImageArr removeObjectAtIndex:_currentIndex];
        
        [self createBtnWithImage];
        
        int currentPage = ((int )_imageScrollView.contentOffset.x)/((int)SCREEN_WIDTH);
        _currentIndex = currentPage;
        
        self.scollTitleLabel.text =[NSString stringWithFormat:@"%ld/%lu",(long)_currentIndex+1,(unsigned long)_addImageArr.count];
        
        [self resetImageView];

    }
    else if(_imageViewArr.count == 1) {
        
        UIImageView *selectImage = [_imageViewArr objectAtIndex:_currentIndex];
        [selectImage removeFromSuperview];
        
        [_imageViewArr removeObjectAtIndex:_currentIndex];
        
        [_addImageArr removeObjectAtIndex:_currentIndex];
        
        [self createBtnWithImage];
        
        _scrollBottom.hidden = YES;
    }

}

-(void)resetImageView{
    
    _imageScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_addImageArr.count, SCREEN_HEIGHT-self.topImageView.height);
    for (int i = 0; i<_imageViewArr.count; i++) {
        UIImageView *tempImageView = [_imageViewArr objectAtIndex:i];
        [tempImageView setFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, self.containerView.height)];
        tempImageView.tag = i;
    }
    
    [self.imageScrollView scrollRectToVisible:CGRectMake(_currentIndex*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.topImageView.height) animated:NO];
}

#pragma mark ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (((int )scrollView.contentOffset.x) % ((int)SCREEN_WIDTH) == 0) {
        int currentPage = ((int )scrollView.contentOffset.x)/((int)SCREEN_WIDTH);
        _currentIndex = currentPage;
        self.scollTitleLabel.text =[NSString stringWithFormat:@"%ld/%lu",(long)currentPage+1,(unsigned long)_addImageArr.count];
    }
}

#pragma mark actionSheetdelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        UIImagePickerController *imagepick = [[UIImagePickerController alloc] init];
        imagepick.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagepick.showsCameraControls = YES;
        imagepick.allowsEditing = YES;
        imagepick.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        //设置相机支持的类型，拍照和录像
        imagepick.mediaTypes = @[(NSString*)kUTTypeImage,(NSString*)kUTTypeMovie];
        //设置拍摄时屏幕的view的transform属性，可以实现旋转，缩放功能
        imagepick.cameraViewTransform = CGAffineTransformMakeRotation(M_PI*45/180);
        imagepick.cameraViewTransform = CGAffineTransformMakeScale(1.5, 1.5);
        imagepick.delegate = self;
        [self.navigationController presentViewController:imagepick animated:YES completion:^{
            
        }];
    }
    else if (buttonIndex == 1){
        
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
        
        elcPicker.maximumImagesCount = 10-_addImageArr.count; //Set the maximum number of images to select to 100
        elcPicker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
        elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
        elcPicker.onOrder = NO; //For multiple image selection, display and return order of selected images
        elcPicker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie]; //Supports image and movie types
        
        elcPicker.imagePickerDelegate = self;
        
        [self presentViewController:elcPicker animated:YES completion:nil];
        
    }
}


#pragma mark uiimagepickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //通过UIImagePickerControllerMediaType判断返回的是照片还是视频
    NSString* type = [info objectForKey:UIImagePickerControllerMediaType];
    //如果返回的type等于kUTTypeImage，代表返回的是照片,并且需要判断当前相机使用的sourcetype是拍照还是相册
    if ([type isEqualToString:(NSString*)kUTTypeImage]&&picker.sourceType==UIImagePickerControllerSourceTypeCamera) {
        //获取照片的原图
        // UIImage* original = [info objectForKey:UIImagePickerControllerOriginalImage];
        //获取图片裁剪的图
        UIImage* edit = [info objectForKey:UIImagePickerControllerEditedImage];
        
        
        //获取图片裁剪后，剩下的图
        // UIImage* crop = [info objectForKey:UIImagePickerControllerCropRect];
        //获取图片的url
        //NSURL* url = [info objectForKey:UIImagePickerControllerMediaURL];
        //获取图片的metadata数据信息
        //  NSDictionary* metadata = [info objectForKey:UIImagePickerControllerMediaMetadata];
        //如果是拍照的照片，则需要手动保存到本地，系统不会自动保存拍照成功后的照片
        UIImageWriteToSavedPhotosAlbum(edit, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }else if([type isEqualToString:(NSString*)kUTTypeImage]&&picker.sourceType==UIImagePickerControllerSourceTypeSavedPhotosAlbum){
        //UIImage* edit = [info objectForKey:UIImagePickerControllerEditedImage];
        
    }
    //模态方式退出uiimagepickercontroller
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    for (NSDictionary *dict in info) {
        if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                
                [_addImageArr addObject:image];
                
            } else {
                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
        }     }
        [self createBtnWithImage];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark textViewDelegate

- (void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length == 0) {
        _placeholderLabel.text = @"长度在10—200个字之间";
    }
    else{
        _placeholderLabel.text = @"";

    }
}

#pragma mark makrerViewDelegate

-(void)markerViewDidSelectedStar:(NSInteger)star withType:(markingType)type{
    
    
}

#pragma mark get --

-(UIScrollView *)appriaseScrollContainer{
    
    if (!_appriaseScrollContainer) {
        _appriaseScrollContainer = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height)];
        _appriaseScrollContainer.bounces = YES;
        _appriaseScrollContainer.contentSize = CGSizeMake(SCREEN_WIDTH, self.containerView.height);
    }
    return _appriaseScrollContainer;
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
        [_ScrollrightBtn addTarget:self action:@selector(ScrollrightDeleteAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ScrollrightBtn;
}

-(UIScrollView *)imageScrollView{
    
    if (!_imageScrollView) {
        _imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.topImageView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-self.topImageView.height)];
        _imageScrollView.bounces = YES;
        _imageScrollView.delegate = self;
        _imageScrollView.pagingEnabled = YES;
    }
    return _imageScrollView;
}

- (UILabel *)scollTitleLabel{
    if (!_scollTitleLabel) {
        _scollTitleLabel = [[UILabel alloc] init];
        [_scollTitleLabel sizeToFit];
        _scollTitleLabel.width = SCREEN_WIDTH/2;
        _scollTitleLabel.height = 30;
        _scollTitleLabel.top = 7;
        _scollTitleLabel.centerX = SCREEN_WIDTH/2;
        _scollTitleLabel.backgroundColor = [UIColor clearColor];
        _scollTitleLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeCenter];
        _scollTitleLabel.textColor = kColorForTitleLabel;
        _scollTitleLabel.font = kSizeFontForTitleLabel;
    }
    return _scollTitleLabel;
}

- (UIButton *)scrollBackBtn {
    if (!_scrollBackBtn) {
        UIImage  *img = IMGNAMED(@"btn_back");
        _scrollBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _scrollBackBtn.exclusiveTouch = YES;
        _scrollBackBtn.backgroundColor = [UIColor clearColor];
        _scrollBackBtn.frame = CGRectMake(0, floorf((self.topContainerView.height-img.size.height)/2), img.size.width, img.size.height);
        [_scrollBackBtn setBackgroundImage:img forState:UIControlStateNormal];
        [_scrollBackBtn setBackgroundImage:IMGNAMED(@"btn_back_select") forState:UIControlStateSelected];
        [_scrollBackBtn addTarget:self action:@selector(scrollViewBack) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _scrollBackBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
