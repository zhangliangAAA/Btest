//
//  KealSkillCell.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kealSkill.h"
@interface KealSkillCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *imageV;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)kealSkill *skill;
@end
