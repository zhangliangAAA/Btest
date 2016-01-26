//
//  HeroView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroView.h"
#import "HeroListCell.h"
#import "Hero.h"

@interface HeroView ()<UICollectionViewDataSource>



@end


@implementation HeroView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(kWithd/2-20, kWithd/4);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 5);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWithd, frame.size.height) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        // 注册周免英雄Cell
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
    if (self.array) {
        return self.array.count;
    }else
    {
        return 20;
    }
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
