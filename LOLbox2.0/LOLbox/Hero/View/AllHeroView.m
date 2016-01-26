//
//  AllHeroView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AllHeroView.h"
#import "HeroListCell.h"
#import "Hero.h"

@interface AllHeroView ()<UICollectionViewDataSource>

@end

@implementation AllHeroView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
        UILabel *alabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 35, 30)];
        alabel.text = @"搜索";
        alabel.textColor = [UIColor whiteColor];
        [self addSubview:alabel];
        
        self.textF = [[UITextField alloc] initWithFrame:CGRectMake(kWithd/4, 10, kWithd/2, 30)];
        self.textF.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:self.textF];
        
        self.search = [UIButton buttonWithType:UIButtonTypeSystem];
        self.search.frame = CGRectMake(3*kWithd/4+15, 10, 40, 30);
        [self.search setTitle:@"搜索" forState:UIControlStateNormal];
        [self.search setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self addSubview:self.search];
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(kWithd/2-20, kWithd/4);
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 20, 10);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, kWithd, frame.size.height-30) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        // 注册英雄列表Cell
        [_collectionView registerClass:[HeroListCell class] forCellWithReuseIdentifier:@"reuse"];
    }
    return self;
}

- (void)setArray:(NSMutableArray *)array
{
    _array = [NSMutableArray arrayWithArray:array];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return self.array.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    Hero *hero = self.array[indexPath.item];
    [cell configureCellWithModel:hero];
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
