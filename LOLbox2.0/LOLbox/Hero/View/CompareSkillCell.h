//
//  CompareSkillCell.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Skill.h"


@interface CompareSkillCell : UITableViewCell
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,assign)CGFloat rowHeight;
@property (nonatomic,strong)UIButton *leftB;
@property (nonatomic,strong)UIButton *rightB;
@property (nonatomic,strong)Skill *skill;
@property (nonatomic,strong)UIView *leftV;
@property (nonatomic,strong)UIView *rightV;
@property (nonatomic,copy)NSString *alphaStr;
@end
