//
//  EquipDetailViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipDetailViewController.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"


@interface EquipDetailViewController ()

@property (nonatomic,strong)UIImageView *imageV;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UILabel *sellLabel;
@property (nonatomic,strong)UILabel *allLabel;
@property (nonatomic,strong)UILabel *desLabel;

@end

@implementation EquipDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 120, kWithd/3, kWithd/3)];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",self.number]];
    [self.imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
    [self.view addSubview:self.imageV];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/3+30, 125, 2*kWithd/3-20, 25)];
    self.nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.nameLabel];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/3+30, 155, 2*kWithd/3-20, 25)];
    self.priceLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.priceLabel];
    
    self.sellLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/3+30, 185, 2*kWithd/3-20, 25)];
    self.sellLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.sellLabel];
    
    self.allLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/3+30, 215, 2*kWithd/3-20, 25)];
    self.allLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.allLabel];
    
    UILabel *needLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 120+kWithd/3, 120, 30)];
    needLabel.textColor = [UIColor whiteColor];
    needLabel.text = @"合成所需";
    [self.view addSubview:needLabel];
    
    self.desLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 155+kWithd/2, kWithd-20, kHeight/3)];
    self.desLabel.numberOfLines = 0;
    self.desLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.desLabel];
    
    
    
    [self handlerDetailData];
}

- (void)handlerDetailData
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiItemDetail.php?id=%@",self.number] completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.nameLabel.text = [NSString stringWithFormat:@"名称:%@",dict[@"name"]];
        [dict[@"price"] integerValue];
        self.priceLabel.text = [NSString stringWithFormat:@"购买价格:%ld",(unsigned long)[dict[@"price"] integerValue]];
        self.sellLabel.text = [NSString stringWithFormat:@"出售价格:%ld",(unsigned long)[dict[@"sellPrice"] integerValue]];
        self.allLabel.text = [NSString stringWithFormat:@"合成价格:%ld",(unsigned long)[dict[@"allPrice"] integerValue]];
        self.desLabel.text = [NSString stringWithFormat:@"描述:%@",dict[@"description"]];
        self.desLabel.frame = CGRectMake(10, 155+kWithd/2, kWithd-20, self.desLabel.bounds.size.height);
        NSString *str = dict[@"need"];
        NSArray *arr = [str componentsSeparatedByString:@","];
        for (int i=0; i<arr.count; i++) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10+i*kWithd/6, 155+kWithd/3, kWithd/6-10, kWithd/6-10)];
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",arr[i]]];
            [imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"3"]];
            [self.view addSubview:imageV];
        }
        
        [self.desLabel sizeToFit];
    }];
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
