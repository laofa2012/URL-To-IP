//
//  ViewController.m
//  URLTOIP
//
//  Created by Yuanhai on 12/7/17.
//  Copyright © 2017年 Yuanhai. All rights reserved.
//

#import "ViewController.h"
#import "NetUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *ip = [NetUtil queryIpWithDomain:@"www.shiney.net.cn"];
    NSLog(@"ip:%@", ip);
    NSLog(@"myIP:%@", [NetUtil queryIPAddress]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
