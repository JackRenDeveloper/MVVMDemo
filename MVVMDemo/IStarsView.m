//
//  IStarsView.m
//  KillAllFree
//
//  Created by JackWong on 15/9/23.
//  Copyright (c) 2015年 JackWong. All rights reserved.
//

#import "IStarsView.h"
#import "UIImage+Scale.h"

@implementation IStarsView {
    
    UIImageView *_foregroundView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customeViews];
    }
    return self;
}

- (void)customeViews {
    
    UIImageView *backGroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 115*KScDefineWidth/2, 22*KScDefineWidth/2)];
    backGroundView.image = [[UIImage imageNamed:@"iconfont-lliconstar-grayImage"] scaleToSize:CGSizeMake(115*KScDefineWidth/2, 22*KScDefineWidth/2)];
    [self addSubview:backGroundView];
    
    _foregroundView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    
    _foregroundView.contentMode = UIViewContentModeLeft;
    
    
    _foregroundView.image = [[UIImage imageNamed:@"iconfont-lliconstargoldImage"] scaleToSize:CGSizeMake(115*KScDefineWidth/2, 22*KScDefineWidth/2)];
    _foregroundView.clipsToBounds = YES;
    [self addSubview:_foregroundView];
    
}

- (void)setLevel:(double)level {
    _foregroundView.frame = CGRectMake(0, 0, (115*KScDefineWidth/2)*(level/5.0), 22*KScDefineWidth/2);
}

@end
