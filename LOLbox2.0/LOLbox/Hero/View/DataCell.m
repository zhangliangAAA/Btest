//
//  DataCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "DataCell.h"

@implementation DataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 75, 30)];
        _gradeLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.gradeLabel];
        
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake(95, 5, kWithd-135, 30)];
        self.slider.minimumValue = 1;
        self.slider.maximumValue = 18;
        [self.contentView addSubview:self.slider];
        
        self.rangeLabel = [[UILabel alloc] init];
        self.moveLabel = [[UILabel alloc] init];
        self.attLabel = [[UILabel alloc] init];
        self.armorLabel = [[UILabel alloc] init];
        self.manaLabel = [[UILabel alloc] init];
        self.healthLabel = [[UILabel alloc] init];
        self.critiLabel = [[UILabel alloc] init];
        self.manaRegenLabel = [[UILabel alloc] init];
        self.healthRegenLabel = [[UILabel alloc] init];
        self.magicLabel = [[UILabel alloc] init];
        
        NSArray *arr = @[_rangeLabel,_moveLabel,_attLabel,_armorLabel,_manaLabel,_healthLabel,_critiLabel,_manaRegenLabel,_healthRegenLabel,_magicLabel];
        for (int i=0; i<arr.count; i++) {
            UILabel *label = arr[i];
            label.frame = CGRectMake(15, 40+i*30, kWithd-30, 25);
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = [UIColor whiteColor];
            [self.contentView addSubview:label];
        }
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (void)setGrade:(int)grade
{
    self.gradeLabel.text = [NSString stringWithFormat:@"等级: %d",grade];
    
    self.rangeLabel.text = [NSString stringWithFormat:@"攻击距离: %@",self.HD.range];
    self.moveLabel.text = [NSString stringWithFormat:@"移动速度: %@",self.HD.moveSpeed];
    self.attLabel.text = [NSString stringWithFormat:@"基础伤害: %.2f(%@)",[self.HD.attackBase floatValue] + grade * [self.HD.attackLevel floatValue],self.HD.attackLevel];
    self.armorLabel.text = [NSString stringWithFormat:@"基础防御: %.2f(%@)",[self.HD.armorBase floatValue]+[self.HD.armorLevel floatValue]*grade,self.HD.armorLevel];
    self.manaLabel.text = [NSString stringWithFormat:@"基础魔法值: %.2f(%@)",[self.HD.manaBase floatValue]+[self.HD.manaLevel floatValue]*grade,self.HD.manaLevel];
    self.healthLabel.text = [NSString stringWithFormat:@"基础生命值: %.2f(%@)",[self.HD.healthBase floatValue]+[_HD.healthLevel floatValue]*grade,_HD.healthLevel];
    self.critiLabel.text = [NSString stringWithFormat:@"暴击几率: %.2f(%@)",[_HD.criticalChanceBase floatValue]+[_HD.criticalChanceLevel floatValue]*grade,_HD.criticalChanceLevel];
    self.manaRegenLabel.text = [NSString stringWithFormat:@"魔法恢复: %.2f(%@)",[_HD.manaRegenBase floatValue]+[_HD.manaRegenLevel floatValue]*grade,_HD.manaRegenLevel];
    self.healthRegenLabel.text = [NSString stringWithFormat:@"生命恢复: %.2f(%@)",[_HD.healthRegenBase floatValue]+[_HD.healthRegenLevel floatValue]*grade,_HD.healthRegenLevel];
    self.magicLabel.text = [NSString stringWithFormat:@"魔法抗性: %.2f(%@)",[_HD.magicResistBase floatValue]+[_HD.magicResistLevel floatValue]*grade,_HD.magicResistLevel];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
