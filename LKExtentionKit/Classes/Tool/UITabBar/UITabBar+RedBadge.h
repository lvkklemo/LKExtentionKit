//
//  UITabBar+RedBadge.h
//  student
//
//  Created by jiawei wang on 2017/2/12.
//  Copyright © 2017年 科技集团. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (RedBadge)

- (void)showBadgeOnItemIndex:(NSInteger)index;

- (void)hideBadgeOnItemIndex:(NSInteger)index;

- (void)removeBadgeOnItemIndex:(NSInteger)index;

@end
