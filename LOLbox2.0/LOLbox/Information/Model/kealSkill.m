//
//  kealSkill.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "kealSkill.h"

@implementation kealSkill

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.number = value;
    }
}

@end
