//
//  KealSkillCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "KealSkillCell.h"

@implementation KealSkillCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWithd/5, kWithd/5)];
        [self.contentView addSubview:self.imageV];
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kWithd/5, kWithd/5, 30)];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameLabel];
        
    }
    return self;
}

- (void)setSkill:(kealSkill *)skill
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",skill.number]];
    [self.imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
    self.nameLabel.text = skill.name;
}

@end
