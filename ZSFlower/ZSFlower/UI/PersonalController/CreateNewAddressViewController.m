//
//  CreateNewAddressViewController.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/25.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "CreateNewAddressViewController.h"
#import "CreateNewAddressCell.h"
#import "NewAddressModel.h"

@interface CreateNewAddressViewController ()<UITableViewDataSource,UITableViewDelegate,
                                               UIPickerViewDataSource,UIPickerViewDelegate >
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITableView *addressTable;
@property(nonatomic,strong)NewAddressModel *addressModel;
@property(nonatomic,strong)UIPickerView *addressPickView;
@property(nonatomic,strong)UIView *pickHeaderView;
@property(nonatomic,strong)UIView *pickbottomView;
@property(nonatomic,strong)NSArray *provincesArr;
@property(nonatomic,strong)NSArray *citiesArr;
@property(nonatomic,strong)NSArray *areasArr;
@property(nonatomic,strong)NSString *province;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *area;
@property(nonatomic,strong)UIButton *saveBtn;
@end

@implementation CreateNewAddressViewController

-(void)dealloc{
    _addressTable = nil;
    _backBtn = nil;
    _addressModel = nil;
    _provincesArr = nil;
    _citiesArr = nil;
    _areasArr = nil;
    _saveBtn = nil;
    _province = nil;
    _city = nil;
    _area = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initUI{
    _addressModel = [[NewAddressModel alloc] init];
    self.topImageView.backgroundColor = K_BACKGROUND_COLOR;
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText =@"新建收货人";
    self.titleLabel.textColor = kApp_Corlor_2;
    self.backButton = self.backBtn;
    [self.topContainerView addSubview:self.backButton];
    [self.containerView addSubview:self.addressTable];
    [self.containerView addSubview:self.saveBtn];
    _pickbottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height)];
    _pickbottomView.hidden = YES;
    _pickbottomView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCancel)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [_pickbottomView addGestureRecognizer:tapGesture];
    
    
    [_pickbottomView addSubview:self.addressPickView];
    [_pickbottomView addSubview:self.pickHeaderView];
    
    
    [self.containerView addSubview:_pickbottomView];
    
    if (IOS7_OR_LATER){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}


-(void)initData{
    
    _provincesArr = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
    _citiesArr = [[_provincesArr objectAtIndex:0] objectForKey:@"cities"];
    _areasArr = [[_citiesArr objectAtIndex:0] objectForKey:@"areas"];

    _province = [[_provincesArr objectAtIndex:0] objectForKey:@"state"];
    _city = [[_citiesArr objectAtIndex:0] objectForKey:@"city"];
    if ([_areasArr count] > 0) {
        _area = [_areasArr objectAtIndex:0];
    } else{
        _area = @"";
    }
    
}

#pragma mark buttonAction
-(void)saveAddress{

    if (((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]).contentField.text.length) {
        _addressModel.name = ((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]).contentField.text;
    }
    else{
        [PopupNotify showMessage:@"姓名不能为空"];
        return;
    }
    
    if (((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]).contentField.text.length) {
        _addressModel.mobileNum = ((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]).contentField.text;
    }
    else{
        [PopupNotify showMessage:@"手机号不能为空"];
        return;
    }

    
    if (((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]]).contentField.text.length) {
        _addressModel.cityAddress = ((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]]).contentField.text;
    }
    else{
        [PopupNotify showMessage:@"请选择城市"];
        return;
    }

    
    if (((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]]).contentField.text.length) {
        _addressModel.detailAddress = ((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]]).contentField.text;
    }
    else{
        [PopupNotify showMessage:@"请填写详细地址"];
        return;
    }

    
}

-(void)chooseAddressPickView{
    
    if (((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]).contentField.text.length) {
        _addressModel.name = ((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]).contentField.text;
    }
    
    if (((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]).contentField.text.length) {
        _addressModel.mobileNum = ((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]).contentField.text;
    }
    
    
    if (((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]]).contentField.text.length) {
        _addressModel.detailAddress = ((CreateNewAddressCell *)[_addressTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]]).contentField.text;
    }

    
    _pickbottomView.hidden = NO;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _addressPickView.frame = CGRectMake(0,SCREEN_HEIGHT-216-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _addressPickView.top -40;
                     } completion:^(BOOL finished) {
                         
                     }];
    
}


-(void)choosePickViewComplete{
    _pickbottomView.hidden = YES;
    _addressModel.cityAddress = [[_province stringByAppendingString:_city] stringByAppendingString:_area];
    [_addressTable reloadData];
    [UIView animateWithDuration:0.3
                     animations:^{
                         _addressPickView.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _addressPickView.top;
                     } completion:^(BOOL finished) {
                         
                     }];
}

-(void)cancelChoosePickView{
    
    _pickbottomView.hidden = YES;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _addressPickView.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _addressPickView.top;
                     } completion:^(BOOL finished) {
                         
                     }];

    
}


-(void)tapCancel{
    
    [self cancelChoosePickView];
}


