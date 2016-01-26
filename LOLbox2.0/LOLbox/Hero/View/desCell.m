//
//  desCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "desCell.h"

@interface desCell ()
@property (nonatomic,strong)UILabel *desLabel;
@end

@implementation desCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.desLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kWithd-20, 50)];
        self.desLabel.numberOfLines = 0;
        self.desLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.desLabel];
        
        self.openButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.openButton setTitle:@"点击查看背景故事" forState:UIControlStateNormal];
        self.openButton.frame = CGRectMake(kWithd/2-80, 15, 160, 25);
        [self.contentView addSubview:self.openButton];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return  self;
}

- (void)setDes:(NSString *)des
{
    _des = des;
    self.desLabel.text = des;
    [self.desLabel sizeToFit];
    self.desLabel.frame = CGRectMake(10, 5, kWithd-20, self.desLabel.bounds.size.height);
    self.openButton.frame = CGRectMake(kWithd/2-80, self.desLabel.bounds.size.height+5, 160, 25);
    self.rowHeight = self.desLabel.bounds.size.height+45;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
