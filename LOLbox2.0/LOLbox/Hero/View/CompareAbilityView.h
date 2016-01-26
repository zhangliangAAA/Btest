//
//  CompareAbilityView.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetail.h"

@interface CompareAbilityView : UIView

@property (nonatomic,assign)int grad;
@property (nonatomic,strong)UISlider *slider;
@property (nonatomic,strong)UITableView *myTV;

@property (nonatomic,strong)HeroDetail *myHD;
@property (nonatomic,strong)HeroDetail *enemyHD;

@end
