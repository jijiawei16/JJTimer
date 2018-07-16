//
//  ViewController.m
//  便捷计时器
//
//  Created by 16 on 2018/7/16.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import "ViewController.h"
#import "JJTimer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [JJTimer startTimerWithDuration:DBL_MAX down:NO start:^(CGFloat current) {
        NSLog(@"%f",current);
    } end:^{
        NSLog(@"结束了");
    }];
    
}

@end
