//
//  GiftListCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GiftListCell.h"

@implementation GiftListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.myImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 80, 80)];
        [self.contentView addSubview:self.myImageV];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 150, 30)];
        self.nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameLabel];
        
        self.lev1Label = [[UILabel alloc] init];
        self.lev2Label = [[UILabel alloc] init];
        self.lev3Label = [[UILabel alloc] init];
        NSArray *arr = @[self.lev1Label,self.lev2Label,self.lev3Label];
        for (int i=0; i<3; i++) {
            UILabel *label = arr[i];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:14];
            label.frame = CGRectMake(100, 35+i*30, kWithd-110, 25);
            [self.contentView addSubview:label];
        }
        
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
