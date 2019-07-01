//
//  UIView+JMEmptyAnimation.m
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "UIView+JMEmptyAnimation.h"
#import <objc/runtime.h>
#import "JMEmptyAnimationGroup.h"
#import "JMEmptyConfig.h"


@implementation UIView (JMEmptyAnimation)
static NSString *animatinKey=@"animatinKey";
static NSString *maskKey = @"maskKey";

-(void)addMaskLayer{
    self.maskLayer.frame =self.bounds;
    self.maskLayer.backgroundColor =  JMCONFIG_MANAGER.bgColor.CGColor;
    
}
-(CALayer *)maskLayer{
    
    CALayer * maskObjcet = objc_getAssociatedObject(self,&maskKey);
    if (!maskObjcet) {
        maskObjcet = [CALayer layer];
        maskObjcet.backgroundColor = [UIColor whiteColor].CGColor;
        maskObjcet.bounds = self.bounds;
//        maskObjcet.cornerRadius = 5.0f;
        maskObjcet.zPosition = 98;
        [self.layer addSublayer:maskObjcet];
        objc_setAssociatedObject(self, &maskKey, maskObjcet, OBJC_ASSOCIATION_RETAIN);
    }
    
    return maskObjcet;
}

-(CALayer *)animationLayer{
    CALayer* object = objc_getAssociatedObject(self,&animatinKey);
    if (!object) {
     
        object = [CALayer layer];
        object.zPosition = 99;
        object.cornerRadius = 5.0f;
        [self.layer addSublayer:object];
        objc_setAssociatedObject(self, &animatinKey, object, OBJC_ASSOCIATION_RETAIN);
    }
    
    return object;
}

-(void)startScaleX{
    self.animationLayer.bounds = self.bounds;
    if ([self.animationLayer animationForKey:@"packupAnimation"]) {
        return;
    }
    self.animationLayer.backgroundColor =  JMCONFIG_MANAGER.bgColor.CGColor;
    self.animationLayer.anchorPoint = CGPointMake(0, 0);
    [self.animationLayer addAnimation:[JMEmptyAnimationGroup scaleXAnimationDuration:0.3f toValue:2.0]
                       forKey:@"packupAnimation"];
}

-(void)endAnimation{
    
    [JMCONFIG_MANAGER showLog:@"endAnimation"];
    
    CALayer * object = objc_getAssociatedObject(self,&animatinKey);
    CALayer * object2 = objc_getAssociatedObject(self,&maskKey);
   if (object) {
       [JMCONFIG_MANAGER showLog:@"endAnimation release object1"];
        [object removeAllAnimations];
        [object removeFromSuperlayer];
    }
    if (object2) {
        [JMCONFIG_MANAGER showLog:@"endAnimation release object2"];
        [object2 removeAllAnimations];
        [object2 removeFromSuperlayer];
    }
    objc_setAssociatedObject(self, &animatinKey, nil, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &maskKey, nil, OBJC_ASSOCIATION_RETAIN);
}

@end
