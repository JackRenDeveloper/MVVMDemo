//
//  UIView+Common.h
//  KillAllFree
//
//  Created by JackRen on 15/9/23.
//  Copyright (c) 2015年 任海涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView  (Postion)

CGFloat  screenWidth();
CGFloat screenHeight();

- (CGFloat)width;
-(CGFloat)height;

CGFloat width(CGRect rect);
CGFloat height(CGRect rect);

CGFloat maxX(UIView *view);
CGFloat minX(UIView *view);
CGFloat midX(UIView *view);
CGFloat maxY(UIView *view);
CGFloat minY(UIView *view);
CGFloat midY(UIView *view);

@end

@interface UIView (Common)



@end
