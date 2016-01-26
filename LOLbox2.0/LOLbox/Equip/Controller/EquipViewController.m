//
//  EquipViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipViewController.h"
#import "EquipCollectionViewController.h"
#import "NetHandler.h"


@interface EquipViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong)UITableView *tableV;
@end

@implementation EquipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100) style:UITableViewStylePlain];
    self.tableV.dataSource = self;
    self.tableV.delegate = self;
    self.tableV.rowHeight = 40;
    self.tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.view addSubview:self.tableV];
    
    self.navigationItem.title = @"装备分类";
    
    [self handlerEquip];
    
}

- (void)handlerEquip
{
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiZBCategory.php" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        self.array = [NSMutableArray arrayWithArray:arr];
        [self.tableV reloadData];
    }];
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
    cell.textLabel.text = dict[@"text"];
    cell.textLabel.textColor = [UIColor orangeColor];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EquipCollectionViewController *equipCVC = [[EquipCollectionViewController alloc] init];
    NSDictionary *dict = self.array[indexPath.row];
    equipCVC.name = dict[@"tag"];
    [self.navigationController pushViewController:equipCVC animated:YES];
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
