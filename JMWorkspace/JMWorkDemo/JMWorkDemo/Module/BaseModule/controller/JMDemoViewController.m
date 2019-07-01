//
//  JMDemoViewController.m
//  JMWorkDemo
//
//  Created by jimmy on 2019/7/1.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMDemoViewController.h"
#import <JMEmptyAnimateView/JMEmptyAnimatedObject.h>
@interface JMDemoViewController ()
@property (nonatomic,strong) JMEmptyAnimatedBaseObject *adapter;
@end

@implementation JMDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.adapter startViewControllerAnimated:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.adapter endViewControllerAnimation];
    });
}
#pragma mark
-(JMEmptyAnimatedBaseObject *)adapter{
    if (!_adapter) {
        _adapter = [[JMEmptyAnimatedBaseObject alloc] init];
    }
    return _adapter;
}

@end
