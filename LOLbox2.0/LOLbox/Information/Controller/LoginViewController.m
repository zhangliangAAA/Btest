//
//  LoginViewController.m
//  LOLbox
//
//  Created by 张良浩 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "LoginViewController.h"
#import "MyDetailHeroViewController.h"
#import "NetHandler.h"
@interface LoginViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong)UITextField *userNameTF;
@property (nonatomic,strong)UITextField *severNameTF;
@property (nonatomic,strong)UIPickerView *pickerV;
@property (nonatomic,strong)NSMutableArray *severArr;
@property (nonatomic,strong)NSString *serverName;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handlerArr];
    
    self.pickerV = [[UIPickerView alloc] initWithFrame:CGRectMake(5, kHeight-120, kWithd-10, 100)];
    self.pickerV.dataSource = self;
    self.pickerV.delegate = self;
    self.pickerV.backgroundColor = [UIColor grayColor];
    
    self.userNameTF = [[UITextField alloc] initWithFrame:CGRectMake(25, 120, kWithd-50, 40)];
    self.userNameTF.borderStyle = UITextBorderStyleRoundedRect;
    self.userNameTF.placeholder = @"输入召唤师名字";
    [self.basicV addSubview:self.userNameTF];
    
    self.severNameTF = [[UITextField alloc] initWithFrame:CGRectMake(25, 180, kWithd-50, 40)];
    self.severNameTF.borderStyle = UITextBorderStyleRoundedRect;
    self.severNameTF.text = @"艾欧尼亚";
    self.severNameTF.placeholder = @"选择大区名";
#pragma mark-给TextFiled添加视图!!!
    self.severNameTF.inputView = self.pickerV;
    [self.basicV addSubview:self.severNameTF];
    
    UIButton *loginB = [UIButton buttonWithType:UIButtonTypeSystem];
    loginB.frame = CGRectMake(kWithd/2-50, 230, 100, 40);
    [loginB setTitle:@"查询" forState:UIControlStateNormal];
    loginB.titleLabel.font = [UIFont systemFontOfSize:22];
    loginB.backgroundColor = [UIColor orangeColor];
    loginB.layer.cornerRadius = 8;
    [loginB addTarget:self action:@selector(myHero) forControlEvents:UIControlEventTouchUpInside];
    [self.basicV addSubview:loginB];
    
}
- (void)myHero
{
    if (self.userNameTF.text.length != 0) {
        //  将信息写入本地
        NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
        [uf setBool:YES forKey:@"logged"];
        [uf setObject:self.userNameTF.text forKey:@"userName"];
        [uf setObject:self.serverName forKey:@"serverName"];
        [uf synchronize]; //立即写入
    MyDetailHeroViewController *myVC = [[MyDetailHeroViewController alloc] init];
        myVC.userName = self.userNameTF.text;
        myVC.serverName = self.serverName;
    [self.navigationController pushViewController:myVC animated:YES];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.severArr.count;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED
{
    NSDictionary *dict = self.severArr[row];
    self.serverName = dict[@"sn"];
    return dict[@"fn"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED
{
    NSDictionary *dict = self.severArr[row];
    self.severNameTF.text = dict[@"fn"];
}

- (void)handlerArr
{
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiServers.php?v=70&OSType=iOS8.1.2&versionName=2.1.4" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        self.severArr = [NSMutableArray arrayWithArray:arr];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 坑神在此啊123
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
