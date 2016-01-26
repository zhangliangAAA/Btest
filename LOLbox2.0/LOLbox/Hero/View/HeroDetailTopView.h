//
//  HeroDetailTopView.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface HeroDetailTopView : UIView

@property (nonatomic,strong)Hero *hero; //配制信息
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *pirceLabel;
@property (nonatomic,strong)UILabel *ratLabel;

@property (nonatomic,strong)UIButton *compareButton;
@property (nonatomic,strong)UIButton *giftButton;


@end
