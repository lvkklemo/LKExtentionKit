//
//  UIColor+Add.h
//  BBS
//
//  Created by yanzhang on 2019/11/26.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Add)


+(UIColor *)colorWithNormal:(int)hex black:(int)hex2;


+(UIColor *)colorWithNormal:(int)hex alpha1:(CGFloat)a black:(int)hex2 alpha2:(CGFloat)a2;



@end

NS_ASSUME_NONNULL_END
