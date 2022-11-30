//
//  CALayer+OBLayerColor.m
//  XZXSchool
//
//  Created by obally on 2017/10/24.
//  Copyright © 2017年 obally. All rights reserved.
//

#import "CALayer+OBLayerColor.h"

@implementation CALayer (OBLayerColor)
- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
 }
@end
