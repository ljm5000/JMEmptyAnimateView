//
//  JMEmptyAnimatedObject.m
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMEmptyAnimatedObject.h"
#import "UIView+JMEmptyAnimation.h"

@interface JMEmptyAnimatedBaseObject()
@property (nonatomic,weak)UIView *superView;
@end

@implementation JMEmptyAnimatedBaseObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isAnimation = YES;
    }
    return self;
}

-(void)startViewControllerAnimated:(UIViewController *)controller{
    
    UIView * tmpView = controller.view;
    self.superView =tmpView;
    for (UIView*view in self.superView.subviews) {
        if ([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]) {
            [self startAnimated:view];
        }else if([view isKindOfClass:[UILabel class]] ||
                 [view isKindOfClass:[UIButton class]]||
                 [view isKindOfClass:[UIImageView class]]){
            
            [view addMaskLayer];
        }
    }
}
-(void)endViewControllerAnimation{
     self.isAnimation = NO;
    for (UIView*view in self.superView.subviews) {
        if ([view isKindOfClass:[UITableView class]]|| [view isKindOfClass:[UICollectionView class]]) {
            [self endAnimation];
        }else if([view isKindOfClass:[UILabel class]] ||
                 [view isKindOfClass:[UIButton class]]||
                 [view isKindOfClass:[UIImageView class]]){
            
            [view endAnimation];
        }
    }
    
}
-(void)startAnimated:(UIView *)tmpView{
    
}

-(void)endAnimation{
    self.isAnimation = NO;
}

-(void)complelteAction{
    
    if (self.completeBlock) {
        self.completeBlock();
    }
}


@end

