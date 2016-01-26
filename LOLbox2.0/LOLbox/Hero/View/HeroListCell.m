//
//  HeroListCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UIColor+AddColor.h"
#import "HeroListCell.h"
#import "UIImageView+WebCache.h"

@implementation HeroListCell

// 重写initWithFrame
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWithd/4-5, kWithd/4-5)];
        [self.contentView addSubview:self.myImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/4-5, 1, kWithd/4-5, 25)];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.cnNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/4-5, 28, kWithd/4-5, 25)];
        self.cnNameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cnNameLabel];
        
        self.locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/4-5, 55, kWithd/4-5, 25)];
        self.locationLabel.textColor = [UIColor greenColor];
        
        [self.contentView addSubview:self.locationLabel];
    }
    return self;
}

- (void)configureCellWithModel:(Hero *)hero
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",hero.enName]];
    [self.myImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    self.titleLabel.text = hero.title;
    self.cnNameLabel.text = hero.cnName;
    self.locationLabel.text = hero.location;
}

@end
