//
//  kaelSkillDetailViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/21.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "kaelSkillDetailViewController.h"

@interface kaelSkillDetailViewController ()

@end

@implementation kaelSkillDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 105, 80, 80)];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",self.skill.number]];
    [imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
    [self.basicV addSubview:imageV];
    
    UILabel *nameL = [[UILabel alloc] initWithFrame:CGRectMake(100, 105, 100, 30)];
    nameL.textColor = [UIColor whiteColor];
    nameL.text = self.skill.name;
    [self.basicV addSubview:nameL];
    
    UILabel *classL = [[UILabel alloc] initWithFrame:CGRectMake(100, 135, 120, 25)];
    classL.textColor = [UIColor whiteColor];
    classL.text = [NSString stringWithFormat:@"需要等级: %@级",self.skill.level];
    [self.basicV addSubview:classL];
    
    UILabel *coolL = [[UILabel alloc] initWithFrame:CGRectMake(100, 160, 150, 25)];
    coolL.textColor = [UIColor whiteColor];
    coolL.text = [NSString stringWithFormat:@"冷却时间: %@s",self.skill.cooldown];
    [self.basicV addSubview:coolL];
    
    UILabel *desL = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, kWithd-20, 90)];
    desL.numberOfLines = 0;
    desL.textColor = [UIColor whiteColor];
    desL.text = [NSString stringWithFormat:@"描述:\n%@",self.skill.des];
    [desL sizeToFit];
    [self.basicV addSubview:desL];
    
    UILabel *tipL = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+desL.frame.origin.y+desL.bounds.size.height, kWithd-20, 20)];
    tipL.numberOfLines = 0;
    tipL.textColor = [UIColor whiteColor];
    tipL.text = [NSString stringWithFormat:@"提示:\n%@",self.skill.tips];
    [tipL sizeToFit];
    [self.basicV addSubview:tipL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
