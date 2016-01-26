//
//  ChoseHeroViewController.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BasicViewController.h"

@interface ChoseHeroViewController : BasicViewController
#pragma mark-Block传值
// 1.声明block属性
@property (nonatomic,copy) void (^choseHero)(NSString *name);

@end
