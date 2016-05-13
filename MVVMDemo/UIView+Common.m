//
//  UIView+Common.m
//  KillAllFree
//
//  Created by JackRen on 15/9/23.
//  Copyright (c) 2015年 任海涛. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Postion)

//获取屏幕的宽
CGFloat  screenWidth() {
    return [[UIScreen mainScreen] bounds].size.width;
}
//获取屏幕的高
CGFloat screenHeight() {
     return [[UIScreen mainScreen] bounds].size.height;
}
/**
 *  返回当前视图的宽
 *
 *  @return 返回当前视图的宽
 */
- (CGFloat)width {
    return self.frame.size.width;
}


/**
 *  返回当前视图的高
 *
 *  @return 返回当前视图的高
 */
-(CGFloat)height {
    return self.frame.size.height;
}
/**
 *  根据frame返回宽
 *
 *  @param rect 视图的rect
 *
 *  @return 宽
 */
CGFloat width(CGRect rect) {

    return CGRectGetWidth(rect);
}

/**
 *  根据frame返回高
 *
 *  @param rect 视图的rect
 *
 *  @return 高
 */
CGFloat height(CGRect rect) {
    
    return CGRectGetHeight(rect);
}
/**
 *  获取View的（x，y）
 *
 *  @param view 所用的View
 *
 *  @return x,y
 */
CGFloat maxX(UIView *view) {
    return CGRectGetMaxX(view.frame);
}

CGFloat minX(UIView *view) {
    return CGRectGetMinX(view.frame);
}

CGFloat midX(UIView *view) {
    return CGRectGetMidX(view.frame);
}


CGFloat maxY(UIView *view) {
    return CGRectGetMaxY(view.frame);
}

CGFloat minY(UIView *view) {
    return CGRectGetMinY(view.frame);
}

CGFloat midY(UIView *view) {
    return CGRectGetMidY(view.frame);
}


@end

@implementation UIView (Common)

@end
