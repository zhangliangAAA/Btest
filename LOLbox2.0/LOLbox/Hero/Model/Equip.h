//
//  Equip.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Equip : NSObject

@property (nonatomic,copy)NSString *title;//标题
@property (nonatomic,copy)NSString *author;//作者
@property (nonatomic,copy)NSString *server;//大区
@property (nonatomic,copy)NSString *combat;//战力
@property (nonatomic,copy)NSString *skill;//技能加点
@property (nonatomic,copy)NSString *pre_cz;//前期装备id
@property (nonatomic,copy)NSString *pre_explain;//前期说明
@property (nonatomic,copy)NSString *mid_cz;//中期出装id
@property (nonatomic,copy)NSString *mid_explain;//中期说明
@property (nonatomic,copy)NSString *end_cz;//后期出装id+列表id
@property (nonatomic,copy)NSString *end_explain;//后期说明
@property (nonatomic,copy)NSString *nf_cz;//逆风出装id
@property (nonatomic,copy)NSString *nf_explain;//逆风说明


@end
