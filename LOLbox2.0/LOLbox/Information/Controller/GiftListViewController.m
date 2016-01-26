//
//  GiftListViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GiftListViewController.h"
#import "NetHandler.h"
#import "GiftListCell.h"
#import "UIImageView+WebCache.h"
#import "PickColorView.h"


@interface GiftListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIButton *selectB;
@property (nonatomic,strong)UITableView *tableV;
@property (nonatomic,strong)NSMutableArray *sectionArr;
@property (nonatomic,strong)NSMutableArray *showArr;
@property (nonatomic,strong)PickColorView *pickV;
@end

@implementation GiftListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handler];
    self.selectB = [UIButton buttonWithType:UIButtonTypeSystem];
    self.selectB.frame = CGRectMake(kWithd/2-80, 105, 160, 25);
    self.selectB.backgroundColor = [UIColor redColor];
    [self.selectB setTitle:@"红色" forState:UIControlStateNormal];
    [self.selectB addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.basicV addSubview:self.selectB];
    
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 130, kWithd, kHeight-100) style:UITableViewStyleGrouped];
    self.tableV.dataSource = self;
    self.tableV.delegate = self;
    [self.tableV registerClass:[GiftListCell class] forCellReuseIdentifier:@"gift"];
    self.tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.tableV.rowHeight = 130;
    [self.basicV addSubview:self.tableV];
    
    self.pickV = [[PickColorView alloc] initWithFrame:CGRectMake(kWithd/2-80, kHeight/2-50, 160, 150)];
    for (int i=0; i<self.pickV.buttonArr.count; i++) {
        UIButton *bt = self.pickV.buttonArr[i];
        [bt addTarget:self action:@selector(choseColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
- (void)choseColor:(UIButton *)bt
{
    if (bt.tag ==2200) {
        self.selectB.backgroundColor = [UIColor redColor];
        [self.selectB setTitle:@"红色" forState:UIControlStateNormal];
        NSArray *arr = self.sectionArr[0];
        self.showArr = [NSMutableArray arrayWithArray:arr];
    }else if (bt.tag ==2201){
        self.selectB.backgroundColor = [UIColor blueColor];
        [self.selectB setTitle:@"蓝色" forState:UIControlStateNormal];
        NSArray *arr = self.sectionArr[1];
        self.showArr = [NSMutableArray arrayWithArray:arr];
    }else if (bt.tag ==2202){
        self.selectB.backgroundColor = [UIColor yellowColor];
        [self.selectB setTitle:@"黄色" forState:UIControlStateNormal];
        NSArray *arr = self.sectionArr[2];
        self.showArr = [NSMutableArray arrayWithArray:arr];
    }else if (bt.tag ==2203){
        self.selectB.backgroundColor = [UIColor purpleColor];
        [self.selectB setTitle:@"紫色" forState:UIControlStateNormal];
        NSArray *arr = self.sectionArr[3];
        self.showArr = [NSMutableArray arrayWithArray:arr];
    }
    [self.pickV removeFromSuperview];
    [self.tableV reloadData];
}

- (void)changeColor
{
    [self.view addSubview:self.pickV];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.sectionArr[0];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GiftListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gift" forIndexPath:indexPath];
    NSDictionary *dict = self.showArr[indexPath.row];
    cell.nameLabel.text = dict[@"Name"];
    cell.lev1Label.text = [NSString stringWithFormat:@"一级:%@%@",dict[@"Prop"],dict[@"lev1"]];
    cell.lev2Label.text = [NSString stringWithFormat:@"二级:%@%@",dict[@"Prop"],dict[@"lev2"]];
    cell.lev3Label.text = [NSString stringWithFormat:@"三级:%@%@",dict[@"Prop"],dict[@"lev3"]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/runes/%@_3.png",dict[@"Img"]]];
    [cell.myImageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)handler
{
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiRunes.php?v=70&OSType=iOS8.1.2" completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.sectionArr = [NSMutableArray array];
        [self.sectionArr addObject:dict[@"Red"]];
        [self.sectionArr addObject:dict[@"Blue"]];
        [self.sectionArr addObject:dict[@"Yellow"]];
        [self.sectionArr addObject:dict[@"Purple"]];
        NSArray *arr = dict[@"Red"];
        self.showArr = [NSMutableArray arrayWithArray:arr];
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
