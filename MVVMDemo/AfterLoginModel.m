//
//  AfterLoginModel.m
//  ZHBWorker
//
//  Created by JackRen on 16/1/13.
//  Copyright © 2016年 atense. All rights reserved.
//

#import "AfterLoginModel.h"

@implementation AfterLoginModel

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        //        kvc赋值
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (id)WorkerModelWithDictionary:(NSDictionary *)dic {
    return [[AfterLoginModel alloc] initWithDictionary:dic];
}
//重写系统方法，筛选变量名不一样的值
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.modelID = value;
    }
}

@end
