//
//  ZSMainViewController.m
//  JSQ
//
//  Created by 紫贝壳 on 2019/6/18.
//  Copyright © 2019 zibeike. All rights reserved.
//

#import "ZSMainViewController.h"
#import "ZSHeader.h"
#import "ZSAssistiveTouch.h"

@interface ZSMainViewController ()
@property(nonatomic,strong)UILabel *numLab;
@property(nonatomic,assign)CGFloat changeNum;

@end

@implementation ZSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.changeNum = 1.0;
    [self setupUI];
}


-(void)topBtnClick{
    [[ZSAssistiveTouch getInstance] hideCenterVc];
    [ZSAssistiveTouch showAssistiveTouch];
}


-(void)setupUI{
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(80.0/667.0*HSCREEN);
    }];
    
    UIButton *topBtn = [[UIButton alloc]init];
    [topBtn addTarget:self action:@selector(topBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    topBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:topBtn];
    [topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(bottomView.mas_top);
    }];
    
    
    UIButton *NumBtn = [[UIButton alloc]init];
    [NumBtn setBackgroundImage:[ImgTool stringToImage:[ImgTool share].imgNum] forState:(UIControlStateNormal)];
    [NumBtn addTarget:self action:@selector(numBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:NumBtn];
    [NumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100.0/375.0*WSCREEN);
        make.height.mas_equalTo(37.0/667.0*HSCREEN);
        make.centerX.mas_equalTo(bottomView).offset(-40.0/375.0*WSCREEN);
        make.centerY.mas_equalTo(bottomView);
    }];
    
    self.numLab = [[UILabel alloc]init];
    self.numLab.font = [UIFont systemFontOfSize:16.0/375.0*WSCREEN];
    self.numLab.text = [NSString stringWithFormat:@"%.1f",[ImgTool share].num];
    self.numLab.textColor = [UIColor blackColor];
    [NumBtn addSubview:self.numLab];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(NumBtn);
    }];
    
    UIButton *addBtn = [[UIButton alloc]init];
    [addBtn setBackgroundImage:[ImgTool stringToImage:[ImgTool share].imgAdd] forState:(UIControlStateNormal)];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40.0/375.0*WSCREEN);
        make.height.mas_equalTo(40.0/667.0*HSCREEN);
        make.left.mas_equalTo(NumBtn.mas_right).offset(20.0/375.0*WSCREEN);
        make.centerY.mas_equalTo(bottomView);
    }];
    
    UIButton *downBtn = [[UIButton alloc]init];
    [downBtn setBackgroundImage:[ImgTool stringToImage:[ImgTool share].imgDown] forState:(UIControlStateNormal)];
    [downBtn addTarget:self action:@selector(downBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:downBtn];
    [downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(addBtn);
        make.right.mas_equalTo(NumBtn.mas_left).offset(-20.0/375.0*WSCREEN);
        make.centerY.mas_equalTo(bottomView);
    }];
    
    UIButton *goBtn = [[UIButton alloc]init];
    [goBtn setBackgroundImage:[ImgTool stringToImage:[ImgTool share].imgGo] forState:(UIControlStateNormal)];
    [goBtn addTarget:self action:@selector(goBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:goBtn];
    [goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(37.0/667.0*HSCREEN);
        make.width.mas_equalTo(70.0/375.0*WSCREEN);
        make.left.mas_equalTo(addBtn.mas_right).offset(20.0/375.0*WSCREEN);
        make.centerY.mas_equalTo(bottomView);
    }];
    
}

