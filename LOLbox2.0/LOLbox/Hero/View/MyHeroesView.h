//
//  MyHeroesView.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHeroesView : UIView
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong)NSString *name;
@end
