//
//  HomeViewModel.m
//  MVVMDemo
//
//  Created by JackRen on 16/4/20.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "HomeViewModel.h"
#import "AfterLoginModel.h"
#import "CellViewModel.h"

@implementation HomeViewModel


/**
 *  通过信号两请求数据的两种方法
 *
 *  @return 返回的是数据
 */
-(RACSignal *)requestSignal{
    
    
    if (!_requestSignal) {
        
        @weakify(self);
        
        _requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
            
            @strongify(self);
            
            // 配置网络请求参数
            NSDictionary *paramers = @{@"dp":@"zhbc", @"m":@"getLocalMessage", @"userType":@"1", @"uid":@"5", @"startIndex":[NSString stringWithFormat:@"%ld",self.currentPage], @"querySize":@"10", @"latitude":[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"myLatitude"]], @"longitude":[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"myLongitude"]], @"city":[[NSUserDefaults standardUserDefaults] objectForKey:@"CityName"]};
            
//            NSDictionary *parameters = @{@"page": @(self.currentPage)};
//            
//            NSURLSessionDataTask *task = [self.sessionManager POST:@"http://www.brighttj.com/api/index.php/api/article/articleList" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject){
//                
//                /**
//                 *  判断数据为空返回
//                 */
////                NSString *msg = responseObject[@"success"];
////                if ([msg integerValue] == 0) {
////                    [MBProgressHUD showError:responseObject[@"msg"]];
////                    return;
////                }
//                // 将请求下来的字典->模型
//                NSArray *articleArray = responseObject[@"data"][@"articleList"];
//                
//                if (self.iSRefresh) {
//                    [self.articleViewModels removeAllObjects];
//                }
//                
//                for (NSDictionary *articleDictionary in articleArray) {
//                    AfterLoginModel *articleModel = [AfterLoginModel WorkerModelWithDictionary:articleDictionary];
//                    // 根据模型，初始化cell的vm
//                    CellViewModel *cellmodel = [[CellViewModel alloc] initWithModel:articleModel];
//                    // 将cell的vm存入数组
//                    [self.articleViewModels addObject:cellmodel];
//                }
//                // 完成数据处理后，赋值给dataSource
//                self.dataSource = [self.articleViewModels copy];
//                [subscriber sendNext:self.dataSource];
//                [subscriber sendCompleted];
//                
//            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//                
//                [subscriber sendError:error];
//            }];
            
            
             AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager POST:RCommonUrl parameters:paramers success:^(AFHTTPRequestOperation *operation, id responseObject) {
                            NSLog(@"=====model %@", responseObject);
                                /**
                                 *  判断数据为空返回
                                 */
                                NSString *msg = responseObject[@"success"];
                                if ([msg integerValue] == 0) {
                                    [MBProgressHUD showError:responseObject[@"msg"]];
                                    return;
                                }
                                // 将请求下来的字典->模型
                                NSArray *articleArray = responseObject[@"data"];
                
                                if (self.iSRefresh) {
                                    [self.articleViewModels removeAllObjects];
                                }
                
                                for (NSDictionary *articleDictionary in articleArray) {
                                    AfterLoginModel *articleModel = [AfterLoginModel WorkerModelWithDictionary:articleDictionary];
                                    // 根据模型，初始化cell的vm
                                    CellViewModel *cellmodel = [[CellViewModel alloc] initWithModel:articleModel];
                                    // 将cell的vm存入数组
                                    [self.articleViewModels addObject:cellmodel];
                                }
                                // 完成数据处理后，赋值给dataSource
                                self.dataSource = [self.articleViewModels copy];
                                [subscriber sendNext:self.dataSource];
                                [subscriber sendCompleted];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"%@", error);
                
            }];

            // 在信号量作废时，取消网络请求
            return [RACDisposable disposableWithBlock:^{
                [manager.operationQueue cancelAllOperations];
            }];
            
        }];
        
    }
    return _requestSignal;
    
}

- (NSMutableArray *)articleViewModels {
    
    if (!_articleViewModels) {
        _articleViewModels = [NSMutableArray new];
    }
    return _articleViewModels;
}


@end
