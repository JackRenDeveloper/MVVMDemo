//
//  CellViewModel.m
//  MVVMDemo
//
//  Created by JackRen on 16/4/20.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "CellViewModel.h"


@implementation CellViewModel

- (instancetype)initWithModel:(AfterLoginModel *)articleModel {
    self = [super init];
    if (self) {
        self.afterModel = articleModel;
    }
    
    return self;
}


// 处理Model中的数据
- (void)setupData {
    
}

@end
