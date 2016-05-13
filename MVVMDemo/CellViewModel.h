//
//  CellViewModel.h
//  MVVMDemo
//
//  Created by JackRen on 16/4/20.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AfterLoginModel.h"

@interface CellViewModel : NSObject


@property (nonatomic,strong) AfterLoginModel *afterModel;

- (instancetype)initWithModel:(AfterLoginModel *)articleModel;

@end
