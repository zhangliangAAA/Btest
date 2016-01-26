//
//  TeamCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TeamCell.h"
#import "UIImageView+WebCache.h"



@interface TeamCell ()
@property (nonatomic,strong)UILabel *titleL;
@property (nonatomic,strong)UILabel *desL;
@property (nonatomic,strong)NSArray *imageVarr;
@property (nonatomic,strong)UIImageView *imageV1;
@property (nonatomic,strong)UIImageView *imageV2;
@property (nonatomic,strong)UIImageView *imageV3;
@property (nonatomic,strong)UIImageView *imageV4;
@property (nonatomic,strong)UIImageView *imageV5;
@end

@implementation TeamCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, kWithd-10, 30)];
        self.titleL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleL];
        
        self.imageV1 = [[UIImageView alloc] init];
        self.imageV2 = [[UIImageView alloc] init];
        self.imageV3 = [[UIImageView alloc] init];
        self.imageV4 = [[UIImageView alloc] init];
        self.imageV5 = [[UIImageView alloc] init];
        self.imageVarr = @[_imageV1,_imageV2,_imageV3,_imageV4,_imageV5];
        
        for (int i=0; i<_imageVarr.count; i++) {
            UIImageView *imageV = _imageVarr[i];
            imageV.frame = CGRectMake(5+i*kWithd/5, 35, kWithd/6, kWithd/6);
            [self.contentView addSubview:imageV];
        }
        
        self.desL = [[UILabel alloc] initWithFrame:CGRectMake(5, 35+kWithd/6, kWithd-10, 65)];
        self.desL.textColor = [UIColor whiteColor];
        self.desL.font = [UIFont systemFontOfSize:14];
        self.desL.numberOfLines = 0;
        [self.contentView addSubview:self.desL];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (void)setTem:(Team *)tem
{
    _tem = tem;
    self.titleL.text = tem.title;
    self.desL.text = tem.des;
    NSArray *arr = @[tem.hero1,tem.hero2,tem.hero3,tem.hero4,tem.hero5];
    for (int i=0; i<arr.count; i++) {
        UIImageView *imageV = self.imageVarr[i];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",arr[i]]];
        [imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
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
