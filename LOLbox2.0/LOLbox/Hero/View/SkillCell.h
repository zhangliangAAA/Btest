//
//  SkillCell.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Skill.h"

@interface SkillCell : UITableViewCell

@property (nonatomic,assign)CGFloat rowHeight;

@property (nonatomic,strong)UIButton *buttonB;
@property (nonatomic,strong)UIButton *buttonQ;
@property (nonatomic,strong)UIButton *buttonW;
@property (nonatomic,strong)UIButton *buttonE;
@property (nonatomic,strong)UIButton *buttonR;

@property (nonatomic,strong)NSArray *viewArr;
@property (nonatomic,strong)UIView *viewB;
@property (nonatomic,strong)UIView *viewQ;
@property (nonatomic,strong)UIView *viewW;
@property (nonatomic,strong)UIView *viewE;
@property (nonatomic,strong)UIView *viewR;

@property (nonatomic,strong)NSString *name;//英雄名字

@property (nonatomic,strong)UILabel *nameLabel;//技能名
@property (nonatomic,strong)UILabel *descriptLabel;//描述
@property (nonatomic,strong)UILabel *costLabel;//消耗
@property (nonatomic,strong)UILabel *coolLabel;//冷却
@property (nonatomic,strong)UILabel *rangeLabel;//范围
@property (nonatomic,strong)UILabel *effectLabel;//效果
@property (nonatomic,copy)NSString *skillId;


@property (nonatomic,strong)Skill *skill;//配制信息
@end
