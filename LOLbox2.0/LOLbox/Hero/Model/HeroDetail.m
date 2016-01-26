//
//  HeroDetail.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetail.h"

@implementation HeroDetail


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.nameid = value;
    }else if ([key isEqualToString:@"description"]){
        self.description1 = value;
    }else if ([key isEqualToString:[NSString stringWithFormat:@"%@_B",self.enName]]){
        self.Skill_B = [[Skill alloc] init];
        [self.Skill_B setValuesForKeysWithDictionary:value];
    }else if ([key isEqualToString:[NSString stringWithFormat:@"%@_Q",self.enName]]){
        self.Skill_Q = [[Skill alloc] init];
        [self.Skill_Q setValuesForKeysWithDictionary:value];
    }else if ([key isEqualToString:[NSString stringWithFormat:@"%@_W",self.enName]]){
        self.Skill_W = [[Skill alloc] init];
        [self.Skill_W setValuesForKeysWithDictionary:value];
    }else if ([key isEqualToString:[NSString stringWithFormat:@"%@_E",self.enName]]){
        self.Skill_E = [[Skill alloc] init];
        [self.Skill_E setValuesForKeysWithDictionary:value];
    }else if ([key isEqualToString:[NSString stringWithFormat:@"%@_R",self.enName]]){
        self.Skill_R = [[Skill alloc] init];
        [self.Skill_R setValuesForKeysWithDictionary:value];
    }


}

@end
