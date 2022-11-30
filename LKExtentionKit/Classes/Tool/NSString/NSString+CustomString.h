//
//  NSString+CustomString.h
//  studyAbroad
//
//  Created by Darren on 2017/10/17.
//  Copyright © 2017年 环天下教育科技集团. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CustomString)

- (NSString *)getPinyin;
- (NSString *)sexStr;
- (NSString*)appVersion;
- (NSString *)getpsdMobileNumber:(NSString*)mobile;
- (NSString*)removeSpaceAndNewline:(NSString*)str;
@end
