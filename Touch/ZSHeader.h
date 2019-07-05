//
//  ZSHeader.h
//  JSQ
//
//  Created by 紫贝壳 on 2019/6/18.
//  Copyright © 2019 zibeike. All rights reserved.
//

#ifndef ZSHeader_h
#define ZSHeader_h

#import "ZSTOOL.h"
#import "Masonry.h"
#import "ImgTool.h"

//全局颜色
#define ColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define ColorWithRGB(r,g,b) ColorWithRGBA(r,g,b,1.0f)
#define ColorWithHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
//随机颜色
#define ColorWithRandom [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]


#define WS [UIScreen mainScreen].bounds.size.width
#define HS [UIScreen mainScreen].bounds.size.height

#define WSCREEN (WS>HS?HS:WS)
#define HSCREEN (WS>HS?WS:HS)

#define WeakSelf(type)  __weak typeof(type) weakself = type;


#endif /* ZSHeader_h */
