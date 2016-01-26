//
//  MainView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MainView.h"
#import "UIColor+AddColor.h"
@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWithd, kHeight/2)];
        imageView.image = [UIImage imageNamed:@"main2.jpg"];
        [self addSubview:imageView];
        
        self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(15, kHeight/2+20, kWithd/4, kWithd/4)];
        _button1.layer.cornerRadius = kWithd/8;
        _button1.layer.masksToBounds = YES;
        [_button1 setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, kWithd/4-15, kWithd/4, 15)];
        label1.text = @"英雄";
        label1.textColor = [UIColor whiteColor];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.backgroundColor = [UIColor shenhuiseColor];
        label1.alpha = 0.7;
        
        [_button1 addSubview:label1];
        [self addSubview:_button1];
        
        
        self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(kWithd*3/4-15, kHeight/2+20, kWithd/4, kWithd/4)];
        _button2.layer.cornerRadius = kWithd/8;
        _button2.layer.masksToBounds = YES;
        [_button2 setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, kWithd/4-15, kWithd/4, 15)];
        label2.text = @"装备";
        label2.textColor = [UIColor whiteColor];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.backgroundColor = [UIColor shenhuiseColor];
        label2.alpha = 0.7;
        [_button2 addSubview:label2];
        [self addSubview:_button2];
        
        
        
        
        self.button3 = [[UIButton alloc] initWithFrame:CGRectMake(kWithd/2-kWithd/8, kHeight-kWithd/4-35, kWithd/4, kWithd/4)];
        _button3.layer.cornerRadius = kWithd/8;
        _button3.layer.masksToBounds = YES;
        [_button3 setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, kWithd/4-15, kWithd/4, 15)];
        label3.text = @"资料";
        label3.textColor = [UIColor whiteColor];
        label3.textAlignment = NSTextAlignmentCenter;
        label3.backgroundColor = [UIColor shenhuiseColor];
        label3.alpha = 0.7;
        [_button3 addSubview:label3];
        [self addSubview:_button3];
        
        
        
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
