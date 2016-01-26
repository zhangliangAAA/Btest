//
//  Skill.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Skill : NSObject

@property (nonatomic,copy)NSString *cooldown;
@property (nonatomic,copy)NSString *cost;
@property (nonatomic,copy)NSString *descript;
@property (nonatomic,copy)NSString *effect;
@property (nonatomic,copy)NSString *skillId;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *range;

@end
