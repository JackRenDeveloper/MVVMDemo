//
//  BaseViewModelObject.m
//  MVVMDemo
//
//  Created by JackRen on 16/4/20.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "BaseViewModelObject.h"

@implementation BaseViewModelObject


-(AFHTTPSessionManager *)sessionManager{
    
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
        
    }
    return _sessionManager;
}

// 在对象销毁时，别忘了取消已经在队列中的请求
- (void)dealloc {
    
    [self.sessionManager invalidateSessionCancelingTasks:YES];
}


@end
