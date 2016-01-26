//
//  HeroDetailViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "GiftViewController.h"
#import "CompareViewController.h"
#import "NetHandler.h"
#include "HeroDetail.h"
#import "SkillCell.h"
#import "likeCell.h"
#import "UseCell.h"
#import "DataCell.h"
#import "desCell.h"
#import "EquipCell.h"
#import "Equip.h"

#import "UIButton+WebCache.h"

@interface HeroDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableV;
@property (nonatomic,strong)SkillCell *skillCell;
@property (nonatomic,strong)likeCell *likeCell;
@property (nonatomic,strong)likeCell *hateCell;
@property (nonatomic,strong)UseCell *tipCell;
@property (nonatomic,strong)UseCell *oppCell;
@property (nonatomic,strong)DataCell *dataCell;
@property (nonatomic,strong)desCell *desCell;
@property (nonatomic,assign)BOOL desbool;

@property (nonatomic,strong)UITableView *equipTableV;
@property (nonatomic,strong)EquipCell *equipCell;
@property (nonatomic,strong)NSMutableArray *equipArr;

@property (nonatomic,strong)HeroDetail *HD;
@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topView = [[HeroDetailTopView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight)];
    self.topView.hero = self.hero;
    [self.topView.compareButton addTarget:self action:@selector(HeroCompare) forControlEvents:UIControlEventTouchUpInside];
    [self.topView.giftButton addTarget:self action:@selector(pushGift) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.topView];
//  创建[UISegmentedControl
    self.segCtrl = [[UISegmentedControl alloc] initWithItems:@[@"资料",@"出装"]];
    [self.segCtrl addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    self.segCtrl.frame = CGRectMake(0,195,kWithd, 30);
    self.segCtrl.tintColor = [UIColor orangeColor];
    self.segCtrl.selectedSegmentIndex = 0;
    [self.view addSubview:self.segCtrl];
    
//  创建 英雄详情TableView
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 225, kWithd, kHeight-225) style:UITableViewStylePlain];
    //设置代理
    _tableV.dataSource = self;
    _tableV.delegate = self;
    // 注册SkillCell
    [_tableV registerClass:[SkillCell class] forCellReuseIdentifier:@"skill"];
    // 注册 最佳搭档\克制 Cell
    [_tableV registerClass:[likeCell class] forCellReuseIdentifier:@"like"];
    // 注册 使用\应对 Cell
    [_tableV registerClass:[UseCell class] forCellReuseIdentifier:@"use"];
    // 注册 数据Cell
    [_tableV registerClass:[DataCell class] forCellReuseIdentifier:@"data"];
    // 注册 背景故事Cell
    [_tableV registerClass:[desCell class] forCellReuseIdentifier:@"des"];
    _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise,jpg"]];
    [self.view addSubview:_tableV];
    
//  创建 出装TableView
    self.equipTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 225, kWithd, kHeight-225) style:UITableViewStylePlain];
    // 设置daili
    _equipTableV.dataSource = self;
    _equipTableV.delegate = self;
    // 注册 Cell
    [_equipTableV registerClass:[EquipCell class] forCellReuseIdentifier:@"equip"];
    _equipTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _equipTableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.view addSubview:_equipTableV];
    
    
    [self.view bringSubviewToFront:self.tableV];
    [self handlerDetailData];
    
}

- (void)HeroCompare
{
    CompareViewController *compareVC = [[CompareViewController alloc] init];
    compareVC.HD = self.HD;
    [self.navigationController pushViewController:compareVC animated:YES];
}

- (void)pushGift
{
    GiftViewController *giftVC = [[GiftViewController alloc] init];
    giftVC.name = self.hero.enName;
    [self.navigationController pushViewController:giftVC animated:YES];
}

- (void)changeView:(UISegmentedControl *)segCtrl
{
    if (segCtrl.selectedSegmentIndex==0) {
        [self.view bringSubviewToFront:self.tableV];
    }else
    {
        [self handlerEquipData];
        [self.view bringSubviewToFront:self.equipTableV];
    }
}

