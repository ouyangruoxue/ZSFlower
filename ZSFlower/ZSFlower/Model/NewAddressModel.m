//
//  NewAddressModel.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/26.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "NewAddressModel.h"

@implementation NewAddressModel

-(void)dealloc{
    
    _name = nil;
    _cityAddress = nil;
    _detailAddress = nil;
    _mobileNum = nil;

}


- (id)init
{
    if (self = [super init])
    {
    
    }
    return self;
}

@end
