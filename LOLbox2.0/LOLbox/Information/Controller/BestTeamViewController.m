//
//  BestTeamViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TeamDetailViewController.h"
#import "BestTeamViewController.h"
#import "NetHandler.h"
#import "Team.h"
#import "TeamCell.h"


@interface BestTeamViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *teamArr;
@property (nonatomic,strong)UITableView *tableV;

@end

@implementation BestTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handler];
    
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100) style:UITableViewStylePlain];
    self.tableV.dataSource = self;
    self.tableV.delegate = self;
    self.tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.tableV.rowHeight = 100+kWithd/6;
    [self.basicV addSubview:self.tableV];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.teamArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[TeamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    Team *tem = self.teamArr[indexPath.row];
    cell.tem = tem;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamDetailViewController *tdVC = [[TeamDetailViewController alloc] init];
    Team *team = self.teamArr[indexPath.row];
    tdVC.team = team;
    [self.navigationController pushViewController:tdVC animated:YES];
}

- (void)handler
{
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiHeroBestGroup.php?v=70&OSType=iOS8.1.2" completion:^(NSData *data) {
        self.teamArr = [NSMutableArray array];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *dict in arr) {
            Team *team = [[Team alloc] init];
            [team setValuesForKeysWithDictionary:dict];
            [self.teamArr addObject:team];
        }
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
