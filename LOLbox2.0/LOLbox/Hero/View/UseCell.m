//
//  UseCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UseCell.h"

@interface UseCell ()
@property (nonatomic,strong)UILabel *showLabel;
@end

@implementation UseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 50, 30)];
        self.titleLabel.textColor = [UIColor orangeColor];
        self.titleLabel.text = @"使用";
        [self.contentView addSubview:self.titleLabel];
        
        self.showLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, kWithd-20, 50)];
        self.showLabel.numberOfLines = 0;
        self.showLabel.font = [UIFont systemFontOfSize:13];
        self.showLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.showLabel];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (void)setShow:(NSString *)show
{
    _show = show;
    self.showLabel.text = show;
    [self.showLabel sizeToFit];
    self.showLabel.frame = CGRectMake(10, 40, kWithd-15, self.showLabel.bounds.size.height);
    self.roeHeight = self.showLabel.frame.origin.y + self.showLabel.bounds.size.height;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
