//
//  Skill.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "Skill.h"

@implementation Skill

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.skillId = value;
    }else if ([key isEqualToString:@"description"]){
        self.descript = value;
    }
}

@end
