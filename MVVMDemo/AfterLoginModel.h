//
//  AfterLoginModel.h
//  ZHBWorker
//
//  Created by JackRen on 16/1/13.
//  Copyright © 2016年 atense. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AfterLoginModel : NSObject

@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *browse_count;
@property (nonatomic, copy) NSString *budget_account;
@property (nonatomic, copy) NSString *day_end_time;
@property (nonatomic, copy) NSString *modelID;
@property (nonatomic, copy) NSString *is_read;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *like;
@property (nonatomic, copy) NSString *star;
@property (nonatomic, copy) NSString *auth;
@property (nonatomic, copy) NSString *parent_job_id;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *day_start_time;
@property (nonatomic, copy) NSString *job_start_time;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *project_name;
@property (nonatomic, copy) NSString *project_start_time;
@property (nonatomic, copy) NSString *settlement_way;
@property (nonatomic, copy) NSString *special_require;
@property (nonatomic, copy) NSString *time_length;

@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *index;
@property (nonatomic, copy) NSString *extra;

- (id)initWithDictionary:(NSDictionary *)dic;
+ (id)WorkerModelWithDictionary:(NSDictionary *)dic;

@end
