//
//  JMEmptyCollectionViewCell.h
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMEmptyCollectionViewCell : UICollectionViewCell
@property (nonatomic,assign)BOOL isAnimation;
-(void)startAnimation;
-(void)endAnimation;
@end

NS_ASSUME_NONNULL_END
