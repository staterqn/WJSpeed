//
//  ViewController.m
//  WJSpeed
//
//  Created by chuanshuangzhang chuan shuang on 15/4/16.
//  Copyright (c) 2015年 iWangding. All rights reserved.
//

#import "ViewController.h"
#import "WJSPeedView.h"

@interface ViewController ()<WJSpeedAnimationViewDelegate>
{
    CGFloat count;
    WJSPeedView *wjSpeedView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   wjSpeedView = [[WJSPeedView alloc]initWithDelegate:self animationStep:6];
    [wjSpeedView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:wjSpeedView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.67 constant:0]];
    
    [wjSpeedView setAnimationDesStr:@"剩余提速时间" second:@"23小时"];
    count = 0;
    [self.view layoutIfNeeded];
   
    
    // Do any additional setup after loading the view.
}
-(void)updateAnimation:(NSTimer *)timer
{

    count ++;
    if(count > 6)
    {
        [timer invalidate];
    }else {
        [wjSpeedView speedAnimationWithStep:count value:10 units:@""];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)WJSpeedAnimationWillStart
{
    [wjSpeedView startSpeedAnimation];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateAnimation:) userInfo:nil repeats:YES];
}
@end
