//
//  GiftViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GiftViewController.h"
#import "GiftImageViewController.h"

#import "NetHandler.h"

@interface GiftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)GiftModel *gift;
@property (nonatomic,strong)UITableView *tableV;
@property (nonatomic,strong)UITableViewCell *cell;
@end

@implementation GiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-100)];
    self.tableV.dataSource = self;
    self.tableV.delegate = self;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableV.rowHeight = 200;
    self.tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.view addSubview:self.tableV];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//  自己的重用池
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!_cell) {
        self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuse"];
    }
    _cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    _cell.textLabel.textColor = [UIColor whiteColor];
    _cell.detailTextLabel.textColor = [UIColor whiteColor];
    _cell.detailTextLabel.numberOfLines = 0;
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.gift) {
    GiftImageViewController *giftImage = [[GiftImageViewController alloc] init];
    giftImage.gift = self.gift;
    [self.navigationController pushViewController:giftImage animated:YES];
    }
}

- (void)handlerGiftData
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php?v=70&hero=%@&OSType=iOS8.1.2",self.name] completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers |NSJSONReadingMutableLeaves error:nil];
        if (arr.count!=0) {
        NSDictionary *dict = arr[0];
        self.gift = [[GiftModel alloc] init];
        [self.gift setValuesForKeysWithDictionary:dict];
        self.cell.textLabel.text = self.gift.title;
        self.cell.detailTextLabel.text = self.gift.des;
        [self.tableV reloadData];
        }
    }];
}

- (void)setName:(NSString *)name
{
    _name = name;
    [self handlerGiftData];
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
