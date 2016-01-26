//
//  desCell.h
//  LOLbox
//
//  Created by 张良浩 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface desCell : UITableViewCell

@property (nonatomic,assign)CGFloat rowHeight;
@property (nonatomic,copy)NSString *des;

@property (nonatomic,strong)UIButton *openButton;
@end
