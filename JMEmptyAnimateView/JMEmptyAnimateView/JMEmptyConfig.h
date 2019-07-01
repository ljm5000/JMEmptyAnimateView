//
//  JMEmptyConfig.h
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define JMCONFIG_MANAGER [JMEmptyConfig shareInstance]

NS_ASSUME_NONNULL_BEGIN

@interface JMEmptyConfig : NSObject

@property (nonatomic,assign) BOOL isLog;
@property (nonatomic,strong) UIColor * bgColor;


+ (JMEmptyConfig *)shareInstance;

-(void)showLog:(NSString *)log;

@end

NS_ASSUME_NONNULL_END
