//
//  DownloadData.m
//
//  Created by JackRen on 15/10/16.
//  Copyright (c) 2015年 任海涛. All rights reserved.
//

#import "DownloadData.h"

@implementation DownloadData

#pragma 监测网络的状态
- (void)reachability
{
    // 检测网络连接状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 连接状态回调处理
    /* AFNetworking的Block内使用self须改为weakSelf, 避免循环强引用, 无法释放 */
    __weak typeof(self) weakSelf = self;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         switch (status)
         {
             case AFNetworkReachabilityStatusUnknown:
                 // 回调处理
                 NSLog(@"未知状态");
                 break;
             case AFNetworkReachabilityStatusNotReachable:
                 // 回调处理
                 NSLog(@"未连接网络");
                 break;
             case AFNetworkReachabilityStatusReachableViaWWAN:
                 // 回调处理
                 NSLog(@"3G或4G");
                 break;
             case AFNetworkReachabilityStatusReachableViaWiFi:
                 // 回调处理
                 NSLog(@"Wifi");
                 break;
             default:
                 break;
         }
     }];
}



#pragma 监测网络的可链接性
- (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
{
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
}

- (void)downloadUsePostWithURL:(NSString *)URL Parameters:(id)parameters {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (_delegate && [_delegate respondsToSelector:@selector(downloadSuccessWithDownloadData:Data:)]) {
            [_delegate downloadSuccessWithDownloadData:self Data:responseObject];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error description]);
        if (_delegate && [_delegate respondsToSelector:@selector(downloadErrorWithDownloadData:Data:)]) {
            [_delegate downloadErrorWithDownloadData:self Data:error];
        }
    }];
}

- (void)downloadUseGetWithURL:(NSString *)URL {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (_delegate && [_delegate respondsToSelector:@selector(downloadSuccessWithDownloadData:Data:)]) {
            [_delegate downloadSuccessWithDownloadData:self Data:responseObject];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error description]);
        if (_delegate && [_delegate respondsToSelector:@selector(downloadErrorWithDownloadData:Data:)]) {
            [_delegate downloadErrorWithDownloadData:self Data:error];
        }
    }];
}

@end
