//
//  MyHeroCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MyHeroCell.h"
#import "UIImageView+WebCache.h"
@implementation MyHeroCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.myImageView = [[UIImageView alloc] init];
        self.myImageView.frame = CGRectMake(0, 0, 80, 80);
        [self.contentView addSubview:self.myImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(82, 10, 120, 25)];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.cnNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 10, 80, 25)];
        self.cnNameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cnNameLabel];
        
        self.perTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(82, 40, 80, 25)];
        self.perTimesLabel.textColor = [UIColor greenColor];
        [self.contentView addSubview:self.perTimesLabel];
        
    }
    return self;
}

- (void)configureCellWithModel:(Hero *)hero
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",hero.enName]];
    [self.myImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
    self.titleLabel.text = hero.title;
    self.cnNameLabel.text = hero.cnName;
    self.perTimesLabel.text = [NSString stringWithFormat:@"场次%@",hero.presentTimes];
    
    
    
}

@end
