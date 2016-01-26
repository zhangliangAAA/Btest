//
//  BasicView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BasicView.h"

@implementation BasicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWithd,100)];
        imageView.image = [UIImage imageNamed:@"main.jpg"];
        imageView.userInteractionEnabled = YES;
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.backButton setImage:[UIImage imageNamed:@"small"] forState:UIControlStateNormal];
        self.backButton.frame = CGRectMake(25, 35, 40, 35);
        [imageView addSubview:_backButton];
        [self addSubview:imageView];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        imageView.userInteractionEnabled = YES;
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
