//
//  UIColor+Add.m
//  BBS
//
//  Created by yanzhang on 2019/11/26.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "UIColor+Add.h"


@implementation UIColor (Add)

+(UIColor *)colorWithNormal:(int)hex black:(int)hex2{
    if (@available(iOS 13, *)) {
          UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
               if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                       
				   return     [UIColor colorWithRed:((float)((hex2 & 0xFF0000) >> 16))/255.0
                           green:((float)((hex2 & 0xFF00) >> 8))/255.0
                                                   blue:((float)(hex2 & 0xFF))/255.0 alpha:1];
                   }
                   else {
                       
					   return     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                           blue:((float)(hex & 0xFF))/255.0 alpha:1];
                   }
               }];
          return color;
         }else {
            return     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                green:((float)((hex & 0xFF00) >> 8))/255.0
    blue:((float)(hex & 0xFF))/255.0 alpha:1];
             
         }
        
}


+(UIColor *)colorWithNormal:(int)hex alpha1:(CGFloat)a black:(int)hex2 alpha2:(CGFloat)a2{
    if (@available(iOS 13, *)) {
          UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
               if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                       return     [UIColor colorWithRed:((float)((hex2 & 0xFF0000) >> 16))/255.0
                           green:((float)((hex2 & 0xFF00) >> 8))/255.0
                                                   blue:((float)(hex2 & 0xFF))/255.0 alpha:a2];
                   }
                   else {
                       return     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                           blue:((float)(hex & 0xFF))/255.0 alpha:a];
                   }
               }];
          return color;
         }else {
            return     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                green:((float)((hex & 0xFF00) >> 8))/255.0
    blue:((float)(hex & 0xFF))/255.0 alpha:a];
             
         }
        
        
}


@end
