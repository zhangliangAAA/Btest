//
//  SkillCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillCell.h"
#import "UIButton+WebCache.h"

@interface SkillCell ()
@property (nonatomic,strong)NSArray *buttonArr;

@end

@implementation SkillCell

#pragma mark- 如果用系统重用池 Cell需要重写此方法:
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kWithd/2, 30)];
        aLabel.text = @"技能说明";
        aLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:aLabel];
        
        self.buttonB = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonQ = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonW = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonE = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonR = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonArr = @[self.buttonB,self.buttonQ,self.buttonW,self.buttonE,self.buttonR];
        
        self.viewB = [[UIView alloc] init];
        self.viewQ = [[UIView alloc] init];
        self.viewW = [[UIView alloc] init];
        self.viewE = [[UIView alloc] init];
        self.viewR = [[UIView alloc] init];
        self.viewArr = @[self.viewB,self.viewQ,self.viewW,self.viewE,self.viewR];
        
        for (int i=0; i<5; i++) {
            UIButton *button = _buttonArr[i];
            UIView *view = _viewArr[i];
            button.tag = 2000+i;
            button.frame = CGRectMake(10+i*kWithd/5.5, 40, kWithd/7, kWithd/7);
            [self.contentView addSubview:button];
            view.frame = CGRectMake(0,0, kWithd/7, kWithd/7);
            view.backgroundColor = [UIColor grayColor];
            view.userInteractionEnabled = NO; //取消view的用户交互
            view.alpha = 0.5;
            [button addSubview:view];
            [self.contentView addSubview:button];
            button.backgroundColor = [UIColor purpleColor];
        }
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40+kWithd/7, 200, 25)];
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameLabel];
        
        self.descriptLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 65+kWithd/7, kWithd-20, 50)];
        self.descriptLabel.numberOfLines = 0;
        self.descriptLabel.textColor = [UIColor whiteColor];
        self.descriptLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.descriptLabel];
        
        self.costLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, kWithd/7+80+self.descriptLabel.bounds.size.height, kWithd-10, 25)];
        self.costLabel.textColor = [UIColor whiteColor];
        self.costLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.costLabel];
        
        self.coolLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.costLabel.frame.origin.y + 35, kWithd-10, 25)];
        self.coolLabel.textColor = [UIColor whiteColor];
        self.coolLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.coolLabel];

        self.rangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.coolLabel.frame.origin.y + 35, kWithd-10, 25)];
        self.rangeLabel.textColor = [UIColor whiteColor];
        self.rangeLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.rangeLabel];
        
        self.effectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.rangeLabel.frame.origin.y + 35, kWithd-20, 25)];
        self.effectLabel.numberOfLines = 0;
        self.effectLabel.textColor = [UIColor whiteColor];
        self.effectLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.effectLabel];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (void)setSkill:(Skill *)skill
{
    _skill = skill;
    self.nameLabel.text = skill.name;
    self.descriptLabel.text = [NSString stringWithFormat:@"描述:   %@",skill.descript];
    [self.descriptLabel sizeToFit];
//  label.text赋值后才能改变自身的Frame(以他为参照物的其他Frame也要改变)
    self.costLabel.frame = CGRectMake(10, kWithd/7+80+self.descriptLabel.bounds.size.height, kWithd-10, 25);
    self.costLabel.text = [NSString stringWithFormat:@"消耗:   %@",skill.cost];
    
    self.coolLabel.frame = CGRectMake(10, self.costLabel.frame.origin.y + 35, kWithd-10, 25);
    self.coolLabel.text = [NSString stringWithFormat:@"冷却:   %@",skill.cooldown];
    
    self.rangeLabel.frame = CGRectMake(10, self.coolLabel.frame.origin.y + 35, kWithd-10, 25);
    self.rangeLabel.text = [NSString stringWithFormat:@"范围:   %@",skill.range];
    
    self.effectLabel.text = [NSString stringWithFormat:@"效果:   %@",skill.effect];
    [self.effectLabel sizeToFit];
    self.effectLabel.frame = CGRectMake(10, self.rangeLabel.frame.origin.y + 35, kWithd-10, self.effectLabel.bounds.size.height);
    // 定义成属性,作为返回Cell的高度
    self.rowHeight = self.effectLabel.frame.origin.y+self.effectLabel.bounds.size.height;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
