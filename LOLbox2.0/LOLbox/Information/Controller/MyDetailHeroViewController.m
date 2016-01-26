//
//  MyDetailHeroViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MyDetailHeroViewController.h"

@interface MyDetailHeroViewController ()
@property (nonatomic,strong)UIWebView *webV;

@end

@implementation MyDetailHeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webV = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100)];
#pragma mark-如果网址中有汉字,则需要使用以下方法,将汉字转码
    NSString *urlStr = [NSString stringWithFormat:@"http://zdl.mbox.duowan.com/phone/playerDetailNew.php?lolboxAction=toPlayerDetail&sn=%@&pn=%@&sk=&v=242&timestamp=1452501411579",self.serverName,self.userName];
    NSString *utf8Str = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:utf8Str]];
    [self.webV loadRequest:request];
    [self.basicV addSubview:self.webV];
    
    self.logOffB = [UIButton buttonWithType:UIButtonTypeSystem];
    _logOffB.tintColor = [UIColor orangeColor];
    _logOffB.titleLabel.font = [UIFont systemFontOfSize:22];
    [_logOffB setTitle:@"注销" forState:UIControlStateNormal];
    _logOffB.frame = CGRectMake(kWithd-100, 30, 80, 40);
    [_logOffB addTarget:self action:@selector(LogOrCancel) forControlEvents:UIControlEventTouchUpInside];
    [self.basicV addSubview:_logOffB];

    
}
- (void)LogOrCancel//一匡天下AAA
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否注销" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
        [uf setBool:NO forKey:@"logged"];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertC addAction:ok];
    [alertC addAction:cancel];
    [self.navigationController presentViewController:alertC animated:YES completion:nil];
   
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
