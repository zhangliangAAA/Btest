//
//  CompareSkillCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CompareSkillCell.h"

@interface CompareSkillCell ()


@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *desLabel;
@property (nonatomic,strong)UILabel *costLabel;
@property (nonatomic,strong)UILabel *coolLabel;
@property (nonatomic,strong)UILabel *rangeLabel;
@property (nonatomic,strong)UILabel *effectLabel;
@end

@implementation CompareSkillCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.leftB = [[UIButton alloc] initWithFrame:CGRectMake(kWithd/2-40-20, 10, 40, 40)];
        [self.contentView addSubview:self.leftB];
        self.leftV = [[UIView alloc] initWithFrame:CGRectMake(kWithd/2-40-20, 10, 40, 40)];
        self.leftV.backgroundColor = [UIColor grayColor];
        self.leftV.alpha = 0.65;
        self.leftV.userInteractionEnabled = NO;
        [self.contentView addSubview:self.leftV];
        
        self.rightB = [[UIButton alloc] initWithFrame:CGRectMake(kWithd/2+20, 10, 40, 40)];
        [self.contentView addSubview:self.rightB];
        self.rightV = [[UIView alloc] initWithFrame:CGRectMake(kWithd/2+20, 10, 40, 40)];
        self.rightV.backgroundColor = [UIColor grayColor];
        self.rightV.alpha = 0.65;
        self.rightV.userInteractionEnabled = NO;
        [self.contentView addSubview:self.rightV];

        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 150, 30)];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.text = @"被动";
        [self.contentView addSubview:self.titleLabel];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, kWithd/4, 30)];
        self.nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameLabel];
        
        self.desLabel = [[UILabel alloc] init];
        self.desLabel.font = [UIFont systemFontOfSize:14];
        self.desLabel.numberOfLines = 0;
        self.desLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.desLabel];
        
        self.costLabel = [[UILabel alloc] init];
        self.costLabel.font = [UIFont systemFontOfSize:14];
        self.costLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.costLabel];
        
        self.coolLabel = [[UILabel alloc] init];
        self.coolLabel.font = [UIFont systemFontOfSize:14];
        self.coolLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.coolLabel];
        
        self.rangeLabel = [[UILabel alloc] init];
        self.rangeLabel.font = [UIFont systemFontOfSize:14];
        self.rangeLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.rangeLabel];
        
        self.effectLabel = [[UILabel alloc] init];
        self.effectLabel.font = [UIFont systemFontOfSize:14];
        self.effectLabel.numberOfLines = 0;
        self.effectLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.effectLabel];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.desLabel.frame = CGRectMake(10, 80, kWithd-20, self.desLabel.bounds.size.height);
    self.costLabel.frame = CGRectMake(10, self.desLabel.frame.origin.y+self.desLabel.bounds.size.height, kWithd-20, 30);
    self.coolLabel.frame = CGRectMake(10, self.costLabel.frame.origin.y+30, kWithd-20, 30);
    self.rangeLabel.frame = CGRectMake(10, self.coolLabel.frame.origin.y+30, kWithd-20, 30);
    self.effectLabel.frame = CGRectMake(10, self.rangeLabel.frame.origin.y+30, kWithd-20, self.effectLabel.bounds.size.height);
    self.rowHeight = self.effectLabel.frame.origin.y + self.effectLabel.bounds.size.height+15;

}

- (void)setSkill:(Skill *)skill
{
    _skill = skill;
    self.nameLabel.text = skill.name;
    self.desLabel.text = [NSString stringWithFormat:@"描述:%@",skill.descript];
    [self.desLabel sizeToFit];
    self.costLabel.text = [NSString stringWithFormat:@"消耗:%@",skill.cost];
    self.coolLabel.text = [NSString stringWithFormat:@"冷却:%@",skill.cooldown];
    self.rangeLabel.text = [NSString stringWithFormat:@"范围:%@",skill.range];
    self.effectLabel.text = [NSString stringWithFormat:@"效果:%@",skill.effect];
    [self.effectLabel sizeToFit];
    [self layoutSubviews];
}

- (void)setAlphaStr:(NSString *)alphaStr
{
    _alphaStr = alphaStr;
    if ([alphaStr isEqualToString:@"1"]) {
        self.leftV.alpha = 0;
        self.rightV.alpha = 0.65;
    }else if([alphaStr isEqualToString:@"0"]){
        self.leftV.alpha = 0.65;
        self.rightV.alpha = 0;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
