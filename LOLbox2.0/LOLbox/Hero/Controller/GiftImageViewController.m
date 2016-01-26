//
//  GiftImageViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GiftImageViewController.h"
#import "UIImageView+WebCache.h"

@interface GiftImageViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UILabel *label;

@end

@implementation GiftImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *backB = [UIButton buttonWithType:UIButtonTypeSystem];
    [backB setImage:[UIImage imageNamed:@"small"] forState:UIControlStateNormal];
    backB.frame = CGRectMake(10, 10, 40, 40);
    [backB addTarget:self action:@selector(popTo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backB];
    
    UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kHeight/2-150, kWithd, 250)];
    scrollV.contentSize = CGSizeMake(2*kWithd, 160);
    
    NSArray *urlArr = @[self.gift.fuPic,self.gift.tianPic];
    for (int i=0; i<2; i++) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i*kWithd, 0, kWithd, 250)];
        [imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",urlArr[i]]] placeholderImage:[UIImage imageNamed:@"LOL"]];
        [scrollV addSubview:imageV];
    }
    scrollV.pagingEnabled = YES;
    scrollV.delegate = self;
    [self.view addSubview:scrollV];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, kHeight-180, kWithd-20, 100)];
    self.label.numberOfLines = 0;
    self.label.textColor = [UIColor whiteColor];
     self.label.text = self.gift.fuDes;
    [self.view addSubview:self.label];
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x<375) {
        self.label.text = self.gift.fuDes;
    }else
    {
        self.label.text = self.gift.tianDes;
    }
}
- (void)popTo
{
    [self.navigationController popViewControllerAnimated:YES];
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
