//
//  NSString+stringPattern.h
//  正则表达式
//
//  Created by  周保勇 on 15/8/22.
//  Copyright (c) 2015年  周保勇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (stringPattern)
- (BOOL)isPayNumber;
- (BOOL)isPhoneNumber;
- (BOOL)isQQ;
- (BOOL)isEmail;
- (BOOL)isIpAddress;
///是否包含大写字符
- (BOOL)isContainsUpperCase;
///包含小写字符
- (BOOL)isContainsLowerCase;
///包含数字
- (BOOL)isContainsNumber;
/// 纯数字
- (BOOL)mh_isPureDigitCharacters;

+(CGSize)sizeOfFontWithString:(NSString *)string maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight fontSize:(CGFloat)fontSize;
/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing text:(NSString *)str;

@end
