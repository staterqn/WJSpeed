//
//  WJSPeedView.h
//  WJSpeed
//
//  Created by chuanshuangzhang chuan shuang on 15/4/16.
//  Copyright (c) 2015年 iWangding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJSpeedAnimationView.h"

@interface WJSPeedView : UIView 

@property (nonatomic,strong)   NSString *BGImageName;
@property (nonatomic,strong)   NSString *AnimationTitle;
@property (nonatomic,strong)   NSString *AnimationDesStr;
@property (nonatomic,strong)   WJSpeedAnimationView   *wjSpeedAniamtionView;

-(instancetype)initWithDelegate:(id<WJSpeedAnimationViewDelegate>)delegate animationStep:(NSInteger)step;

// 设置底部文字，两段文字的风格不一致
-(void)setAnimationDesStr:(NSString *)firstStr second:(NSString *)secStr;

-(void)speedAnimationWithStep:(NSInteger)step value:(NSInteger)value units:(NSString *)units;//数值和单位

-(void)startSpeedAnimation;

@end
