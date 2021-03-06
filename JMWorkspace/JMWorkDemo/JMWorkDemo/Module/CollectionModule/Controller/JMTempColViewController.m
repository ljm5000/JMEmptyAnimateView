//
//  JMTempColViewController.m
//  JMWorkDemo
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMTempColViewController.h"
#import "JMTempCollectionViewCell.h"
#import <JMEmptyAnimateView/JMEmptyCollectionViewCell.h>

@interface JMTempColViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong) JMEmptyCollectionAnimatedObject *adapter;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation JMTempColViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JMTempCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

    [self.adapter startViewControllerAnimated:self];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.adapter endViewControllerAnimation];
    });
}



#pragma mark - collection view delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2-5, 200);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JMEmptyCollectionAnimatedObject * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.isAnimation = NO;
    return cell;
}

-(JMEmptyCollectionAnimatedObject *)adapter{
    if (!_adapter) {
        _adapter = [[JMEmptyCollectionAnimatedObject alloc] init];
        _adapter.defautlCellIdentiy = @"cell";
        
        __weak typeof(self) weakself = self;
        [_adapter setCompleteBlock:^{
            weakself.collectionView.delegate = weakself;
            weakself.collectionView.dataSource = weakself;
            [weakself.collectionView reloadData];
        }];
    }
    return _adapter;
}



@end
