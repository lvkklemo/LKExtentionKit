//
//  UIImage+CustomImage.h
//  student
//
//  Created by wjw on 2017/1/12.
//  Copyright © 2017年 科技集团. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CustomImage)

// 根据颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color;

// 重新绘制图片
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize;

// 图片等比压缩
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 *  修改图片size
 *
 *  @param image      原图片
 *  @param targetSize 要修改的size
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage *)image byScalingToSize:(CGSize)targetSize;

+ (UIImage *)resetSizeOfImageDataWithImage:(UIImage *)image MaxSize:(NSUInteger)maxSize;
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;

//根据颜色生成渐变图片
+(UIImage *)getGradientImageWithColors:(NSArray*)colors imgSize:(CGSize)imgSize;
@end
