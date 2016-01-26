//
//  MyHeroCell.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface MyHeroCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *myImageView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *cnNameLabel;
@property (nonatomic,strong)UILabel *perTimesLabel;

- (void)configureCellWithModel:(Hero *)hero;

@end
