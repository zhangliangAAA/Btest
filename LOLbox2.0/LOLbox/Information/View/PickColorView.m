//
//  PickColorView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "PickColorView.h"

@implementation PickColorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.redB = [UIButton buttonWithType:UIButtonTypeSystem];
        self.redB.backgroundColor = [UIColor redColor];
        self.bluB = [UIButton buttonWithType:UIButtonTypeSystem];
        self.bluB.backgroundColor = [UIColor blueColor];
        self.yelB = [UIButton buttonWithType:UIButtonTypeSystem];
        self.yelB.backgroundColor = [UIColor yellowColor];
        self.purB = [UIButton buttonWithType:UIButtonTypeSystem];
        self.purB.backgroundColor = [UIColor purpleColor];
        
        self.buttonArr = @[self.redB,self.bluB,self.yelB,self.purB];
        NSArray *arr = @[@"红色",@"蓝色",@"黄色",@"紫色"];
        for (int i=0; i<self.buttonArr.count; i++) {
            UIButton *bt = self.buttonArr[i];
            [bt setTitle:arr[i] forState:UIControlStateNormal];
            bt.tag = 2200+i;
            bt.frame = CGRectMake(0, i*30, frame.size.width, 25);
            [self addSubview:bt];
        }
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
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
