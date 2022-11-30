//
//  UIImage+CustomImage.m
//  student
//
//  Created by wjw on 2017/1/12.
//  Copyright © 2017年 科技集团. All rights reserved.
//

#import "UIImage+CustomImage.h"

@implementation UIImage (CustomImage)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}


/**
 *  修改图片size
 *
 *  @param image      原图片
 *  @param targetSize 要修改的size
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage *)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
    
+ (UIImage *)resetSizeOfImageDataWithImage:(UIImage *)image MaxSize:(NSUInteger)maxSize {
    
    CGSize newSize = CGSizeMake(image.size.width, image.size.height);
    
    CGFloat tempH = newSize.height / 1024.f;
    CGFloat tempW = newSize.width / 1024.f;
    
    if (tempW > 1.f && tempW > tempH) {
        newSize = CGSizeMake(image.size.width / tempW, image.size.height / tempW);
    } else if (tempH > 1.f && tempW < tempH) {
        newSize = CGSizeMake(image.size.height / tempH, image.size.height / tempH);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(newImage, 1.0);
    NSUInteger sizeOriginKB = [imageData length] / 1024;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = sizeOriginKB;
    
    while (sizeOriginKB > lastData && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        imageData = UIImageJPEGRepresentation(newImage, maxQuality);
        sizeOriginKB = [imageData length] / 1024;
        if (lastData == sizeOriginKB) {
            break;
        } else {
            lastData = sizeOriginKB;
        }
    }
    return [UIImage imageWithData:imageData];
}

- (UIImage *)imageWithCornerRadius:(CGFloat)radius {
    
    CGRect rect = (CGRect){0.f, 0.f, CGSizeMake(90, 90)};
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(90, 90), NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
//根据颜色生成渐变图片
+(UIImage *)getGradientImageWithColors:(NSArray*)colors imgSize:(CGSize)imgSize
{
	NSMutableArray *arRef = [NSMutableArray array];
	for(UIColor *ref in colors) {
		[arRef addObject:(id)ref.CGColor];
		
	}
	UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)arRef, NULL);
	CGPoint start = CGPointMake(0.0, 0.0);
	CGPoint end = CGPointMake(imgSize.width, imgSize.height);
	CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
//	CGContextDrawRadialGradient(context, gradient, start, 3, end, 3, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	CGGradientRelease(gradient);
	CGContextRestoreGState(context);
	CGColorSpaceRelease(colorSpace);
	UIGraphicsEndImageContext();
	return image;
}
@end
