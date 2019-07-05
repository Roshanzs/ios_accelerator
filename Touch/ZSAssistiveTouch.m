//
//  ZSAssistiveTouch.m
//  FZSDKDemo
//
//  Created by ZS on 16/7/28.
//  Copyright © 2016年 imopan. All rights reserved.
//

#import "ZSAssistiveTouch.h"
#import "ZSHeader.h"
#import <AVFoundation/AVFoundation.h>
#import "ZSMainViewController.h"

@interface ZSAssistiveTouch()

@property(nonatomic,strong)NSString *imgstr;
@property(nonatomic,strong)UILabel *timelab;
@end
@implementation ZSAssistiveTouch{
    UIWindow *window;
}

static ZSAssistiveTouch *assistiveTouch;
+ (ZSAssistiveTouch*) getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assistiveTouch = [[ZSAssistiveTouch alloc] initWithFrame:CGRectMake(0, 150, 50, 50) Img:nil];
        [assistiveTouch initaudio];
    });
//    if (assistiveTouch.hidden) {
//        assistiveTouch.hidden = NO;
//    }
    return assistiveTouch;
}

-(void)initaudio{
    NSError *error;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:&error];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumchange:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

-(void)volumchange:(NSNotification*)notif{
    if (window) {
        NSLog(@"window界面已有,执行隐藏");
        [self hideCenterVc];
    }else{
        ZSAssistiveTouch *touch =  [ZSAssistiveTouch getInstance];
        if (touch.hidden) {
            NSLog(@"self界面无,执行显示");
            [ZSAssistiveTouch showAssistiveTouch];
        }else{
            NSLog(@"self界面已有,执行隐藏");
            [ZSAssistiveTouch hideAssistiveTouch];
        }
    }
}

- (instancetype)initWithFrame:(CGRect)frame Img:(UIImage*)img
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置window
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert -1;
        //添加window拖动事件
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        pan.delaysTouchesBegan = YES;
        [self addGestureRecognizer:pan];
        //添加window点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClick:)];
        [self addGestureRecognizer:tap];
        UIViewController *rootController = [[UIViewController alloc] init];
        self.rootViewController = rootController;
        _imageView = [[UIImageView alloc] initWithImage:[ImgTool stringToImage:[ImgTool share].imgIcon]];
        [ZSTOOL ZScorner:_imageView WithFlote:10];
        _imageView.layer.borderColor = ColorWithRGB(210, 210, 210).CGColor;
        _imageView.layer.borderWidth = 1;
        _imageView.frame = self.bounds;
        [rootController.view addSubview:_imageView];
        [self performSelector:@selector(clickNow) withObject:nil afterDelay:1];
        //显示window
//        [[self keyboardView] addSubview:self];
//        [self makeKeyAndVisible];
        self.hidden = NO;
    }
    return self;
}

-(void)clickNow{
//    if ([ZSShareTool share].is_now_use.intValue == 1 && [[ZSPathMethodTools RsaveStatesWithKey:NOWUSEDOC] intValue] != 1) {
//        [self onClick:nil];
//    }else if ([[ZSPathMethodTools RsaveStatesWithKey:FIRSTLAUNCH] intValue] != 1){
//        [self onClick:nil];
//    }
}

-(void)startTimeDown{
    NSInteger timeNum = 10;
    [_imageView addSubview:self.timelab];
    [self TimeDownWithNum:[NSString stringWithFormat:@"%ld",(long)timeNum]];
}


-(void)TimeDownWithNum:(NSString *)num{
    if (num.intValue <= 0) {
        [_timelab removeFromSuperview];
        [ZSAssistiveTouch hideAssistiveTouch];
        return;
    }
    _timelab.text = num;
    num = [NSString stringWithFormat:@"%d",num.intValue-1];
    [self performSelector:@selector(TimeDownWithNum:) withObject:num afterDelay:1.0];
}


- (UIImage *)stringToImage:(NSString *)str {
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *photo = [UIImage imageWithData:imageData ];
    return photo;
}

// 图片转64base字符串

- (NSString *)imageToString:(UIImage *)image {
    NSData *imagedata = UIImagePNGRepresentation(image);
    NSString *image64 = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return image64;
}


- (void) locationChange:(UIPanGestureRecognizer*)p
{
    CGPoint point = [p translationInView:self];
    if (p.state == UIGestureRecognizerStateBegan) {
//        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeColor) object:nil];
    }else if (p.state == UIGestureRecognizerStateEnded){
    }
    if (p.state == UIGestureRecognizerStateChanged) {
        self.center = CGPointMake(self.center.x + point.x, self.center.y + point.y);
        [p setTranslation:CGPointMake(0, 0) inView:self];
    }else if (p.state == UIGestureRecognizerStateEnded){
        int x = self.center.x;
        int y = self.center.y;
        int width = self.bounds.size.width;
        int height = self.bounds.size.height;
        
        if (y < height) {
            y = height/2;
        }else if(y > HSCREEN - height){
            y = HSCREEN -height/2;
        }else{
            if (x <= WSCREEN/2) {
                x = width/2;
            }else{
                x = WSCREEN-width/2;
            }
        }
        [UIView animateWithDuration:0.2 animations:^{
            self.center = CGPointMake(x, y);
        }];
    }
}

-(void) onClick:(UITapGestureRecognizer*)t
{
//    if ([ZSShareTool share].netStatus <= 0) {
//        [self alterWithStr:@"步骤:\"设置\",\"蜂窝移动网络\",找到本游戏,打开\"WLAN与蜂窝移动网" WithTitle:@"未检测到网络!"];
//    }else{
        [self checknet];
//    }
}

-(void)checknet{
    ZSMainViewController *cenVC = [[ZSMainViewController alloc]init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:cenVC];
    navController.view.backgroundColor = [UIColor clearColor];
    navController.navigationBarHidden = YES;
    navController.modalPresentationStyle = UIModalPresentationCustom;

    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.windowLevel = UIWindowLevelAlert - 2;
    window.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    window.rootViewController = navController;
    window.hidden = NO;
//    [window makeKeyAndVisible];
    [ZSAssistiveTouch hideAssistiveTouch];
    
}


-(void)alterWithStr:(NSString *)str WithTitle:(NSString *)title{
    UIAlertController *alt = [UIAlertController alertControllerWithTitle:title message:str preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"确认" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alt addAction:act];
    [[ZSTOOL lastWindow].rootViewController presentViewController:alt animated:YES completion:^{
    }];
}


-(void)hideCenterVc{
    [window resignKeyWindow];
    window = nil;
}

+ (void)hideAssistiveTouch
{
    ZSAssistiveTouch *touch =  [ZSAssistiveTouch getInstance];
    if (touch) {
        dispatch_async(dispatch_get_main_queue(), ^{
            touch.hidden = YES;
        });
    }
}
+ (void)showAssistiveTouch
{
    ZSAssistiveTouch *touch =  [ZSAssistiveTouch getInstance];
    if (touch) {
        dispatch_async(dispatch_get_main_queue(), ^{
            touch.hidden = NO;
        });
    }
}


-(UILabel *)timelab{
    if (!_timelab) {
        _timelab = [[UILabel alloc]initWithFrame:_imageView.frame];
    }
    return _timelab;
}

-(NSString *)imgstr{
    return @"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\
    /1QEQ6l0FbF1AAAAAElFTkSuQmCC";
}




@end
