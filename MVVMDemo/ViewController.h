//
//  ViewController.h
//  MVVMDemo
//
//  Created by JackRen on 16/4/5.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewModel.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) HomeViewModel *viewModel;

@end

