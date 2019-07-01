//
//  JMEmptyConfig.m
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMEmptyConfig.h"

@implementation JMEmptyConfig
+ (JMEmptyConfig *)shareInstance{
    
    static JMEmptyConfig *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[JMEmptyConfig alloc] init];
        [_sharedInstance setupDefaultSetting];
    });
    return _sharedInstance;
}

-(void)setupDefaultSetting{
    self.isLog = NO;
    self.bgColor = [UIColor colorWithWhite:0.95 alpha:1.0f];
    
}
- (void)showLog:(NSString *)log{
    if (self.isLog) {
        NSLog(@"JMEmptyConfig %@",log);
    }
    
}

@end
