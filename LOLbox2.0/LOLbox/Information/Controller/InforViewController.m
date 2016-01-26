//
//  InforViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "QueryToolViewController.h"
#import "InforViewController.h"
#import "LoginViewController.h"
#import "MyDetailHeroViewController.h"
#import "BaikeViewController.h"


@interface InforViewController ()

@end

@implementation InforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *arr = @[@"查战绩",@"游戏百科",@"账号查询工具"];
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 2100+i;
        button.backgroundColor = [UIColor purpleColor];
        button.frame = CGRectMake(0, 120+i*60, kWithd, 50);
        button.tintColor = [UIColor orangeColor];
        button.titleLabel.font = [UIFont systemFontOfSize:22];
        button.titleLabel.textAlignment = NSTextAlignmentLeft;
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(what:) forControlEvents:UIControlEventTouchUpInside];
        [self.basicV addSubview:button];
    }
}

- (void)what:(UIButton *)button
{
    if (button.tag==2100) { 
        NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
        BOOL bo = [uf boolForKey:@"logged"];
        if (bo==YES) {
            MyDetailHeroViewController *myVC = [[MyDetailHeroViewController alloc] init];
            myVC.serverName = [uf objectForKey:@"serverName"];
            myVC.userName = [uf objectForKey:@"userName"];
            [self.navigationController pushViewController:myVC animated:YES];
        }else{
        LoginViewController *logVC = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:logVC animated:YES];
        }
    }else if (button.tag==2101)
    {
        BaikeViewController *baikeVC = [[BaikeViewController alloc] init];
        [self.navigationController pushViewController:baikeVC animated:YES];
    }else if (button.tag==2102)
    {
        QueryToolViewController *qtVC = [[QueryToolViewController alloc] init];
        [self.navigationController pushViewController:qtVC animated:YES];
    }
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
