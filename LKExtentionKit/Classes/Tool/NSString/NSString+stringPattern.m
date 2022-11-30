//
//  NSString+stringPattern.m
//  正则表达式
//
//  Created by  周保勇 on 15/8/22.
//  Copyright (c) 2015年  周保勇. All rights reserved.
//

#import "NSString+stringPattern.h"

@implementation NSString (stringPattern)
-(BOOL)matchesInString:(NSString *)pattern
{
    NSRegularExpression * regularExpression = [[NSRegularExpression alloc]initWithPattern:pattern options:0 error:nil];
    NSArray * resultArray = [regularExpression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return (resultArray.count > 0);
}
- (BOOL)isQQ
{
    /**QQ号码规则：
     1.开头数字不为0
     2.5-11的数字
     */
    
    
    //1.创建规则对象：NSRegularExpression
    //创建字符串规则：pattern
//    NSString * pattern = @"[]";
//    NSRegularExpression * regularExpression = [[NSRegularExpression alloc]initWithPattern:pattern options:0 error:nil];
//    NSArray * resultArray = [regularExpression matchesInString:pattern options:0 range:NSMakeRange(0, self.length)];
//    return (resultArray.count == 1);
    NSString * pattern = @"^[1-9]\\d{4,10}$";
    return [self matchesInString:pattern];
    //注意JavaScrip的正则表达式前后都有\，使用时将前后\去掉就行了
}
- (BOOL)isPhoneNumber
{
    
    /**手机号码规则：
     1.开头数字为13、15、18、17
     2.11位的数字
     */
    //return [self matchesInString:@"^1[3578]\\d{9}$"];
    return [self matchesInString:@"^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9]|(19[0-9])))\\d{8}$"];
}
- (BOOL)isIpAddress
{
    return [self matchesInString:@"\\d+\\.\\d+\\.\\d+\\.\\d+"];
}
- (BOOL)isPayNumber
{
    NSString * pattern = @"^[1-9]\\d+(\\.\\d{2})?$|^0\\.\\d{2}$";
    return [self matchesInString:pattern];
}
- (BOOL)isEmail
{
    NSString *pattern = @"^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$";;
//    @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//    @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//    "^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$";
    return [self matchesInString:pattern];
}
///是否包含大写字符
- (BOOL)isContainsUpperCase
{
    NSString *pattern = @"[A-Z]+";
    return [self matchesInString:pattern];
}
///包含小写字符
- (BOOL)isContainsLowerCase
{
    NSString *pattern = @"[a-z]+";
    return [self matchesInString:pattern];
}
///包含数字
- (BOOL)isContainsNumber
{
    NSString *pattern = @"[0-9]+";
    return [self matchesInString:pattern];
}
/// 纯数字
- (BOOL)mh_isPureDigitCharacters
{
    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    
    if(str.length > 0) return NO;
    
    return YES;
}
+(CGSize)sizeOfFontWithString:(NSString *)string maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight fontSize:(CGFloat)fontSize{
	NSDictionary *dic =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
	
	CGRect rect = [string boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
	return  rect.size;
}
/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing text:(NSString *)str
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, str.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, str.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:size options:options context:nil];
    
    //    NSLog(@"size:%@", NSStringFromCGSize(rect.size));
    
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([self containChinese:str]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-paragraphStyle.lineSpacing);
        }
    }
    return rect.size;
}

//判断如果包含中文
- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){ int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}
@end
