//
//  NSLayoutConstraint+Adapterfactor.m
//  XZXWisdomCampus
//
//  Created by huchu on 2017/9/6.
//  Copyright © 2017年 Synjones. All rights reserved.
//

#import "NSLayoutConstraint+Adapterfactor.h"
#import <objc/runtime.h>
NS_INLINE double scalew(){
    static dispatch_once_t onceToken;
    static double scalew;
    dispatch_once(&onceToken, ^{
        scalew =[UIScreen mainScreen].bounds.size.width/375.f;
    });
    return scalew;
}
NS_INLINE double scaleh(){
    static dispatch_once_t onceToken;
    static double scaleh;
    dispatch_once(&onceToken, ^{
        scaleh=  1.f;
    });
    return scaleh;
}
@implementation NSLayoutConstraint (Adapterfactor)
-(NSInteger)adapterfactorType{
    NSNumber*a= objc_getAssociatedObject(self, @selector(adapterfactorType));
    if (a) {
        return a.integerValue;
    }
    return AdapterfactorTypeNone;
}
-(BOOL)iPhoneXNavBarHeightAutoSet{
    NSNumber*a= objc_getAssociatedObject(self, @selector(iPhoneXNavBarHeightAutoSet));
    if (a) {
        return a.integerValue;
    }
    return NO;
}

-(void)setAdapterfactorType:(NSInteger)adapterfactorType{
    switch (adapterfactorType) {
        case AdapterfactorTypeNone:
            break;
        case AdapterfactorTypeWidth:
            self.constant *= scalew();
            break;
        case AdapterfactorTypeHeight:
            self.constant *= scaleh();
            break;
        default:
            break;
    }
    objc_setAssociatedObject(self, @selector(adapterfactorType), @(adapterfactorType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setIPhoneXNavBarHeightAutoSet:(BOOL)iPhoneXNavBarHeightAutoSet{
    if (iPhoneXNavBarHeightAutoSet) {
        self.constant=self.constant+88;
    }
    objc_setAssociatedObject(self, @selector(iPhoneXNavBarHeightAutoSet), @(iPhoneXNavBarHeightAutoSet), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

@end
