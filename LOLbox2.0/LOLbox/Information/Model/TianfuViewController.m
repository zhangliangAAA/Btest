//
//  TianfuViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/21.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TianfuViewController.h"

@interface TianfuViewController ()

@end

@implementation TianfuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webV = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100)];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://llbox.cn/loltfs6/index.htm"]];
    [webV loadRequest:request];
    [self.basicV addSubview:webV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
