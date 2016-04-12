//
//  EquipCollectionViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipCollectionViewController.h"
#import "EquipDetailViewController.h"
#import "NetHandler.h"
#import "EquipCollectCell.h"
#import "UIImageView+WebCache.h"


@interface EquipCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionV;
@property (nonatomic,strong)NSMutableArray *equipArr;
@end

@implementation EquipCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handler];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(kWithd/4, kWithd/4);
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 15, 30, 15);
    self.collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100) collectionViewLayout:flowLayout];
    self.collectionV.dataSource = self;
    self.collectionV.delegate = self;
    [self.collectionV registerClass:[EquipCollectCell class] forCellWithReuseIdentifier:@"equip"];
    self.collectionV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.view addSubview:self.collectionV];
    
    NSLog(@"修改 4.12 8.28");
    NSLog(@"修改2  8.54");
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.equipArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EquipCollectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"equip" forIndexPath:indexPath];
    NSDictionary *dict = self.equipArr[indexPath.item];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",dict[@"id"]]];
    [cell.imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
    cell.nameLabel.text = dict[@"text"];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    EquipDetailViewController *edVC = [[EquipDetailViewController alloc] init];
    NSDictionary *dict = self.equipArr[indexPath.item];
    edVC.number = dict[@"id"];
    [self.navigationController pushViewController:edVC animated:YES];
}

- (void)handler
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@",self.name] completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        self.equipArr = [NSMutableArray arrayWithArray:arr];
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
