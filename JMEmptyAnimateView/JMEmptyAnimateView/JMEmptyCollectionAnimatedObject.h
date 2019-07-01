//
//  JMEmptyCollectionAnimatedObject.h
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import <JMEmptyAnimateView/JMEmptyAnimateView.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMEmptyCollectionAnimatedObject : JMEmptyAnimatedBaseObject<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,assign)UIEdgeInsets edgateIndsets;



@end

NS_ASSUME_NONNULL_END
