//
//  CompareAbilityView.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CompareAbilityView.h"
#import "AbilityCell.h"

@interface CompareAbilityView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UILabel *grade;
@property (nonatomic,strong)UILabel *myName;
@property (nonatomic,strong)UILabel *enemyName;
@property (nonatomic,strong)AbilityCell *aCell;
@property (nonatomic,strong)NSMutableArray *myBaseArr;
@property (nonatomic,strong)NSMutableArray *myLevelArr;
@property (nonatomic,strong)NSMutableArray *enemyBaseArr;
@property (nonatomic,strong)NSMutableArray *enemyLevelArr;
@property (nonatomic,strong)NSArray *nameArr;

@end


@implementation CompareAbilityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 5, kWithd-40, 30)];
        self.slider.minimumValue = 1;
        self.slider.maximumValue = 18;
        [self addSubview:self.slider];
        
        self.grade = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, kWithd/4-10, 30)];
        self.grade.textColor = [UIColor whiteColor];
        [self addSubview:self.grade];
        
        self.myName = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/2-100-10, 70, 100, 30)];
        self.myName.textColor = [UIColor whiteColor];
        [self addSubview:self.myName];
        
        self.enemyName = [[UILabel alloc] initWithFrame:CGRectMake(kWithd/2+10, 70, 100, 30)];
        self.enemyName.textColor = [UIColor whiteColor];
        [self addSubview:self.enemyName];
        
        self.myTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, kWithd, kHeight-320) style:UITableViewStylePlain];
        self.myTV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        self.myTV.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.myTV.dataSource = self;
        self.myTV.delegate = self;
        self.myTV.rowHeight = 35;
        [self addSubview:self.myTV];
        
        self.nameArr = @[@"攻:",@"防:",@"法:",@"难:",@"攻击距离:",@"移动速度:",@"基础攻击:",@"基础防御:",@"基础魔法值:",@"基础生命",@"暴击几率:",@"魔法恢复:",@"生命恢复:",@"魔法抗性"];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.aCell = [tableView dequeueReusableCellWithIdentifier:@"aCell"];
    if (!_aCell) {
        self.aCell = [[AbilityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aCell"];
    }
    _aCell.abilityL.text = self.nameArr[indexPath.row];
    
    float myTotal = 0;
    float enemyTotal = -1;
    if (indexPath.row<6) {
        myTotal = [self.myBaseArr[indexPath.row] floatValue];
        _aCell.myValue.text = [NSString stringWithFormat:@"%.1f",myTotal];
        if (self.enemyLevelArr) {
            enemyTotal = [self.enemyBaseArr[indexPath.row] floatValue];
            _aCell.enemyValue.text = [NSString stringWithFormat:@"%.1f",enemyTotal];
        }
    }else{
        myTotal = [self.myBaseArr[indexPath.row] floatValue] + [self.myLevelArr[indexPath.row] floatValue]*_grad;
        _aCell.myValue.text = [NSString stringWithFormat:@"%.1f(+%@)",myTotal,self.myLevelArr[indexPath.row]];
        if (self.enemyLevelArr) {
            enemyTotal = [self.enemyBaseArr[indexPath.row] floatValue] + [self.enemyLevelArr[indexPath.row] floatValue]*_grad;
            _aCell.enemyValue.text = [NSString stringWithFormat:@"%.1f(+%@)",enemyTotal,self.enemyLevelArr[indexPath.row]];
        }
    }
    if (self.enemyLevelArr) {
        if (myTotal > enemyTotal) {
            _aCell.signLabel.text = @">";
            _aCell.signLabel.textColor = [UIColor greenColor];
        }else if(myTotal < enemyTotal)
        {
            _aCell.signLabel.text = @"<";
            _aCell.signLabel.textColor = [UIColor redColor];
        }else
        {
            _aCell.signLabel.text = @"=";
            _aCell.signLabel.textColor = [UIColor blueColor];
        }
    }

    return self.aCell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)setGrad:(int)grad
{
    _grad = grad;
    self.grade.text = [NSString stringWithFormat:@"等级: %d",grad];
    [self.myTV reloadData];
}

- (void)setMyHD:(HeroDetail *)myHD
{
    _myHD = myHD;
    self.myName.text = self.myHD.displayName;
    self.myBaseArr = [NSMutableArray arrayWithObjects:_myHD.ratingAttack,_myHD.ratingDefense,_myHD.ratingMagic,_myHD.ratingDifficulty,_myHD.range,_myHD.moveSpeed,_myHD.attackBase,_myHD.armorBase,_myHD.manaBase,_myHD.healthBase,_myHD.criticalChanceBase,_myHD.manaRegenBase,_myHD.healthRegenBase,_myHD.magicResistBase, nil];
    self.myLevelArr = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",_myHD.attackLevel,_myHD.armorLevel,_myHD.manaLevel,_myHD.healthLevel,_myHD.criticalChanceLevel,_myHD.manaRegenLevel,_myHD.healthRegenLevel,_myHD.magicResistLevel, nil];
    [self.myTV reloadData];
}

- (void)setEnemyHD:(HeroDetail *)enemyHD
{
    _enemyHD = enemyHD;
    self.enemyName.text = self.enemyHD.displayName;
    self.enemyBaseArr = [NSMutableArray arrayWithObjects:_enemyHD.ratingAttack,_enemyHD.ratingDefense,_enemyHD.ratingMagic,_enemyHD.ratingDifficulty,_enemyHD.range,_enemyHD.moveSpeed,_enemyHD.attackBase,_enemyHD.armorBase,_enemyHD.manaBase,_enemyHD.healthBase,_enemyHD.criticalChanceBase,_enemyHD.manaRegenBase,_enemyHD.healthRegenBase,_enemyHD.magicResistBase, nil];
    self.enemyLevelArr = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",_enemyHD.attackLevel,_enemyHD.armorLevel,_enemyHD.manaLevel,_enemyHD.healthLevel,_enemyHD.criticalChanceLevel,_enemyHD.manaRegenLevel,_enemyHD.healthRegenLevel,_enemyHD.magicResistLevel, nil];
    [self.myTV reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
