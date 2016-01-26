//
//  ChoseHeroViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ChoseHeroViewController.h"
#import "AllHeroView.h"
#import "Hero.h"
#import "NetHandler.h"


@interface ChoseHeroViewController ()<UICollectionViewDelegate>
@property (nonatomic,strong)NSMutableArray *heroArr;
@property (nonatomic,strong)AllHeroView *allheroV;

@end

@implementation ChoseHeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.allheroV = [[AllHeroView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100)];
    self.allheroV.collectionView.delegate = self;
    [self.view addSubview:self.allheroV];
    self.allheroV.textF.placeholder = @"Ashe 寒冰射手 艾希";
    [self.allheroV.textF addTarget:self action:@selector(search) forControlEvents:UIControlEventEditingChanged];
    
    [self handlerAllHero];
}

- (void)search
{
    if ([self.allheroV.textF.text isEqualToString:@""]) {
        self.allheroV.array = self.heroArr;
    }else
    {
        NSMutableArray *arr = [NSMutableArray array];
        for (Hero *hero in self.heroArr) {
            if ([hero.enName containsString:self.allheroV.textF.text] || [hero.cnName containsString:self.allheroV.textF.text] || [hero.title containsString:self.allheroV.textF.text]) {
                [arr addObject:hero];
            }
        }
        self.allheroV.array = arr;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
//  2.调用block
    Hero *hero = self.allheroV.array[indexPath.row];
    if (self.choseHero != nil) {
    self.choseHero(hero.enName);
    }
    [self.navigationController popViewControllerAnimated:YES];
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
        self.heroArr = [NSMutableArray arrayWithArray:mutableArr];
        self.allheroV.array = mutableArr;
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
