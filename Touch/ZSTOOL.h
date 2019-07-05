//
//  ZSTOOL.h
//  JSQ
//
//  Created by 紫贝壳 on 2019/6/18.
//  Copyright © 2019 zibeike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ZSTOOL : NSObject


//切割圆角
+(UIView *)ZScorner:(UIView *)obj WithFlote:(CGFloat)Radius;

+ (UIWindow *)lastWindow;


@end

NS_ASSUME_NONNULL_END
