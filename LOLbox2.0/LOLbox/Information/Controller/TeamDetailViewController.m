//
//  TeamDetailViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/21.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "TeamDetailViewController.h"

@interface TeamDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *imageVarr;
@property (nonatomic,strong)UIImageView *imageV1;
@property (nonatomic,strong)UIImageView *imageV2;
@property (nonatomic,strong)UIImageView *imageV3;
@property (nonatomic,strong)UIImageView *imageV4;
@property (nonatomic,strong)UIImageView *imageV5;
@end

@implementation TeamDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *nameL = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, kWithd-20, 30)];
    nameL.text = self.team.title;
    nameL.textColor = [UIColor whiteColor];
    [self.basicV addSubview:nameL];
    
    self.imageV1 = [[UIImageView alloc] init];
    self.imageV2 = [[UIImageView alloc] init];
    self.imageV3 = [[UIImageView alloc] init];
    self.imageV4 = [[UIImageView alloc] init];
    self.imageV5 = [[UIImageView alloc] init];
    self.imageVarr = @[_imageV1,_imageV2,_imageV3,_imageV4,_imageV5];
    NSArray *arr = @[_team.hero1,_team.hero2,_team.hero3,_team.hero4,_team.hero5];
    for (int i=0; i<_imageVarr.count; i++) {
        UIImageView *imageV = _imageVarr[i];
        imageV.frame = CGRectMake(10+i*kWithd/5, 135, kWithd/6, kWithd/6);
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",arr[i]]];
        [imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
        [self.basicV addSubview:imageV];
    }
    
    UILabel *desL = [[UILabel alloc] initWithFrame:CGRectMake(10, 140+kWithd/6, kWithd-20, 20)];
    desL.textColor = [UIColor whiteColor];
    desL.text = self.team.des;
    desL.numberOfLines = 0;
    [desL sizeToFit];
    [self.basicV addSubview:desL];
    
    UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, desL.frame.origin.y+desL.bounds.size.height, kWithd, kHeight-desL.frame.origin.y-desL.bounds.size.height) style:UITableViewStylePlain ];
    tableV.dataSource = self;
    tableV.delegate = self;
    tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.basicV addSubview:tableV];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[self.team.des1,self.team.des2,self.team.des3,self.team.des4,self.team.des5];
    NSArray *array = @[_team.hero1,_team.hero2,_team.hero3,_team.hero4,_team.hero5];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",array[indexPath.row]]];
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = arr[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[self.team.des1,self.team.des2,self.team.des3,self.team.des4,self.team.des5];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 2*kWithd/3-50, 20)];
    label.text = arr[indexPath.row];
    label.numberOfLines = 0;
    [label sizeToFit];
    
    return label.bounds.size.height+30;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
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
