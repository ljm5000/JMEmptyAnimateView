//
//  JMEmptyAnimationGroup.h
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMEmptyAnimationGroup : NSObject

+ (CABasicAnimation *)scaleXAnimationDuration:(CGFloat)duration
                                      toValue:(CGFloat)toValue;
@end

NS_ASSUME_NONNULL_END
