//
//  JMTempTableViewController.m
//  JMWorkDemo
//
//  Created by jimmy on 2019/6/28.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMTempTableViewController.h"
#import <JMEmptyAnimateView/JMEmptyAnimatedObject.h>
#import "JMDemoTableViewCell.h"

@interface JMTempTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) JMEmptyTableAnimatedObject *adapter;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JMTempTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter = [[JMEmptyTableAnimatedObject alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"JMDemoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.adapter.defautlCellIdentiy = @"cell";
    [self.adapter startViewControllerAnimated:self];
    
    __weak typeof(self) weakself = self;
    [self.adapter setCompleteBlock:^{
        
        weakself.tableView.delegate = weakself;
        weakself.tableView.dataSource = weakself;
        [weakself.tableView reloadData];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself.adapter endViewControllerAnimation];
    });
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  10;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JMDemoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.isAnimation = NO;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
