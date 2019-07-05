//
//  ImgTool.h
//  JSQ
//
//  Created by 紫贝壳 on 2019/6/18.
//  Copyright © 2019 zibeike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImgTool : NSObject

+(instancetype)share;

@property(nonatomic,strong)NSString *imgIcon; //图标
@property(nonatomic,strong)NSString *imgAdd; //加
@property(nonatomic,strong)NSString *imgDown; //减
@property(nonatomic,strong)NSString *imgNum; //数值
@property(nonatomic,strong)NSString *imgGo; //执行

@property(nonatomic,assign)CGFloat num;

@property(nonatomic,assign)float multiple;


+(UIImage *)stringToImage:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
