//
//  ViewController.m
//  MVVMDemo
//
//  Created by JackRen on 16/4/5.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "ViewController.h"
#import "HomePageAfterLoginTableViewCell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_tableView;
    NSInteger Page;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUND;
    [self createTableView];
    
}


// 发起请求
- (void)sendRequest:(NSInteger )page iSRefresh:(BOOL)isrefresh{
    
    NSLog(@"--------------->%li",(long)page);
    @weakify(self);
    self.viewModel.currentPage = page;
    self.viewModel.iSRefresh = isrefresh;
    [self.viewModel.requestSignal subscribeNext:^(NSArray *articles) {
        
        @strongify(self);
        // 请求完成后，刷新表格
        [_tableView reloadData];
        if (isrefresh) {
            Page =1;
        }
        
    } error:^(NSError *error) {
        [_tableView reloadData];
        // 如果请求失败，则根据error做出相应提示
        NSLog(@"失败。。。。");
        
        if (Page<=1) {
            Page=1;
        }else{
            Page--;
        }
    }];
}

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    
    Page = 1;
    [self sendRequest:1 iSRefresh:YES];
    
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self sendRequest:1 iSRefresh:YES];
        [_tableView.header endRefreshing];
    }];
    
    _tableView.header = refreshHeader;
    //       [_mainTableView.header beginRefreshing];
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self sendRequest:++Page iSRefresh:NO];
        [_tableView.footer endRefreshing];
    }];
    _tableView.footer = refreshFooter;
    [self.view addSubview:_tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 211/2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"identifer";
    HomePageAfterLoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if ( cell == nil) {
        cell = [[HomePageAfterLoginTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    }
    cell.viewModel = self.viewModel.dataSource[indexPath.section];
    return cell;
}

- (HomeViewModel *)viewModel {
    if (!_viewModel) {
        self.viewModel = [HomeViewModel new];
    }
    return _viewModel;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
