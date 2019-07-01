//
//  UIView+JMEmptyAnimation.h
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JMEmptyAnimation)

@property (nonatomic,weak,readonly) CALayer *animationLayer;
@property (nonatomic,weak,readonly) CALayer *maskLayer;



-(void)addMaskLayer;

-(void)startScaleX;

-(void)endAnimation;

@end

NS_ASSUME_NONNULL_END
