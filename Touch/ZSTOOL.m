//
//  ZSTOOL.m
//  JSQ
//
//  Created by 紫贝壳 on 2019/6/18.
//  Copyright © 2019 zibeike. All rights reserved.
//

#import "ZSTOOL.h"

@implementation ZSTOOL

//切割圆角
+(UIView *)ZScorner:(UIView *)obj WithFlote:(CGFloat)Radius{
    obj.layer.cornerRadius = Radius;
    obj.layer.masksToBounds = YES;
    return nil;
}

+ (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds) && window.hidden == NO)
            return window;
    }
    return [UIApplication sharedApplication].keyWindow;
}

@end
