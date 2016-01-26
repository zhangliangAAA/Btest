//
//  QueryToolViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/21.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "QueryToolViewController.h"

@interface QueryToolViewController ()
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation QueryToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100)];
    NSURL *url = [NSURL URLWithString:@"http://115.28.43.55/lol/index.php/Chaxun/index"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [self.webView loadRequest:request];
    [self.basicV addSubview:self.webView];
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
