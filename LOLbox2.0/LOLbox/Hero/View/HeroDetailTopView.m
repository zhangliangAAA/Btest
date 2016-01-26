//
//  HeroDetailTopView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "HeroDetailTopView.h"

@interface HeroDetailTopView ()

@end


@implementation HeroDetailTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        self.imageView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.imageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 150, 25)];
        self.nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.nameLabel];
        
        self.pirceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 35, 150, 20)];
        self.pirceLabel.textColor = [UIColor whiteColor];
        self.pirceLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.pirceLabel];
        
        self.ratLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 150, 20)];
        self.ratLabel.textColor = [UIColor whiteColor];
        self.ratLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.ratLabel];
        
        self.compareButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.compareButton.frame = CGRectMake(3*kWithd/4-5, 10, kWithd/4-10, 30);
        [self.compareButton setTitle:@"英雄对比" forState:UIControlStateNormal];
        self.compareButton.layer.cornerRadius = 8;
        self.compareButton.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.compareButton];
        
        self.giftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.giftButton.frame = CGRectMake(3*kWithd/4-5, 50, kWithd/4-10, 30);
        [self.giftButton setTitle:@"天赋符文" forState:UIControlStateNormal];
        self.giftButton.layer.cornerRadius = 8;
        self.giftButton.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.giftButton];
        
        
    }
    return self;
}

- (void)setHero:(Hero *)hero
{
    _hero = hero;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",hero.enName]];
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
    self.nameLabel.text = hero.cnName;
    NSArray *arr = [hero.price componentsSeparatedByString:@","];
    self.pirceLabel.text = [NSString stringWithFormat:@"金:%@,券:%@",arr[0],arr[1]];
    NSArray *arr2 = [hero.rating componentsSeparatedByString:@","];
    self.ratLabel.text = [NSString stringWithFormat:@"攻:%@ 防:%@ 法:%@ 难度:%@",arr2[0],arr2[1],arr2[2],arr2[3]];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
