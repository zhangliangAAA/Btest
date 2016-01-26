//
//  likeCell.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "likeCell.h"
#import "UIImageView+WebCache.h"

@interface likeCell ()
@property (nonatomic,strong)UIImageView *aimageV;
@property (nonatomic,strong)UIImageView *bimageV;
@property (nonatomic,strong)UILabel *alabel;
@property (nonatomic,strong)UILabel *blabel;
@end

@implementation likeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kWithd-20, 30)];
        self.titleLabel.textColor = [UIColor orangeColor];
        self.titleLabel.text = @"最佳搭档";
        [self.contentView addSubview:self.titleLabel];
        
        self.aimageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 35, 40, 40)];
        [self.contentView addSubview:_aimageV];
        self.alabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 35, kWithd-65, 50)];
        _alabel.font = [UIFont systemFontOfSize:13];
        _alabel.textColor = [UIColor whiteColor];
        _alabel.numberOfLines = 0;
        [self.contentView addSubview:_alabel];
        
        self.bimageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, _alabel.frame.origin.y+_alabel.bounds.size.height+10, 40, 40)];
        [self.contentView addSubview:_bimageV];
        self.blabel = [[UILabel alloc] initWithFrame:CGRectMake(60, _alabel.frame.origin.y+_alabel.bounds.size.height, kWithd-65, 50)];
        _blabel.font = [UIFont systemFontOfSize:13];
        _blabel.textColor = [UIColor whiteColor];
        _blabel.numberOfLines = 0;
        [self.contentView addSubview:_blabel];
        
//        self.hideButton = [UIButton buttonWithType:UIButtonTypeSystem];
//        [self.hideButton setTitle:@"点击更多" forState:UIControlStateNormal];
//        self.hideButton.frame = CGRectMake(100, self.frame.origin.y+self.bounds.size.height, kWithd-200, 25);
//        [self.contentView addSubview:self.hideButton];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (void)setArray:(NSArray *)array
{
    _array = array;
    
    NSDictionary *dict1 = array[0];
    NSDictionary *dict2 = array[1];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",dict1[@"partner"]]];
    [self.aimageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
    self.alabel.text = dict1[@"des"];
    [self.alabel sizeToFit];
    self.alabel.frame = CGRectMake(60, 35, kWithd-65, self.alabel.bounds.size.height);
    
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",dict2[@"partner"]]];
    [self.bimageV sd_setImageWithURL:url2 placeholderImage:[UIImage imageNamed:@"3"]];
    self.bimageV.frame = CGRectMake(10,15+ _alabel.frame.origin.y+_alabel.bounds.size.height, 40, 40);
    self.blabel.text = dict2[@"des"];
    [self.blabel sizeToFit];
    self.blabel.frame = CGRectMake(60,15+ _alabel.frame.origin.y+_alabel.bounds.size.height, kWithd-65, self.blabel.bounds.size.height);
    
    self.roeHeight = self.alabel.frame.origin.y +self.alabel.bounds.size.height+self.blabel.bounds.size.height+10;
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
