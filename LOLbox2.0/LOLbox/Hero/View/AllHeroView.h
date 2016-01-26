//
//  AllHeroView.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllHeroView : UIView
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong)UITextField *textF;
@property (nonatomic,strong)UIButton *search;

@end
