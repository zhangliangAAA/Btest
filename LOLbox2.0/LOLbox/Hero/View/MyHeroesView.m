//
//  MyHeroesView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MyHeroesView.h"

#import "MyHeroCell.h"

#import "Hero.h"

@interface MyHeroesView ()<UICollectionViewDataSource>

@property (nonatomic,strong)UILabel *serverLabel;
@property (nonatomic,strong)UILabel *totalLabel;
@end


@implementation MyHeroesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.serverLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kWithd-10, 25)];
        _serverLabel.textColor = [UIColor whiteColor];
        [self addSubview:_serverLabel];
        
        self.totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, kWithd-10, 25)];
        _totalLabel.textColor = [UIColor whiteColor];
        [self addSubview:_totalLabel];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(kWithd-20, 80);
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 10, 10, 10);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, kWithd, frame.size.height-50) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        
        
        [self.collectionView registerClass:[MyHeroCell class] forCellWithReuseIdentifier:@"reuse"];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return self.array.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyHeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    Hero *hero = self.array[indexPath.item];
    [cell configureCellWithModel:hero];
    return cell;
}


- (void)setArray:(NSMutableArray *)array
{
    _array = array;
    self.serverLabel.text = [NSString stringWithFormat:@"英雄资产(%@)",self.name];
    int sum = 0;
    for (Hero *hero in array) {
        NSArray *arr = [hero.price componentsSeparatedByString:@","];
        sum += [arr[0] intValue];
    }
    self.totalLabel.text = [NSString stringWithFormat:@"您共有%ld个英雄,价值%d金币",(unsigned long)array.count,sum];
    [self.collectionView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
