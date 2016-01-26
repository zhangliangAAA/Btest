//
//  HeroDetailViewController.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BasicViewController.h"
#import "HeroDetailTopView.h"
#import "HeroDetailView.h"
#import "Hero.h"

@interface HeroDetailViewController : BasicViewController
@property (nonatomic,strong)HeroDetailTopView *topView;
@property (nonatomic,strong)Hero *hero;
@property (nonatomic,strong)UISegmentedControl *segCtrl;
@end
