//
//  EquipCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipCell.h"
#import "UIImageView+WebCache.h"

@interface EquipCell ()

@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *servLabel;
@property (nonatomic,strong)UILabel *autorLabel;
@property (nonatomic,strong)UIImageView *view1;
@property (nonatomic,strong)UIImageView *view2;
@property (nonatomic,strong)UIImageView *view3;
@property (nonatomic,strong)UIImageView *view4;
@property (nonatomic,strong)UIImageView *view5;
@property (nonatomic,strong)UIImageView *view6;
@property (nonatomic,strong)NSArray *viewArr;
@end

@implementation EquipCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kWithd-50, 30)];
        self.titleLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.servLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 60, 25)];
        self.servLabel.font = [UIFont systemFontOfSize:14];
        self.servLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.servLabel];
        
        self.autorLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/2-40, 35, kWithd/2, 25)];
        self.autorLabel.font = [UIFont systemFontOfSize:14];
        self.autorLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.autorLabel];
        
        self.view1 = [[UIImageView alloc] init];
        self.view2 = [[UIImageView alloc] init];
        self.view3 = [[UIImageView alloc] init];
        self.view4 = [[UIImageView alloc] init];
        self.view5 = [[UIImageView alloc] init];
        self.view6 = [[UIImageView alloc] init];
        self.viewArr = @[_view1,_view2,_view3,_view4,_view5,_view6];
        for (int i=0; i<6; i++) {
            UIImageView *imageV = self.viewArr[i];
            imageV.frame = CGRectMake(10+60*i, 65, 50, 50);
            [self.contentView addSubview:imageV];
        }
        
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}


- (void)setEquip:(Equip *)equip
{
    _equip = equip;
    self.titleLabel.text = equip.title;
    self.servLabel.text = equip.server;
    self.autorLabel.text = equip.author;
    NSArray *idArr = [equip.end_cz componentsSeparatedByString:@","];
    for (int i=0; i<idArr.count; i++) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",idArr[i]]];
        UIImageView *imageV = self.viewArr[i];
        [imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
