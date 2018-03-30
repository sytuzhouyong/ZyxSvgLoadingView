//
//  ViewController.m
//  SvgLoadingTest
//
//  Created by 周勇 on 30/03/2018.
//  Copyright © 2018 zhouyong. All rights reserved.
//

#import "ViewController.h"
#import "ZyxSvgLoadingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZyxSvgLoadingView *loadingView = [[ZyxSvgLoadingView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) svgImageNamed:@"loading" size:CGSizeMake(48, 32)];
    loadingView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:loadingView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [loadingView setImageWithURLString:@"https://static.pgyer.com/static-20180328/images/newHome/distribute.png"];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
