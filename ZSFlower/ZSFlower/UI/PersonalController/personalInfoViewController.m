//
//  personalInfoViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "personalInfoViewController.h"
#import "PersonalTableViewCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "AccountSafeViewController.h"
@interface personalInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,
                                            UINavigationControllerDelegate,UIImagePickerControllerDelegate,
                                            UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)UITableView *personalTable;
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)NSString     *nickName;
@property(nonatomic,strong)NSString     *sex;
@property(nonatomic,strong)NSString     *birthday;
@property(nonatomic,strong)UIPickerView *typePickView;
@property(nonatomic,strong)UIView *pickHeaderView;
@property(nonatomic,assign)NSInteger currentPickIndex;
@property(nonatomic,strong)UIDatePicker *datePick;
@property(nonatomic,assign)BOOL isSelectSex;
@property(nonatomic,assign)BOOL isSelectBirthday;
@end

@implementation personalInfoViewController
-(void)dealloc{
    _nickName = nil;
    _personalTable = nil;
    _headImageView = nil;
    _birthday = nil;
    _sex =nil;
    _typePickView = nil;
    _pickHeaderView = nil;
    _datePick = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self dataInit];
}

-(void)dataInit{
    _nickName = @"未设置";
    _sex = @"未设置";
    _birthday = @"未设置";
    _isSelectBirthday = NO;
    _isSelectSex = NO;
}
-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"我的账户";
    [self.containerView addSubview:self.personalTable];
    [self.containerView addSubview:self.pickHeaderView];
    [self.containerView addSubview:self.typePickView];
    [self.containerView addSubview:self.datePick];
}

-(void)back{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    } ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark PickerViewDataSource---

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

#pragma mark PickerViewDelegate--
// 返回组中的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
    
}
//返回每个item中的title
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        return @"男";
    }else {
        return @"女";
    }
}

//设置列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 100;
}

//选择行的事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (row == 0) {
        DLog(@"第一行");
    }
    else if (row == 1) {
        DLog(@"第二行");
    }
    _currentPickIndex = row;
}



#pragma mark btn action

-(void)chooseSex{
    
    if (_isSelectBirthday) {
        _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
         _pickHeaderView.top = SCREEN_HEIGHT-self.topImageView.height;
        [UIView animateWithDuration:0.3
                         animations:^{
                             _datePick.frame = CGRectMake(0,SCREEN_HEIGHT-216-self.topImageView.height, 0, 0);
                             _pickHeaderView.top = _datePick.top -40;
                         } completion:^(BOOL finished) {
                             
                         }];

    }
    else{
        _datePick.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
        _pickHeaderView.top = SCREEN_HEIGHT-self.topImageView.height;
        [UIView animateWithDuration:0.3
                         animations:^{
                             _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-216-self.topImageView.height, 0, 0);
                             _pickHeaderView.top = _typePickView.top -40;
                         } completion:^(BOOL finished) {

                         }];
    }
    
}


-(void)chooseSexComplete{
    
    
    if (_isSelectSex) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             _typePickView.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                             _pickHeaderView.top = _typePickView.top;
                         } completion:^(BOOL finished) {
                             
                             if (_currentPickIndex == 0) {
                                 _sex = @"男";
                             }
                             else{
                                 _sex = @"女";
                             }
                             [_personalTable reloadData];
                             _isSelectSex = NO;
                         }];
    }
    else{
        [UIView animateWithDuration:0.3
                         animations:^{
                             _datePick.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                             _pickHeaderView.top = _datePick.top;
                         } completion:^(BOOL finished) {
                             _isSelectBirthday = NO;
                             NSDateFormatter * timeFormatter = [[NSDateFormatter alloc] init];
                             [timeFormatter setDateFormat:@"yyyy年MM月dd日"];
                             _birthday = [timeFormatter stringFromDate:_datePick.date];
                             [_personalTable reloadData];
                         }];
    }

}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    } else if (section == 1) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *personalTableViewCell = @"UITableViewCell";
    PersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalTableViewCell];
    if(cell == nil) {
        cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalTableViewCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.accessoryView = nil;
    cell.lineView.hidden = YES;
    cell.nameLabel.left = 15;
    cell.nameLabel.centerY = 20;
    cell.nameLabel.font = FONT_TITLE(kFont_Size_2);
    cell.accessLabel.centerY = cell.nameLabel.centerY;
    cell.accessLabel.right = SCREEN_WIDTH - 30;
    if(indexPath.section == 0){
        
        if(indexPath.row == 0){
            cell.nameLabel.centerY = 34;
            cell.nameLabel.text = @"头像";
            self.headImageView.centerY = 34;
            self.headImageView.right = SCREEN_WIDTH - 30;
            [cell.contentView addSubview:self.headImageView];
        }else if(indexPath.row == 1){
            cell.nameLabel.text = @"昵称";
            cell.accessLabel.text = _nickName;
        }
        else if (indexPath.row == 2){
            cell.nameLabel.text = @"性别";
            cell.accessLabel.text = _sex;
        }
        else if (indexPath.row == 3){
            cell.nameLabel.text = @"出生日期";
            cell.accessLabel.text = _birthday;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0){
            cell.nameLabel.width = 200;
            cell.nameLabel.text = @"账户安全（可修改密码）";
           
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
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            return 68;
        }
        return 40;
    }
    return 40.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIActionSheet * sheet= [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"我的相册", nil];
            [sheet showInView:self.containerView];
        }
        else if (indexPath.row == 2){
            _isSelectSex = YES;
            _isSelectBirthday = NO;
            [self chooseSex];
        }
        else if (indexPath.row == 3){
            _isSelectBirthday = YES;
            _isSelectSex = NO;
            [self chooseSex];
        }
        
    }
    else{
        AccountSafeViewController  *acoountsafe = [[AccountSafeViewController alloc] init];
        [self.navigationController pushViewController:acoountsafe animated:YES];
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

        UIImagePickerController *imagepick = [[UIImagePickerController alloc] init];
        imagepick.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagepick.delegate = self;
        imagepick.allowsEditing = YES;
        //imagepick.showsCameraControls = YES;
        [self.navigationController presentViewController:imagepick animated:YES completion:^{
        
                    }];
                
    }
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo

