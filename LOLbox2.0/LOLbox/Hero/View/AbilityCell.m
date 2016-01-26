//
//  AbilityCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AbilityCell.h"

@interface AbilityCell ()



@end

@implementation AbilityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.abilityL = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
        self.abilityL.textColor = [UIColor whiteColor];
        self.abilityL.text = self.abilityName;
        [self.contentView addSubview:self.abilityL];
        
        self.myValue = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/2-80, 5, 100, 30)];
        self.myValue.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.myValue];
        
        self.signLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/2+30, 5, 15, 30)];
        self.signLabel.font = [UIFont systemFontOfSize:22];
        [self.contentView addSubview:self.signLabel];
        
        self.enemyValue = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/2+65, 5, 100, 30)];
        self.enemyValue.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.enemyValue];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
