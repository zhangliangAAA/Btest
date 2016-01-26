//
//  HeroesViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "LoginViewController.h"
#import "HeroesViewController.h"
#import "HeroDetailViewController.h"
#import "HeroView.h"
#import "MyHeroesView.h"
#import "AllHeroView.h"
#import "HeroDetailView.h"
#import "NetHandler.h"
#import "Hero.h"

@interface HeroesViewController ()<UICollectionViewDelegate>
@property (nonatomic,strong)HeroView *heroV;
@property (nonatomic,strong)MyHeroesView *myHeroV;
@property (nonatomic,strong)AllHeroView *allHeroV;
@property (nonatomic,strong)NSMutableArray *allHeroArray; //存储所有英雄,方便查询
@property (nonatomic,assign)BOOL isSearch;
@end

@implementation HeroesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//  创建自己的控件 添加
    UISegmentedControl *segCtrl = [[UISegmentedControl alloc] initWithItems:@[@"周免",@"我的",@"全部"]];
    segCtrl.frame = CGRectMake(0,100, kWithd, 35);
    segCtrl.tintColor = [UIColor orangeColor];
    segCtrl.selectedSegmentIndex = 0;
    [segCtrl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segCtrl];// 一匡天下AAA
//  周免界面
    self.heroV = [[HeroView alloc] initWithFrame:CGRectMake(0,135, kWithd, kHeight-135)];
    // 设置代理
    self.heroV.collectionView.delegate = self;
    self.heroV.tag = 1000;
    [self.view addSubview:_heroV];
//  我的界面
    self.myHeroV = [[MyHeroesView alloc] initWithFrame:CGRectMake(0,135, kWithd, kHeight-135)];
    self.myHeroV.tag = 1001;
    self.myHeroV.collectionView.delegate = self;
    [self.view addSubview:self.myHeroV];
//  全部界面
    self.allHeroV = [[AllHeroView alloc] initWithFrame:CGRectMake(0, 135, kWithd, kHeight-135)];
    self.allHeroV.collectionView.delegate = self;
    self.allHeroV.tag = 1002;
    // 给搜索Button添加事件
    [self.allHeroV.search addTarget:self action:@selector(searchHero) forControlEvents:UIControlEventTouchUpInside];
    self.isSearch = YES; // 用于改变Button的功能
    // 给self.allHeroV.textF 添加改变搜索内容时改变所搜列表
    [self.allHeroV.textF addTarget:self action:@selector(searchHeroByTF:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.allHeroV];
    
    
    [self.view bringSubviewToFront:self.heroV];
    [self loadNetData];
}

- (void)searchHeroByTF:(UITextField *)textF
{
    if ([textF.text isEqualToString:@""]) {
        self.allHeroV.array = self.allHeroArray;
    }else
    {
        NSMutableArray *arr = [NSMutableArray array];
        for (Hero *hero in self.allHeroArray) {
            if ([hero.enName containsString:textF.text] || [hero.cnName containsString:textF.text] || [hero.title containsString:textF.text]) {
                [arr addObject:hero];
            }
        }
        self.allHeroV.array = arr;
    }
}

- (void)searchHero
{
    if (self.isSearch == YES) {
        self.isSearch = NO;
        [self.allHeroV.search setTitle:@"取消" forState:UIControlStateNormal];
        NSMutableArray *arr = [NSMutableArray array];
        for (Hero *hero in self.allHeroV.array) {
            if ([hero.enName containsString:self.allHeroV.textF.text]) {
                [arr addObject:hero];
            }
        }
        self.allHeroV.array = arr;
        
    }else
    {
        self.isSearch = YES;
        [self.allHeroV.search setTitle:@"搜索" forState:UIControlStateNormal];
        self.allHeroV.textF.text = @"";
        [self handlerAllHero];
    }
}



#pragma mark- CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HeroDetailViewController *detailVC = [[HeroDetailViewController alloc] init];
    
    if ([collectionView isEqual:self.heroV.collectionView]) {
        Hero *hero = self.heroV.array[indexPath.item];
        detailVC.hero = hero;
    }else if ([collectionView isEqual:self.allHeroV.collectionView]){
        Hero *hero = self.allHeroV.array[indexPath.item];
        detailVC.hero = hero;
    }else if ([collectionView isEqual:self.myHeroV.collectionView]){
        Hero *hero = self.myHeroV.array[indexPath.item];
        detailVC.hero = hero;
    }
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)change:(UISegmentedControl *)seg
{
    [self.view bringSubviewToFront:[self.view viewWithTag:(1000+seg.selectedSegmentIndex)]];
    if (seg.selectedSegmentIndex ==0) {
        [self loadNetData];
    }else if (seg.selectedSegmentIndex ==1){
        [self handlerMyHero];
    }else
    {
        [self handlerAllHero];
    }
}


- (void)loadNetData
{
    // 获取周免英雄列表
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiHeroes.php?v=70&type=free&OSType=iOS8.1.2" completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:nil];
        NSArray *array = dict[@"free"];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *newDict in array) {
            Hero *hero = [[Hero alloc] init];
            [hero setValuesForKeysWithDictionary:newDict];
            [mutableArr addObject:hero];
        }
        self.heroV.array = mutableArr;
    }];
}
- (void)handlerMyHero
{
    // 获取我的英雄列表
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    BOOL bo = [uf boolForKey:@"logged"];
    if (bo == YES) {
        NSString *str = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiMyHeroes.php?serverName=%@&OSType=iOS8.1.2&target=%@&v=70",[uf objectForKey:@"serverName"],[uf objectForKey:@"userName"]];
        
        [NetHandler getDataWithUrl:[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:nil];
        self.myHeroV.name = dict[@"serverName"];
        NSArray *array = dict[@"myHeroes"];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *newDict in array) {
            Hero *hero = [[Hero alloc] init];
            [hero setValuesForKeysWithDictionary:newDict];
            [mutableArr addObject:hero];
        }
        self.myHeroV.array = mutableArr;
    }];
    }else
    {
        LoginViewController *logVC = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:logVC animated:YES];
    }
}

- (void)handlerAllHero
{
    // 获取全部英雄列表
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiHeroes.php?v=70&type=all&OSType=iOS8.1.2" completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:nil];
        NSArray *array = dict[@"all"];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *newDict in array) {
            Hero *hero = [[Hero alloc] init];
            [hero setValuesForKeysWithDictionary:newDict];
            [mutableArr addObject:hero];
        }
        self.allHeroArray = [NSMutableArray arrayWithArray:mutableArr];
        self.allHeroV.array = mutableArr;
    }];

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
