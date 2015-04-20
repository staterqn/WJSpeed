//
//  WJSpeedAnimationView.m
//  WJSpeed
//
//  Created by chuanshuangzhang chuan shuang on 15/4/16.
//  Copyright (c) 2015年 iWangding. All rights reserved.
//

#import "WJSpeedAnimationView.h"

@implementation WJSpeedAnimationView
{
    NSTimer *timer;
}
-(id)init
{
   if(self = [super init])
   {
       [self loadSpeedAniamtionLineView];
       [self loadSpeedAnimationMoveView];
       [self loadSpeedAnimationTouchBtn];
       [self loadSpeedAnimationDotView];
   }
    return self;
}
// 加载动画外部的圆线图片
-(void)loadSpeedAniamtionLineView
{
    self.speedAniamtionLineView = [[UIImageView alloc]init];
    self.speedAniamtionLineView.image = [UIImage imageNamed:@""];
    self.speedAniamtionLineView.backgroundColor = [UIColor yellowColor];
    [self.speedAniamtionLineView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.speedAniamtionLineView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAniamtionLineView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAniamtionLineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAniamtionLineView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAniamtionLineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
}
//加载动画圆线图片
-(void)loadSpeedAnimationMoveView
{
    self.speedAnimationMoveView = [[UIImageView alloc]init];
    self.speedAnimationMoveView.backgroundColor = [UIColor redColor];
    self.speedAnimationMoveView.alpha = 0.0;
    self.speedAnimationMoveView.image = [UIImage imageNamed:@""];
    [self.speedAnimationMoveView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.speedAnimationMoveView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationMoveView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationMoveView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationMoveView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationMoveView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
}
//加载中间点击按钮
-(void)loadSpeedAnimationTouchBtn
{
    self.speedAnimationTouchBtn = [[UIButton alloc]init];
    self.speedAnimationTouchBtn.backgroundColor = [UIColor blueColor];
    [self.speedAnimationTouchBtn addTarget:self action:@selector(animationTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.speedAnimationTouchBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.speedAnimationTouchBtn];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.73 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.73 constant:0]];
}
//加载动画运动原点
-(void)loadSpeedAnimationDotView
{
    self.speedAnimationDotView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [self.speedAnimationDotView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.speedAnimationDotView.alpha = 0.0;
    self.speedAnimationDotView.layer.cornerRadius = 5;
    self.speedAnimationDotView.backgroundColor = [UIColor whiteColor];
    [self.speedAnimationTouchBtn addSubview:self.speedAnimationDotView];
    [self.speedAnimationTouchBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationDotView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.speedAnimationTouchBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationDotView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeWidth multiplier:0.0 constant:10]];
    [self.speedAnimationTouchBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationDotView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self.speedAnimationTouchBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.speedAnimationDotView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.speedAnimationTouchBtn attribute:NSLayoutAttributeHeight multiplier:0.0 constant:10]];
}
//点击动画触发按钮事件
-(IBAction)animationTouched:(UIButton *)sender
{
    if(sender.selected)
    {
        [sender setSelected:NO];
    }else
    {
        [sender setSelected:YES];
        if(self.delegate && [self.delegate respondsToSelector:@selector(WJSpeedAnimationWillStart)])
        {
            [self.delegate WJSpeedAnimationWillStart];
        }
    }
}
//改变动画按钮的图片，正常显示图片和选择之后显示的图片
-(void)setAnimationTouchSource:(NSString *)normalStr select:(NSString *)selectStr
{
    [self.speedAnimationTouchBtn setImage:[UIImage imageNamed:normalStr] forState:UIControlStateNormal];
    [self.speedAnimationTouchBtn setImage:[UIImage imageNamed:selectStr] forState:UIControlStateSelected];
}
//开始动画
-(void)startAnimation
{
    self.speedAnimationMoveView.alpha = 1.0;
    self.speedAnimationTouchBtn.layer.cornerRadius = self.speedAnimationTouchBtn.frame.size.width/2,0;
    [self.animationShapeLayer removeFromSuperlayer];
    self.animationShapeLayer = nil;
    UIBezierPath* path = [UIBezierPath bezierPath];
    CGFloat radious = self.bounds.size.width/2.0;
    [path moveToPoint:CGPointMake(radious,radious)];
    [path addArcWithCenter:CGPointMake(radious, radious) radius:radious startAngle:M_PI_2+M_PI/6.0 endAngle:M_PI_2+M_PI/6.0 clockwise:YES];
    self.animationShapeLayer = [CAShapeLayer layer];
    self.animationShapeLayer.path = path.CGPath;
    self.speedAnimationMoveView.layer.mask = self.animationShapeLayer;
    
    self.speedAnimationDotView.alpha = 1.0;
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    radious = self.speedAnimationTouchBtn.frame.size.width/2.0;
    [movePath addArcWithCenter:CGPointMake(radious, radious) radius:radious startAngle:-M_PI_2 endAngle:2*M_PI-M_PI_2 clockwise:YES];
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.duration = 2;
    moveAnim.repeatCount = MAXFLOAT;
    moveAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    moveAnim.removedOnCompletion = YES;
    [self.speedAnimationDotView.layer addAnimation:moveAnim forKey:@"animation"];
}
//更新动画的进度
-(void)updateAnimationWithValue:(NSInteger)step
{
    CGFloat totalAngle = 2*M_PI - M_PI/3.0;
    CGFloat angle = totalAngle/self.animationSteps;
//    UIBezierPath* path = [UIBezierPath bezierPath];
    CGFloat radious = self.bounds.size.width/2.0;
//    [path moveToPoint:CGPointMake(radious,radious)];
//    [self.animationShapeLayer.path addArcWithCenter:CGPointMake(radious, radious) radius:radious startAngle:M_PI_2+M_PI/6.0 endAngle:M_PI_2+M_PI/6.0 + step*angle clockwise:YES];
  
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    bas.duration=1;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [self.animationShapeLayer addAnimation:bas forKey:@"key"];
}
-(void)
//停止动画
-(void)stopAnimation
{
   
}
-(void)removeFromSuperview
{
    [super removeFromSuperview];
    [self.speedAniamtionLineView removeFromSuperview];
    [self.speedAnimationDotView removeFromSuperview];
    [self.speedAnimationMoveView removeFromSuperview];
    [self.speedAnimationTouchBtn removeFromSuperview];
    self.speedAnimationTouchBtn = nil;
    self.speedAnimationMoveView = nil;
    self.speedAnimationDotView = nil;
    self.speedAniamtionLineView = nil;
}
@end
