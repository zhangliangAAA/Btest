//
//  CompareViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CompareViewController.h"
#import "ChoseHeroViewController.h"
#import "CompareAbilityView.h"
#import "UIButton+WebCache.h"
#import "CompareSkillCell.h"
#import "NetHandler.h"
#import "Skill.h"


@interface CompareViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UIButton *myB;
@property (nonatomic,strong)UIButton *choseB;
@property (nonatomic,strong)UISegmentedControl *segCtrl;
@property (nonatomic,strong)UITableView *SkillTV;
@property (nonatomic,strong)CompareAbilityView *AbilityV;
@property (nonatomic,strong)CompareSkillCell *csCell;
@property (nonatomic,strong)HeroDetail *enemyHD;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,strong)NSMutableArray *skillArr;
@property (nonatomic,strong)NSMutableArray *leftSkillArr;
@property (nonatomic,strong)NSMutableArray *rightSkillArr;
@property (nonatomic,strong)NSMutableArray *alphaArr;

@end

@implementation CompareViewController

- (HeroDetail *)enemyHD
{
    if (!_enemyHD) {
        self.enemyHD = [[HeroDetail alloc] init];
    }
    return _enemyHD;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myB = [UIButton buttonWithType:UIButtonTypeCustom];
    _myB.frame = CGRectMake(kWithd/2-50-30, 115, 50, 50);
    [self.view addSubview:self.myB];
    
    self.choseB = [UIButton buttonWithType:UIButtonTypeCustom];
    _choseB.frame = CGRectMake(kWithd/2+30, 115, 50, 50);
    [_choseB setImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal];
    [_choseB addTarget:self action:@selector(choseHero) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.choseB];
    
    UILabel *VSlabel = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/2-15, 125, 30, 30)];
    VSlabel.textColor = [UIColor redColor];
    VSlabel.text = @"VS";
    [self.view addSubview:VSlabel];
    
    self.segCtrl = [[UISegmentedControl alloc] initWithItems:@[@"属性对比",@"技能对比"]];
    [_segCtrl addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    _segCtrl.frame = CGRectMake(0, 170, kWithd, 30);
    _segCtrl.tintColor = [UIColor orangeColor];
    _segCtrl.selectedSegmentIndex = 0;
    [self.view addSubview:_segCtrl];
    
//  技能对比View
    self.SkillTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, kWithd, kHeight-200) style:UITableViewStylePlain];
    self.SkillTV.dataSource = self;
    self.SkillTV.delegate = self;
    self.SkillTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.SkillTV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.view addSubview:self.SkillTV];
    
    self.skillArr = [NSMutableArray arrayWithObjects:self.HD.Skill_B,self.HD.Skill_Q,self.HD.Skill_W,self.HD.Skill_E,self.HD.Skill_R,nil];
    self.leftSkillArr = [NSMutableArray arrayWithObjects:self.HD.Skill_B,self.HD.Skill_Q,self.HD.Skill_W,self.HD.Skill_E,self.HD.Skill_R,nil];
    self.arr = [NSArray arrayWithObjects:@"B",@"Q",@"W",@"E",@"R", nil];
    self.alphaArr = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1", nil];
//  属性对比View
    self.AbilityV = [[CompareAbilityView alloc] initWithFrame:CGRectMake(0, 200, kWithd, kHeight-200)];
    [self.AbilityV.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    self.AbilityV.myHD = self.HD;
    [self changeValue:self.AbilityV.slider];
    [self.view addSubview:self.AbilityV];
    
    
    [self handlerImage];
}

- (void)changeValue:(UISlider *)slider
{
    int grade = (int)slider.value;
    self.AbilityV.grad = grade;
}

- (void)changeView:(UISegmentedControl *)segCtrl
{
    if (segCtrl.selectedSegmentIndex == 1) {
        [self.view bringSubviewToFront:self.SkillTV];
    }else
    {
        [self.view bringSubviewToFront:self.AbilityV];
    }
}

- (void)choseHero
{
    // ARC 下用__weak 防止引用计数增加(block里不能用self.)
    __weak CompareViewController *test = self;
    ChoseHeroViewController *chVC = [[ChoseHeroViewController alloc] init];
//  3.实现block
    chVC.choseHero = ^(NSString *name){
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",name]];
        [test.choseB sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"3"]];
        [self handlerEnemyWithName:name];
    };
    [test.navigationController pushViewController:chVC animated:YES];
}

- (void)handlerEnemyWithName:(NSString *)name
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.1.2&v=70&heroName=%@",name] completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.enemyHD = [[HeroDetail alloc] init];
        self.enemyHD.enName = name;
        [self.enemyHD setValuesForKeysWithDictionary:dict];
        self.rightSkillArr = [NSMutableArray arrayWithObjects:self.enemyHD.Skill_B,self.enemyHD.Skill_Q,self.enemyHD.Skill_W,self.enemyHD.Skill_E,self.enemyHD.Skill_R, nil];
        self.AbilityV.enemyHD = self.enemyHD;
        [self.SkillTV reloadData];
    }];
}

- (void)handlerImage
{
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",self.HD.name]];
    [self.myB sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"3"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.csCell = [tableView dequeueReusableCellWithIdentifier:@"CS"];
    if (!_csCell) {
        self.csCell = [[CompareSkillCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CS"];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3",self.HD.enName,_arr[indexPath.row]]];
    [_csCell.leftB sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"2"]];
    _csCell.leftB.tag = (indexPath.row+1)*1000 +1;
    [_csCell.leftB addTarget:self action:@selector(tipButton:) forControlEvents:UIControlEventTouchUpInside];
    _csCell.rightB.tag = (indexPath.row+1)*1000 +2;
    [_csCell.rightB addTarget:self action:@selector(tipButton:) forControlEvents:UIControlEventTouchUpInside];
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3",self.enemyHD.name,_arr[indexPath.row]]];
    [_csCell.rightB sd_setImageWithURL:url2 forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"2"]];
    _csCell.titleLabel.text = self.arr[indexPath.row];
    _csCell.skill = self.skillArr[indexPath.row];
    _csCell.alphaStr = self.alphaArr[indexPath.row];
    return _csCell;
}
// 两个Button添加一个方法(在方法里判断到底是哪个Button)
- (void)tipButton:(UIButton *)button
{
    NSInteger row = button.tag/1000;// 判断第几行的Button
    NSInteger l = button.tag%1000;// 判断哪一个Button(左?右)
    if (l==1) {
        [self.skillArr replaceObjectAtIndex:(row-1) withObject:self.leftSkillArr[row-1]];// 将此行展示的skill替换成leftSkill
        [self.alphaArr replaceObjectAtIndex:(row-1) withObject:@"1"];//Button的透明度进行改变
        [self.SkillTV reloadData];
    }else
    {
        if (self.rightSkillArr.count !=0) {
            [self.skillArr replaceObjectAtIndex:(row-1) withObject:self.rightSkillArr[row-1]];
            [self.alphaArr replaceObjectAtIndex:(row-1) withObject:@"0"];
            [self.SkillTV reloadData];
        }
    }
    
    
}
- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.csCell.rowHeight;
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
