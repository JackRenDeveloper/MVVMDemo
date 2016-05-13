//
//  UIColor.h
//  MVVMDemo
//
//  Created by JackRen on 16/4/5.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#ifndef UIColor_h
#define UIColor_h

// RGB颜色
#define LHColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define BACKGROUND [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]

#define LINECOLOR [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0]

#define KScDefineHeight [[UIScreen mainScreen] bounds].size.height/667

#define TEXTCOLOR  [UIColor colorWithRed:108 / 255.0 green:108 / 255.0 blue:108 / 255.0 alpha:1.0]


#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

#define KScDefineWidth [[UIScreen mainScreen] bounds].size.width/375

#define kMyWidth               [UIScreen mainScreen].bounds.size.width / 375
#define kMyHeight              kMyWidth

#define    kMargin_cornerRadius 4 * kMyWidth

#endif /* UIColor_h */
