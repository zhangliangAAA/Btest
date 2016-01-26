//
//  BaikeViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TianfuViewController.h"
#import "BaikeViewController.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"
#import "EquipViewController.h"
#import "GiftListViewController.h"//实际是符文
#import "BestTeamViewController.h"
#import "KaelSkillViewController.h"

@interface BaikeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong)UITableView *tableV;
@end

@implementation BaikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handler];
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 130, kWithd, kHeight-130) style:UITableViewStylePlain];
    self.tableV.dataSource = self;
    self.tableV.delegate = self;
    self.tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.tableV.rowHeight = 60;
    self.tableV.separatorColor = [UIColor orangeColor];
    [self.basicV addSubview:self.tableV];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSDictionary *dict = self.array[indexPath.row];
    NSURL *url = [NSURL URLWithString:dict[@"icon"]];
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
    cell.textLabel.text = dict[@"name"];
    cell.textLabel.font = [UIFont systemFontOfSize:22];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            EquipViewController *eVC = [[EquipViewController alloc] init];
            [self.navigationController pushViewController:eVC animated:YES];
        }
            break;
        case 1:{
            TianfuViewController *tianfVC = [[TianfuViewController alloc] init];
            [self.navigationController pushViewController:tianfVC animated:YES];
        }
            break;
        case 2:{
            GiftListViewController *glVC = [[GiftListViewController alloc] init];
            [self.navigationController pushViewController:glVC animated:YES];
        }
            break;
        case 3:{
            BestTeamViewController *bestVC = [[BestTeamViewController alloc] init];
            [self.navigationController pushViewController:bestVC animated:YES];
        }
            break;
        case 4:{
            
            KaelSkillViewController *ksVC = [[KaelSkillViewController alloc] init];
            [self.navigationController pushViewController:ksVC animated:YES];
        }
            break;
    }
}

- (void)handler
{
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiToolMenu.php?category=database&v=70&OSType=iOS8.1.2&versionName=2.1.4" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        self.array = [NSMutableArray arrayWithArray:arr];
        [self.tableV reloadData];
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
