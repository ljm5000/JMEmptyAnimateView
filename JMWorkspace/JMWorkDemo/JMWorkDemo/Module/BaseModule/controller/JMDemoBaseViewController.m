//
//  JMDemoBaseViewController.m
//  JMWorkDemo
//
//  Created by jimmy on 2019/6/29.
//  Copyright © 2019 com.jimmy. All rights reserved.
//

#import "JMDemoBaseViewController.h"

@interface JMDemoBaseViewController ()

@end

@implementation JMDemoBaseViewController

-(void)dealloc{
    NSLog(@"dealloc %@",[[self class] description]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
