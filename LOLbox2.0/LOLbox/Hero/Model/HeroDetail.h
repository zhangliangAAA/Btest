//
//  HeroDetail.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Skill.h"

@interface HeroDetail : NSObject

@property (nonatomic,strong)NSString *enName;

@property(nonatomic, retain) NSString *nameid;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *displayName;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *iconPath;
@property(nonatomic, retain) NSString *portraitPath;
@property(nonatomic, retain) NSString *splashPath;
@property(nonatomic, retain) NSString *tags;
@property(nonatomic, retain) NSString *description1;//描述
@property(nonatomic, retain) NSString *quote;
@property(nonatomic, retain) NSString *quoteAuthor;
@property(nonatomic, retain) NSString *range;//攻击距离
@property(nonatomic, retain) NSString *moveSpeed;//移动速度
@property(nonatomic, retain) NSString *armorBase;//基础防御
@property(nonatomic, retain) NSString *armorLevel;//防御加成
@property(nonatomic, retain) NSString *manaBase;//基础魔法
@property(nonatomic, retain) NSString *manaLevel;//魔法加成
@property(nonatomic, retain) NSString *criticalChanceBase;//基础暴击
@property(nonatomic, retain) NSString *criticalChanceLevel;//暴击加成
@property(nonatomic, retain) NSString *manaRegenBase;//魔法恢复基础
@property(nonatomic, retain) NSString *manaRegenLevel;//魔法恢复加成
@property(nonatomic, retain) NSString *healthRegenBase;//生命恢复
@property(nonatomic, retain) NSString *healthRegenLevel;//恢复加成
@property(nonatomic, retain) NSString *magicResistBase;//魔抗
@property(nonatomic, retain) NSString *magicResistLevel;//魔抗加成
@property(nonatomic, retain) NSString *healthBase;//生命值基础
@property(nonatomic, retain) NSString *healthLevel;//生命加成
@property(nonatomic, retain) NSString *attackBase;//基础攻击
@property(nonatomic, retain) NSString *attackLevel;//基础攻击加成
@property(nonatomic, retain) NSString *ratingDefense;//防
@property(nonatomic, retain) NSString *ratingMagic;//法
@property(nonatomic, retain) NSString *ratingDifficulty;//难度
@property(nonatomic, retain) NSString *ratingAttack;//攻
@property(nonatomic, retain) NSString *tips;
@property(nonatomic, retain) NSString *opponentTips;
@property(nonatomic, retain) Skill *Skill_B;
@property(nonatomic, retain) Skill *Skill_Q;
@property(nonatomic, retain) Skill *Skill_W;
@property(nonatomic, retain) Skill *Skill_E;
@property(nonatomic, retain) Skill *Skill_R;
@property(nonatomic, retain) NSArray *like;
@property(nonatomic, retain) NSArray *hate;


@end
