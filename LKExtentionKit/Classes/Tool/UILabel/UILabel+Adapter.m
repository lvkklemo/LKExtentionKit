//
//  UILabel+Adapter.m
//  XZXSchool
//
//  Created by obally on 2018/1/24.
//  Copyright © 2018年 obally. All rights reserved.
//

#import "UILabel+Adapter.h"
#import <objc/runtime.h>
@implementation UILabel (Adapter)
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        SEL originalSelector = @selector(initWithCoder:);
//        SEL swizzledSelector = @selector(adapterInitWithCoder:);
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        BOOL didAddMethod = class_addMethod(class,
//                                            originalSelector,
//                                            method_getImplementation(swizzledMethod),
//                                            method_getTypeEncoding(swizzledMethod));
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                                swizzledSelector,
//                                method_getImplementation(originalMethod),
//                                method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
//
//}
//- (instancetype)adapterInitWithCoder:(NSCoder *)aDecoder {
//    [self adapterInitWithCoder:aDecoder];
//    if (self) {
//        if (OB_SCREEN_WIDTH == 414) {
//            //6P 7P 8P
//             self.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize + 1];
//        }
//    }
//    return self;
//}
//-(void)awakeFromNib
//{
//    [super awakeFromNib];
//    if (OB_SCREEN_WIDTH == 414) {
//        //6P 7P 8P
//        self.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize + 1];
//    }
//}
@end
