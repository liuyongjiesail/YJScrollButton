//
//  ViewController.m
//  ScrollButton
//
//  Created by 刘永杰 on 16/6/12.
//  Copyright © 2016年 刘永杰. All rights reserved.
//

#import "ViewController.h"
#import "YJScrollViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    YJScrollViewController *yjVC = [[YJScrollViewController alloc] init];
    [self showViewController:yjVC sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
