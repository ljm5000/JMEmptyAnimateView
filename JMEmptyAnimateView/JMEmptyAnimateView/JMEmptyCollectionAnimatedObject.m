//
//  JMEmptyCollectionAnimatedObject.m
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMEmptyCollectionAnimatedObject.h"
#import "JMEmptyCollectionViewCell.h"


@interface JMEmptyCollectionAnimatedObject()
@property (nonatomic,weak)UICollectionView *collectionView;

@end

@implementation JMEmptyCollectionAnimatedObject
-(void)startAnimated:(UICollectionView *)collectionView{
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    self.collectionView = collectionView;
    
}

-(void)endAnimation{
    [super endAnimation];
    [self.collectionView reloadData];
    [self complelteAction];
}
-(void)complelteAction{
  
    if (self.completeBlock) {
        self.completeBlock();
    }
}

#pragma mark - collection view delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (!self.isAnimation) {
        return 0;
    }else if (self.sectionBlock) {
        return self.sectionBlock();
    }else{
        return 1;
    }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (!self.isAnimation) {
        return 0;
    }else if (self.numOfRowBlock) {
        return self.numOfRowBlock(section);
    }else{
        return 10;
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return self.edgateIndsets;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.sizeRowForBlock) {
        return self.sizeRowForBlock(indexPath);
    }else{
        return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2-5, 200);
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JMEmptyCollectionViewCell * cell ;
    if (self.cellForRow) {
        cell =  self.cellForRow(collectionView, indexPath);
    }else{
        cell  = [collectionView dequeueReusableCellWithReuseIdentifier:self.defautlCellIdentiy forIndexPath:indexPath];
    }
    
    cell.isAnimation = self.isAnimation;
    return cell;
}
@end
