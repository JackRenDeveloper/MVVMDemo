//
//  HomeViewModel.h
//  MVVMDemo
//
//  Created by JackRen on 16/4/20.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "BaseViewModelObject.h"

@interface HomeViewModel : BaseViewModelObject

@property (strong, nonatomic) RACSignal *requestSignal; ///< 网络请求信号量
@property (strong, nonatomic) NSArray *dataSource; ///< tableView的数据源
@property (assign, nonatomic) NSInteger currentPage; ///< 当前页码
@property (assign, nonatomic) BOOL iSRefresh;
@property (strong, nonatomic) NSMutableArray *articleViewModels; ///< 这个属性主要存储的是文章的vm，上拉加载的时候追加，下拉刷新的时候清空。防止直接修改dataSource

@end
