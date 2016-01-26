//
//  KaelSkillViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "kaelSkillDetailViewController.h"
#import "kealSkill.h"
#import "KaelSkillViewController.h"
#import "KealSkillCell.h"
#import "NetHandler.h"

@interface KaelSkillViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionV;
@property (nonatomic,strong)NSMutableArray *skillArr;
@end

@implementation KaelSkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handler];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(kWithd/5, kWithd/5);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 25, 10);
    flowLayout.minimumLineSpacing = 40;
    self.collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100) collectionViewLayout:flowLayout];
    self.collectionV.dataSource = self;
    self.collectionV.delegate = self;
    [self.collectionV registerClass:[KealSkillCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.basicV addSubview:self.collectionV];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.skillArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KealSkillCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    kealSkill *skill = self.skillArr[indexPath.item];
    cell.skill = skill;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    kaelSkillDetailViewController *ksdVC = [[kaelSkillDetailViewController alloc] init];
    kealSkill *skill = self.skillArr[indexPath.item];
    ksdVC.skill = skill;
    [self.navigationController pushViewController:ksdVC animated:YES];
}

- (void)handler
{
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiSumAbility.php?v=70&OSType=iOS8.1.2" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        self.skillArr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            kealSkill *skill = [[kealSkill alloc] init];
            [skill setValuesForKeysWithDictionary:dict];
            [self.skillArr addObject:skill];
        }
        [self.collectionV reloadData];
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
