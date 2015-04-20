//
//  WJSPeedView.m
//  WJSpeed
//
//  Created by chuanshuangzhang chuan shuang on 15/4/16.
//  Copyright (c) 2015年 iWangding. All rights reserved.
//

#import "WJSPeedView.h"


@implementation WJSPeedView
{
    UILabel                *animationTitleLabel;
    UILabel                *aniamtionDesLabel;
    UILabel                *animationBottomLabel;
    UIImageView            *BGImageView;
}

@synthesize wjSpeedAniamtionView;

-(instancetype)initWithDelegate:(id<WJSpeedAnimationViewDelegate>)delegate animationStep:(NSInteger)step
{
   if(self = [super init])
   {
       [self loadAniamtionBGView];
       [self loadSpeedAnimationView];
       [self loadAnimationBottomView];
        wjSpeedAniamtionView.delegate = delegate;
       wjSpeedAniamtionView.animationSteps = step;
   }
    
    return self;
}
-(id)init
{
    if(self = [super init])
    {
        [self loadAniamtionBGView];
        [self loadSpeedAnimationView];
        [self loadAnimationBottomView];
    }
    
    return self;
}
-(void)loadAniamtionBGView
{
    BGImageView = [[UIImageView alloc]init];
    BGImageView.backgroundColor = [UIColor greenColor];
    [BGImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:BGImageView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:BGImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:BGImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:BGImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:BGImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];

}
-(void)loadSpeedAnimationView
{
    wjSpeedAniamtionView = [[WJSpeedAnimationView alloc]init];
    [wjSpeedAniamtionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:wjSpeedAniamtionView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedAniamtionView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedAniamtionView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedAniamtionView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:wjSpeedAniamtionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];

}

-(void)loadAnimationBottomView
{
    animationBottomLabel = [[UILabel alloc]init];
    [animationBottomLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:animationBottomLabel];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:animationBottomLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:animationBottomLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:wjSpeedAniamtionView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
}
-(void)setAnimationDesStr:(NSString *)firstStr second:(NSString *)secStr
{
    NSMutableAttributedString *str;
    if(secStr.length>=1)
    {
        str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@    %@",firstStr,secStr]];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:24.0] range:NSMakeRange(0, firstStr.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, firstStr.length)];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:24.0] range:NSMakeRange(str.length - secStr.length, secStr.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(str.length - secStr.length, secStr.length)];
    }else{
        str = [[NSMutableAttributedString alloc] initWithString:firstStr];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:24.0] range:NSMakeRange(0, firstStr.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, firstStr.length-1)];
    }
    [animationBottomLabel setAttributedText:str];
}
-(void)setAnimationTitle:(NSString *)AnimationTitle
{
   
}
-(void)setBGImageName:(NSString *)BGImageName
{
    BGImageView.image = [UIImage imageNamed:BGImageName];
}
-(void)speedAnimationWithStep:(NSInteger)step value:(NSInteger)value units:(NSString *)units
{
    [wjSpeedAniamtionView updateAnimationWithValue:step];
}

-(void)startSpeedAnimation
{
    [wjSpeedAniamtionView startAnimation];
}

@end
