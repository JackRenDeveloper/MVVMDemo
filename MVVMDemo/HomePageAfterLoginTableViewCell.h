//
//  HomePageAfterLoginTableViewCell.h
//  ZHBWorker
//
//  Created by JackRen on 16/2/1.
//  Copyright © 2016年 atense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellViewModel.h"

@interface HomePageAfterLoginTableViewCell : UITableViewCell


@property (nonatomic, strong) CellViewModel *viewModel;

@property (nonatomic,copy) NSString *defineRead;

@property (nonatomic, strong) UIView *backView;

@end
