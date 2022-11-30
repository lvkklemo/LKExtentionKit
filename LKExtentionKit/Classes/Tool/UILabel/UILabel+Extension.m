//
//  UILabel+Extension.m
//  teacher
//
//  Created by Darren on 2017/4/5.
//  Copyright © 2017年 科技集团. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (void)widthToFit
{
    self.numberOfLines = 0;
    
    CGRect textRect = [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    
    CGRect labelRect = self.frame;
    
    labelRect.size.width = textRect.size.width;
    
    [self setFrame:labelRect];
}

- (CGFloat)widthThatWouldFit
{
    self.numberOfLines = 0;
    
    CGRect textRect = [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    
    return textRect.size.width;
}


@end
