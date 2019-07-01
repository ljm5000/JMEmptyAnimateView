//
//  JMEmptyTableAnimatedObject.m
//  JMEmptyAnimateView
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMEmptyTableAnimatedObject.h"
#import "JMEmptyTableViewCell.h"

@interface JMEmptyTableAnimatedObject()
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation JMEmptyTableAnimatedObject

-(void)endAnimation{
    self.isAnimation = NO;
    [self.tableView reloadData];
    [self complelteAction];
}

-(void)complelteAction{
    
    if (self.completeBlock) {
        self.completeBlock();
    }
    
}

-(void)startAnimated:(UITableView *)tableView{
    
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (!self.isAnimation) {
        return 0;
    }else if (self.sectionBlock) {
        return self.sectionBlock();
    }else{
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!self.isAnimation) {
        return 0;
    }else if (self.numOfRowBlock) {
        return self.numOfRowBlock(section);
    }else{
        return 5;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sizeRowForBlock) {
        return self.sizeRowForBlock(indexPath).height;
    }else{
        return 200.0f;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JMEmptyTableViewCell * cell ;
    if (self.cellForRow) {
        cell = self.cellForRow(tableView,indexPath);
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:self.defautlCellIdentiy];
    }
    
    cell.isAnimation = self.isAnimation;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