// 关闭Cell,不可被选中!!!!
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableV) {
        return NO;
    }else
    {
        return NO;
    }
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableV) {
        return 7;
    }else if (tableView == self.equipTableV){
        return self.equipArr.count;
    }
    else{
    return 2;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#pragma mark-系统重用池
    if (tableView == self.tableV) { //判断是哪个tableView!!!
    if (indexPath.row == 0) {
    self.skillCell = [tableView dequeueReusableCellWithIdentifier:@"skill" forIndexPath:indexPath];
        NSArray *buttonArr = @[_skillCell.buttonB,_skillCell.buttonQ,_skillCell.buttonW,_skillCell.buttonE,_skillCell.buttonR];
        NSArray *arr = @[@"B",@"Q",@"W",@"E",@"R"];
        for (int i=0; i<5; i++) {
            UIButton *button = buttonArr[i];
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3",self.hero.enName,arr[i]]];
            [button sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"2"]];
            [button addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];
        }
        return _skillCell;
    }else if (indexPath.row ==1){
        self.likeCell = [tableView dequeueReusableCellWithIdentifier:@"like"];
        return _likeCell;
    }else if (indexPath.row ==2){
        self.hateCell = [tableView dequeueReusableCellWithIdentifier:@"like"];
        self.hateCell.titleLabel.text = @"最佳克制";
        return _hateCell;
    }else if (indexPath.row ==3){
        self.tipCell = [tableView dequeueReusableCellWithIdentifier:@"use"];
        return _tipCell;
    }else if (indexPath.row ==4){
        self.oppCell = [tableView dequeueReusableCellWithIdentifier:@"use"];
        _oppCell.titleLabel.text = @"应对";
        return _oppCell;
    }else if (indexPath.row ==5){
        self.dataCell = [tableView dequeueReusableCellWithIdentifier:@"data"];
        [self.dataCell.slider addTarget:self action:@selector(changeGrade:) forControlEvents:UIControlEventValueChanged];
        self.dataCell.HD = self.HD; //配制Cell信息使用
        [self changeGrade:_dataCell.slider]; //首次加载时值时调用
        return _dataCell;
    }else if (indexPath.row ==6){
        self.desCell = [tableView dequeueReusableCellWithIdentifier:@"des"];
        [self.desCell.openButton addTarget:self action:@selector(openOrClose) forControlEvents:UIControlEventTouchUpInside];
        return _desCell;
    }else
    {
        SkillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"skill" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor orangeColor];
        return cell;
    }
    }else if (tableView == self.equipTableV){
        self.equipCell = [tableView dequeueReusableCellWithIdentifier:@"equip" forIndexPath:indexPath];
        self.equipCell.equip = self.equipArr[indexPath.row];
        return _equipCell;
    }
    else
    {
        self.equipCell = [tableView dequeueReusableCellWithIdentifier:@"equip" forIndexPath:indexPath];
        return _equipCell;
    }
    
}

- (void)openOrClose
{
    if (self.desbool == YES) {
        self.desCell.des = nil;
        self.desbool = NO;
        [self.desCell.openButton setTitle:@"点击查看英雄背景" forState:UIControlStateNormal];
    }else
    {
        self.desCell.des = self.HD.description1;
        self.desbool = YES;
        [self.desCell.openButton setTitle:@"点击收起" forState:UIControlStateNormal];
    }
    [self.tableV reloadData];
}

- (void)changeGrade:(UISlider *)slider
{
    self.dataCell.grade = (int)slider.value;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableV) {
        if (indexPath.row == 0) {
            return self.skillCell.rowHeight+3;
        }else if (indexPath.row ==1){
            return self.likeCell.roeHeight;
        }else if (indexPath.row ==2){
            return self.hateCell.roeHeight+10;
        }else if (indexPath.row ==3){
            return self.tipCell.roeHeight;
        }else if (indexPath.row ==4){
            return self.oppCell.roeHeight;
        }else if (indexPath.row ==5){
            return 340;
        }else if (indexPath.row ==6){
            return self.desCell.rowHeight+15;
        }else
        {
            return 250;
        }
    }else
    {
        return 130;
    }
}

- (void)changeSkill:(UIButton *)button
{
    NSArray *arr = @[_HD.Skill_B,_HD.Skill_Q,_HD.Skill_W,_HD.Skill_E,_HD.Skill_R];
    self.skillCell.skill = arr[button.tag%2000];
    for (int i=0; i<5; i++) {
        UIView *view = self.skillCell.viewArr[i];
        if (i == button.tag%2000) {
            view.alpha = 0;
        }else
        {
            view.alpha = 0.65;
        }
    }
    
    [self.tableV reloadData];
    
}

// 获取英雄详细信息
- (void)handlerDetailData
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.1.2&v=70&heroName=%@",self.hero.enName] completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.HD = [[HeroDetail alloc] init];
        self.HD.enName = self.hero.enName;
        [_HD setValuesForKeysWithDictionary:dict];
//   初始值默认是Skill_B
        self.skillCell.skill = self.HD.Skill_B;
        self.likeCell.array = self.HD.like;
        self.hateCell.array = self.HD.hate;
        self.tipCell.show = self.HD.tips;
        self.oppCell.show = self.HD.opponentTips;
        self.desCell.des = nil;
        self.desbool = NO;
        [self.tableV reloadData];
        UIView *view = self.skillCell.viewArr[0];
        view.alpha = 0;
    }];
    
}
// 获取出装列表数据
- (void)handlerEquipData
{
    self.equipArr = [NSMutableArray array];
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php?v=70&OSType=iOS8.1.2&limit=7&championName=%@",self.hero.enName] completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        for (NSDictionary *dict in arr) {
            Equip *equip = [[Equip alloc] init];
            [equip setValuesForKeysWithDictionary:dict];
            [self.equipArr addObject:equip];
        }
//   给self.equipArr付完值后 刷新self.equipTableV
        [self.equipTableV reloadData];
    }];
}

- (void)setHero:(Hero *)hero
{
    _hero = hero;
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
