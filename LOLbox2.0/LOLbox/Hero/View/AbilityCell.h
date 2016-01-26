//
//  AbilityCell.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbilityCell : UITableViewCell
@property (nonatomic,strong)UILabel *abilityL;
@property (nonatomic,copy)NSString *abilityName;

@property (nonatomic,assign)int grade;
@property (nonatomic,copy)NSString *myBase;
@property (nonatomic,copy)NSString *myLevel;
@property (nonatomic,copy)NSString *enemyBase;
@property (nonatomic,copy)NSString *enemyLevel;

@property (nonatomic,strong)UILabel *myValue;
@property (nonatomic,strong)UILabel *signLabel;
@property (nonatomic,strong)UILabel *enemyValue;


@end
