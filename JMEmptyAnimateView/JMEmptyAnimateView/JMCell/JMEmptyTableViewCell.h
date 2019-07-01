//
//  JMEmptyTableViewCell.h
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMEmptyTableViewCell : UITableViewCell
@property (nonatomic,assign,readonly) CGFloat scaleXWith;
@property (nonatomic,assign,readonly) CGFloat anrchoPoint;

@property (nonatomic,assign)BOOL isAnimation;

-(void)startAnimation;
-(void)endAnimation;
@end

NS_ASSUME_NONNULL_END
