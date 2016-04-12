//
//  MainViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "HeroesViewController.h"
#import "EquipViewController.h"
#import "InforViewController.h"

@interface MainViewController ()
@property (nonatomic,strong)MainView *mainV;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.mainV = [[MainView alloc] initWithFrame:CGRectMake(0, 0, kWithd, kHeight)];
    [_mainV.button1 addTarget:self action:@selector(Heroes) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mainV];
    [_mainV.button2 addTarget:self action:@selector(Equip) forControlEvents:UIControlEventTouchUpInside];
    [_mainV.button3 addTarget:self action:@selector(Infor) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"模拟自己修改 8.34！");
    // 模拟自己修改 9.05！！！
    // 收到其他人在人家自己模块的修改 跟我没毛关系 bye
}

- (void)Heroes
{
    HeroesViewController *heroesVC = [[HeroesViewController alloc] init];
    [self.navigationController pushViewController:heroesVC animated:YES];
}
- (void)Equip
{
    EquipViewController *eVC = [[EquipViewController alloc] init];
    [self.navigationController pushViewController:eVC animated:YES];
}
- (void)Infor
{
    InforViewController *inforVC = [[InforViewController alloc] init];
    [self.navigationController pushViewController:inforVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
        [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationRepeatCount:NSIntegerMax];
        self.mainV.button1.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.mainV.button1.transform = CGAffineTransformMakeRotation(-M_PI_4);
        self.mainV.button2.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.mainV.button2.transform = CGAffineTransformMakeRotation(-M_PI_4);
        self.mainV.button3.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.mainV.button3.transform = CGAffineTransformMakeRotation(-M_PI_4);
        
    } completion:nil];

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