//加
-(void)addBtnClick{
    NSLog(@"点击加");
    
    if (self.changeNum == 1.0) {
        if ([ImgTool share].num >= 0 && [ImgTool share].num < 5.0) {
            [ImgTool share].num = [ImgTool share].num + self.changeNum;
        }else if ([ImgTool share].num >= 5.0 && [ImgTool share].num < 20.0){
            [ImgTool share].num = [ImgTool share].num + 5.0;
        }else if ([ImgTool share].num >= 20.0 && [ImgTool share].num < 30.0){
            [ImgTool share].num = [ImgTool share].num + 10.0;
        }else if ([ImgTool share].num >= 30.0 && [ImgTool share].num < 50.0){
            [ImgTool share].num = [ImgTool share].num + 20.0;
        }else if ([ImgTool share].num >= 50.0 && [ImgTool share].num <= 100.0){
            [ImgTool share].num = [ImgTool share].num + 50.0;
        }else if ([ImgTool share].num >= -5.0 && [ImgTool share].num <= 0.0) {
            [ImgTool share].num = [ImgTool share].num + self.changeNum;
        }else if ([ImgTool share].num >= -20.0 && [ImgTool share].num < -5.0){
            [ImgTool share].num = [ImgTool share].num + 5.0;
        }else if ([ImgTool share].num >= -30.0 && [ImgTool share].num < -20.0){
            [ImgTool share].num = [ImgTool share].num + 10.0;
        }else if ([ImgTool share].num >= -50.0 && [ImgTool share].num < -30.0){
            [ImgTool share].num = [ImgTool share].num + 20.0;
        }else if ([ImgTool share].num >= -100.0 && [ImgTool share].num < -50.0){
            [ImgTool share].num = [ImgTool share].num + 50.0;
        }
    }else{
        [ImgTool share].num = [ImgTool share].num + self.changeNum;
    }
    
    if ([ImgTool share].num > 100.0) {
        [ImgTool share].num = 100.0;
    }
    
    self.numLab.text = [NSString stringWithFormat:@"%.1f",[ImgTool share].num];
}

//减
-(void)downBtnClick{
    NSLog(@"点击减");
    
    if (self.changeNum == 1.0) {
        if ([ImgTool share].num >= 0 && [ImgTool share].num <= 5.0) {
            [ImgTool share].num = [ImgTool share].num - self.changeNum;
        }else if ([ImgTool share].num > 5.0 && [ImgTool share].num <= 20.0){
            [ImgTool share].num = [ImgTool share].num - 5.0;
        }else if ([ImgTool share].num > 20.0 && [ImgTool share].num <= 30.0){
            [ImgTool share].num = [ImgTool share].num - 10.0;
        }else if ([ImgTool share].num > 30.0 && [ImgTool share].num <= 50.0){
            [ImgTool share].num = [ImgTool share].num - 20.0;
        }else if ([ImgTool share].num > 50.0 && [ImgTool share].num <= 100.0){
            [ImgTool share].num = [ImgTool share].num - 50.0;
        }else if ([ImgTool share].num > -5.0 && [ImgTool share].num <= 0.0) {
            [ImgTool share].num = [ImgTool share].num - self.changeNum;
        }else if ([ImgTool share].num > -20.0 && [ImgTool share].num <= -5.0){
            [ImgTool share].num = [ImgTool share].num - 5.0;
        }else if ([ImgTool share].num > -30.0 && [ImgTool share].num <= -20.0){
            [ImgTool share].num = [ImgTool share].num - 10.0;
        }else if ([ImgTool share].num > -50.0 && [ImgTool share].num <= -30.0){
            [ImgTool share].num = [ImgTool share].num - 20.0;
        }else if ([ImgTool share].num >= -100.0 && [ImgTool share].num <= -50.0){
            [ImgTool share].num = [ImgTool share].num - 50.0;
        }
    }else{
        [ImgTool share].num = [ImgTool share].num - self.changeNum;
    }
    
    if ([ImgTool share].num <= -100.0) {
        [ImgTool share].num = -100.0;
    }
    
    self.numLab.text = [NSString stringWithFormat:@"%.1f",[ImgTool share].num];
}

//整数小数切换
-(void)numBtnClick{
    NSLog(@"点击切换");
    if (self.changeNum == 0.1) {
        self.changeNum = 1.0;
    }else{
        self.changeNum = 0.1;
    }
}

//播放
-(void)goBtnClick{
    NSLog(@"点击播放");
    if ([ImgTool share].num >= 0) {
        [ImgTool share].multiple = [ImgTool share].num+1.0;
    }else{
        [ImgTool share].multiple = -(1.0/([ImgTool share].num-1.0));
    }
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
