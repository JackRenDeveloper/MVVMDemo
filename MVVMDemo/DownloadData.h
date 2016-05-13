//
//  DownloadData.h
//
//  Created by JackRen on 15/10/16.
//  Copyright (c) 2015年 任海涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DownloadData;
@protocol DownloadDataDelegate <NSObject>

- (void)downloadSuccessWithDownloadData:(DownloadData *)dawonLoadData Data:(NSData *)responseObject;
@optional
- (void)downloadErrorWithDownloadData:(DownloadData *)dawonLoadData Data:(NSError *)error;

@end

@interface DownloadData : NSObject

@property (nonatomic, weak)id<DownloadDataDelegate> delegate;
/**
 *  Post请求数据
 *
 */
- (void)downloadUsePostWithURL:(NSString *)URL Parameters:(id)parameters;

/**
 *  get请求数据
 *
 */

- (void)downloadUseGetWithURL:(NSString *)URL;
/**
 *  监测网络的可链接性
 *
 *  @param strUrl 请求的url
 *
 *  @return yes no
 */
-(BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;
/**
 *  检测网络的状态
 */
- (void)reachability;

@end