#pragma mark uitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40.0;
}
#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *acountcell = @"CreateNewAddressCell";
    CreateNewAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:acountcell];
    if (cell == nil) {
        cell = [[CreateNewAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acountcell];
        cell.accessoryType =  UITableViewCellAccessoryNone;
    }
    if (indexPath.row == 0) {
        cell.nameLabel.text = @"收货人：";
        [cell.nameLabel sizeToFit];
        cell.contentField.text = _addressModel.name;
    }
    else if (indexPath.row == 1){
        cell.nameLabel.text = @"手机号码：";
        [cell.nameLabel sizeToFit];
        cell.contentField.text = _addressModel.mobileNum;
    }
    else if (indexPath.row == 2){
        cell.nameLabel.text = @"省、市、区：";
        [cell.nameLabel sizeToFit];
        cell.contentField.enabled = NO;
        cell.contentField.text = _addressModel.cityAddress;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.row == 3){
        cell.nameLabel.text = @"详细地址：";
        [cell.nameLabel sizeToFit];
        cell.contentField.text = _addressModel.detailAddress;
    }
    return cell;
    
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_addressTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [_addressTable setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_addressTable respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [_addressTable setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        [self chooseAddressPickView];
    }
}




#pragma mark - PickerView lifecycle

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

        return 3;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [_provincesArr count];
            break;
        case 1:
            return [_citiesArr count];
            break;
        case 2:
                return [_areasArr count];
                break;
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
        switch (component) {
            case 0:
                return [[_provincesArr objectAtIndex:row] objectForKey:@"state"];
                break;
            case 1:
                return [[_citiesArr objectAtIndex:row] objectForKey:@"city"];
                break;
            case 2:
                if ([_areasArr count] > 0) {
                    return [_areasArr objectAtIndex:row];
                    break;
                }
            default:
                return  @"";
                break;
        }
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
        switch (component) {
            case 0:
                _citiesArr = [[_provincesArr objectAtIndex:row] objectForKey:@"cities"];
                [self.addressPickView selectRow:0 inComponent:1 animated:YES];
                [self.addressPickView reloadComponent:1];
                
                _areasArr = [[_citiesArr objectAtIndex:0] objectForKey:@"areas"];
                [self.addressPickView selectRow:0 inComponent:2 animated:YES];
                [self.addressPickView reloadComponent:2];
                
                _province = [[_provincesArr objectAtIndex:row] objectForKey:@"state"];
                _city = [[_citiesArr objectAtIndex:0] objectForKey:@"city"];
                if ([_areasArr count] > 0) {
                    _area = [_areasArr objectAtIndex:0];
                } else{
                    _area = @"";
                }
                break;
            case 1:
                _areasArr = [[_citiesArr objectAtIndex:row] objectForKey:@"areas"];
                [self.addressPickView selectRow:0 inComponent:2 animated:YES];
                [self.addressPickView reloadComponent:2];
                
                _city = [[_citiesArr objectAtIndex:row] objectForKey:@"city"];
                break;
            case 2:
                {
                    if ([_areasArr count] > 0) {
                        _area = [_areasArr objectAtIndex:0];
                    } else{
                        _area = @"";
                }
            }
                break;
            default:
                break;
        }
        
    
}



#pragma mark get -

- (UITableView *)addressTable{
    if (!_addressTable) {
        _addressTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.width, self.containerView.height) style:UITableViewStylePlain];
        _addressTable.delegate = self;
        _addressTable.dataSource = self;
        _addressTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _addressTable.backgroundColor = K_BACKGROUND_COLOR;
        if ([_addressTable respondsToSelector:@selector(setSeparatorInset:)]) {
            [_addressTable setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_addressTable respondsToSelector:@selector(setLayoutMargins:)]) {
            
            [_addressTable setLayoutMargins:UIEdgeInsetsZero];
            
        }
        
        UIView *headview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        headview.backgroundColor = kApp_Corlor_8;
        
        _addressTable.tableHeaderView = headview;
        
        _addressTable.tableFooterView = [[UIView alloc] init];
        _addressTable.showsVerticalScrollIndicator = YES;
        _addressTable.showsHorizontalScrollIndicator = YES;
        
    }
    return _addressTable;
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

-(UIPickerView *)addressPickView{
    
    if (!_addressPickView) {
        _addressPickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0)];
        _addressPickView.delegate = self;
        _addressPickView.dataSource = self;
        _addressPickView.showsSelectionIndicator =YES;
        _addressPickView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"d2d5db"];
        
    }
    return _addressPickView;
}

-(UIView *)pickHeaderView{
    
    if (!_pickHeaderView) {
        
        _pickHeaderView  = [[UIView alloc] initWithFrame:CGRectMake(0, self.addressPickView.top, SCREEN_WIDTH, 40)];
        
        _pickHeaderView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f0f1f2"];
        UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 0, 60, 40)];
        completeBtn.backgroundColor = [UIColor clearColor];
        [completeBtn setTitleColor:kApp_Corlor_5 forState:UIControlStateNormal];
        [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
        completeBtn.titleLabel.font = FONT_TITLE(kFont_Size_3);
        [completeBtn addTarget:self action:@selector(choosePickViewComplete) forControlEvents:UIControlEventAllEvents];
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
        cancelBtn.backgroundColor = [UIColor clearColor];
        [cancelBtn setTitleColor:kApp_Corlor_5 forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = FONT_TITLE(kFont_Size_3);
        [cancelBtn addTarget:self action:@selector(cancelChoosePickView) forControlEvents:UIControlEventAllEvents];
        
        [_pickHeaderView addSubview:cancelBtn];
        [_pickHeaderView addSubview:completeBtn];
    }
    return _pickHeaderView;
}



-(UIButton *)saveBtn{
    
    if (!_saveBtn) {
        _saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.containerView.height-75, SCREEN_WIDTH-30, 45)];
        [_saveBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
        [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        _saveBtn.titleLabel.font = FONT_TITLE(kFont_Size_21);
        [_saveBtn addTarget:self action:@selector(saveAddress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveBtn;
}

@end
