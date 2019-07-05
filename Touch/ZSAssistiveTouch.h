//
//  ZSAssistiveTouch.h
//  FZSDKDemo
//
//  Created by ZS on 16/7/28.
//  Copyright © 2016年 imopan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSAssistiveTouch : UIWindow
@property(nonatomic,strong)UIImageView *imageView;
+ (ZSAssistiveTouch*) getInstance;
+ (void)hideAssistiveTouch;
+ (void)showAssistiveTouch;

-(void)hideCenterVc;

//-(void)startTimeDown;

@end
