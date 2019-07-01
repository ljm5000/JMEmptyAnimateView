//
//  JMEmptyAnimatedObject.h
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSInteger (^JMEmptysizeNumOfSection)(void);
typedef NSInteger (^JMEmptysizeNumOfRowSection)(NSInteger section);
typedef CGSize(^JMEmptysizeForSectionBlock)(NSIndexPath *indexPath);
typedef id (^JMEmptyCellForRowBlock)(id view,NSIndexPath*indexPath);
typedef void(^JMEmptyCompleteBlock)(void);

@interface JMEmptyAnimatedBaseObject :NSObject

@property (nonatomic,copy) JMEmptysizeNumOfSection sectionBlock;
@property (nonatomic,copy) JMEmptysizeNumOfRowSection numOfRowBlock;
@property (nonatomic,copy) JMEmptysizeForSectionBlock sizeRowForBlock;
@property (nonatomic,copy) JMEmptyCellForRowBlock cellForRow;
@property (nonatomic,copy) NSString * defautlCellIdentiy;
@property (nonatomic,copy) JMEmptyCompleteBlock completeBlock;
@property (atomic,assign) BOOL isAnimation;

-(void)startAnimated:(UIView *)tmpView;
-(void)endAnimation;

-(void)startViewControllerAnimated:(UIViewController *)controller;
-(void)endViewControllerAnimation;
@end
NS_ASSUME_NONNULL_END