{
    
    NSString *msg = nil;
    
    if(error != NULL)
        
    {
        
        msg = @"保存图片失败";
        
    }
    
    else
        
    {
        
        msg = @"保存图片成功";
        
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示"
                          
                                                    message:msg
                          
                                                   delegate:self
                          
                                          cancelButtonTitle:@"确定"
                          
                                          otherButtonTitles:nil];
    
    [alert show];
    
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
        
        _headImageView.image = edit;
        
        //获取图片裁剪后，剩下的图
       // UIImage* crop = [info objectForKey:UIImagePickerControllerCropRect];
        //获取图片的url
        //NSURL* url = [info objectForKey:UIImagePickerControllerMediaURL];
        //获取图片的metadata数据信息
      //  NSDictionary* metadata = [info objectForKey:UIImagePickerControllerMediaMetadata];
        //如果是拍照的照片，则需要手动保存到本地，系统不会自动保存拍照成功后的照片
        UIImageWriteToSavedPhotosAlbum(edit, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }else if([type isEqualToString:(NSString*)kUTTypeImage]&&picker.sourceType==UIImagePickerControllerSourceTypeSavedPhotosAlbum){
        UIImage* edit = [info objectForKey:UIImagePickerControllerEditedImage];
        _headImageView.image = edit;
    }
    //模态方式退出uiimagepickercontroller
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark get-
- (UITableView *)personalTable{
    if (!_personalTable) {
        _personalTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height) style:UITableViewStylePlain];
        _personalTable.delegate = self;
        _personalTable.dataSource = self;
        _personalTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _personalTable.backgroundColor = [UIColor clearColor];
        _personalTable.showsVerticalScrollIndicator = YES;
        _personalTable.showsHorizontalScrollIndicator = YES;
        _personalTable.tableFooterView = [[UIView alloc] init];
    }
    return _personalTable;
}

-(UIImageView *)headImageView{
    
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
        _headImageView.image = [PUUtil stretchImage:[UIImage imageNamed:@"personal__Head"] capInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch];
        _headImageView.layer.masksToBounds =YES;
        _headImageView.layer.cornerRadius = 24;
    }
    return _headImageView;

}


-(UIPickerView *)typePickView{
    
    if (!_typePickView) {
        _typePickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0)];
        _typePickView.delegate = self;
        _typePickView.dataSource = self;
        _typePickView.showsSelectionIndicator =YES;
        _typePickView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"d2d5db"];
        
    }
    return _typePickView;
}

-(UIView *)pickHeaderView{
    
    if (!_pickHeaderView) {
        
        _pickHeaderView  = [[UIView alloc] initWithFrame:CGRectMake(0, self.typePickView.top, SCREEN_WIDTH, 40)];
        
        _pickHeaderView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f0f1f2"];
        UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 0, 60, 40)];
        completeBtn.backgroundColor = [UIColor clearColor];
        [completeBtn setTitleColor:kApp_Corlor_5 forState:UIControlStateNormal];
        [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
        completeBtn.titleLabel.font = FONT_TITLE(kFont_Size_3);
        [completeBtn addTarget:self action:@selector(chooseSexComplete) forControlEvents:UIControlEventAllEvents];
        
        [_pickHeaderView addSubview:completeBtn];
    }
    return _pickHeaderView;
}

-(UIDatePicker *)datePick{
    
    if (!_datePick) {
        _datePick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-self.topImageView.height, SCREEN_WIDTH, 216)];
        // 设置时区
        [_datePick setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        // 设置当前显示时间
        [_datePick setDate:[NSDate date] animated:YES];
        // 设置显示最大时间（此处为当前时间）
        [_datePick setMaximumDate:[NSDate date]];
        // 设置UIDatePicker的显示模式
        [_datePick setDatePickerMode:UIDatePickerModeDate];
        // 当值发生改变的时候调用的方法
    }
    return _datePick;
}

@end
