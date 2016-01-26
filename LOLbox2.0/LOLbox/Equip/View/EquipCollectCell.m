//
//  EquipCollectCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipCollectCell.h"

@implementation EquipCollectCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWithd/5, kWithd/5)];
        [self.contentView addSubview:self.imageV];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kWithd/5, kWithd/5, 25)];
        self.nameLabel.font = [UIFont systemFontOfSize:13];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameLabel];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
    }
    return self;
}

@end
