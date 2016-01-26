//
//  DataCell.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetail.h"

@interface DataCell : UITableViewCell

@property (nonatomic,assign)int grade;
@property (nonatomic,strong)HeroDetail *HD;//配制Cell属性

@property (nonatomic,strong)UILabel *gradeLabel;
@property (nonatomic,strong)UISlider *slider;

@property (nonatomic,strong)UILabel *rangeLabel;//攻击距离
@property (nonatomic,strong)UILabel *moveLabel;//移动速度
@property (nonatomic,strong)UILabel *attLabel;//攻击
@property (nonatomic,strong)UILabel *armorLabel;//防御
@property (nonatomic,strong)UILabel *manaLabel;//魔法
@property (nonatomic,strong)UILabel *healthLabel;//生命
@property (nonatomic,strong)UILabel *critiLabel;//暴击
@property (nonatomic,strong)UILabel *manaRegenLabel;//魔法恢复
@property (nonatomic,strong)UILabel *healthRegenLabel;//生命恢复
@property (nonatomic,strong)UILabel *magicLabel;//魔法抗性

@end
