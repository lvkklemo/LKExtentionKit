//
//  UITabBar+RedBadge.m
//  student
//
//  Created by jiawei wang on 2017/2/12.
//  Copyright © 2017年 科技集团. All rights reserved.
//

#import "UITabBar+RedBadge.h"
#import "UIColor+RCColor.h"

@implementation UITabBar (RedBadge)

- (void)showBadgeOnItemIndex:(NSInteger)index{
    
    [self removeBadgeOnItemIndex:index];
    
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.backgroundColor = [UIColor colorWithHexString:@"FF5000" alpha:1];
    CGRect tabFrame = self.frame;
    
    float percentX = (index +0.6) / 3;
    CGFloat x = ceilf(percentX * tabFrame.size.width - 3);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 7, 7);
    badgeView.layer.cornerRadius = badgeView.frame.size.width/2;
    
    [self addSubview:badgeView];
    
}

- (void)hideBadgeOnItemIndex:(NSInteger)index{
    
    [self removeBadgeOnItemIndex:index];
    
}

- (void)removeBadgeOnItemIndex:(NSInteger)index{
    
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
    
}

@end
