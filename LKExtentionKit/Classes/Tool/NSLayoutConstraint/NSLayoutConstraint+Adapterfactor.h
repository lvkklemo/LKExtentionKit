//
//  NSLayoutConstraint+Adapterfactor.h
//  XZXWisdomCampus
//
//  Created by huchu on 2017/9/6.
//  Copyright © 2017年 Synjones. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AdapterfactorType) {
    AdapterfactorTypeNone =0,
    AdapterfactorTypeWidth =1,
    AdapterfactorTypeHeight =2,
    
};
IB_DESIGNABLE
@interface NSLayoutConstraint (Adapterfactor)
@property (assign, nonatomic) IBInspectable NSInteger adapterfactorType;
@property (assign, nonatomic) IBInspectable BOOL iPhoneXNavBarHeightAutoSet;


@end
