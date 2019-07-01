//
//  JMEmptyCollectionViewCell.m
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMEmptyCollectionViewCell.h"
#import "JMEmptyAnimationGroup.h"
#import "UIView+JMEmptyAnimation.h"
#import "JMEmptyConfig.h"

@implementation JMEmptyCollectionViewCell
-(void)dealloc{
    [JMCONFIG_MANAGER showLog:[NSString stringWithFormat:@"dealloc %@",[[self class] description]]];
    
}

-(void)setIsAnimation:(BOOL)isAnimation{
    _isAnimation = isAnimation;
    if (isAnimation) {
        [self startAnimation];
    }else{
        [self endAnimation];
    }
}

-(void)startAnimation{
    
    CGFloat orgWitdh = CGRectGetWidth(self.contentView.frame);
    CGFloat orgHeight = CGRectGetHeight(self.contentView.frame);
    CGFloat orgArea = orgWitdh*orgHeight;
    for (UIView*view in self.contentView.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [view startScaleX];
        }else{
            CGFloat witdh = CGRectGetWidth(view.frame);
            CGFloat height = CGRectGetHeight(view.frame);
            if (witdh*height <orgArea*0.8f) {
                [view addMaskLayer];
            }
        }
    }
}

-(void)endAnimation{
    
    for (UIView*view in self.contentView.subviews) {
        [view endAnimation];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.isAnimation) {
        [self startAnimation];
    }else{
        [self endAnimation];
    }
}



@end
