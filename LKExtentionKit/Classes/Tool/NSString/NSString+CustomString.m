//
//  NSString+CustomString.m
//  studyAbroad
//
//  Created by Darren on 2017/10/17.
//  Copyright © 2017年 环天下教育科技集团. All rights reserved.
//

#import "NSString+CustomString.h"

@implementation NSString (CustomString)

- (NSString *)getPinyin{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:self];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    
    return pinYin;
}
-(NSString *)sexStr
{
    NSString *sexLabel = @"";
    if ([self isEqualToString:@"1"]) {
        sexLabel = @"男";
    } else if ([self isEqualToString:@"2"]) {
        sexLabel = @"女";
    } else
        sexLabel = @"未知";
    return sexLabel;
}

- (NSString*)appVersion{
    NSDictionary*versionDict = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [versionDict objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}
- (NSString *)getpsdMobileNumber:(NSString*)mobile{
    NSString *psdNumber = @"";
    if (mobile.length>10) {
        psdNumber = [mobile stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"********"];
    }else{
        psdNumber = mobile;
    }
    return psdNumber;
}

- (NSString*)removeSpaceAndNewline:(NSString*)str {
    
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}
@end
