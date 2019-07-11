//
//  JMEmptyTableViewCell.m
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMEmptyTableViewCell.h"
#import "JMEmptyAnimationGroup.h"
#import "UIView+JMEmptyAnimation.h"
#import "JMEmptyConfig.h"
@implementation JMEmptyTableViewCell
-(void)dealloc{
    [JMCONFIG_MANAGER showLog:[NSString stringWithFormat:@"dealloc %@",[[self class] description]]];
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self startAnimation];
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
            CGFloat t = witdh*height;
            if (t < orgArea*0.5f ) {
                view.maskLayer.hidden = NO;
            }else{
                view.maskLayer.hidden = YES;
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
