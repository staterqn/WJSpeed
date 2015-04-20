//
//  WJSpeedAnimationView.h
//  WJSpeed
//
//  Created by chuanshuangzhang chuan shuang on 15/4/16.
//  Copyright (c) 2015年 iWangding. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WJSpeedAnimationViewDelegate <NSObject>

@optional

-(void)WJSpeedAnimationWillStart;

-(void)WJSpeedAnimationWillComplete;

@end

@interface WJSpeedAnimationView : UIView

@property (nonatomic,strong)  UIImageView  *speedAniamtionLineView;
@property (nonatomic,strong)  UIImageView  *speedAnimationMoveView;
@property (nonatomic,strong)  UIImageView  *speedAnimationDotView;
@property (nonatomic,strong)  UIButton     *speedAnimationTouchBtn;
@property (nonatomic,strong)  CAShapeLayer *animationShapeLayer;
@property (nonatomic,readwrite) NSInteger  animationSteps;

@property (nonatomic,weak) id<WJSpeedAnimationViewDelegate>  delegate;

-(void)setAnimationTouchSource:(NSString *)normalStr select:(NSString *)selectStr;
-(void)updateAnimationWithValue:(NSInteger)step;
-(void)startAnimation;
-(void)stopAnimation;

@end
