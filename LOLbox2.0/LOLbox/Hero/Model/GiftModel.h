//
//  GiftModel.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GiftModel : NSObject

@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *fuPic;//符文网址 图片
@property (nonatomic,copy)NSString *fuDes;//符文描述
@property (nonatomic,copy)NSString *tianPic;//天赋网址 图片
@property (nonatomic,copy)NSString *tianDes;//天赋描述
@property (nonatomic,copy)NSString *des;//描述

@end
