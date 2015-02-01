//
//  LeftMenuView.h
//  LeftMenuDemo
//
//  Created by lxj on 15/2/1.
//  Copyright (c) 2015年 lxj. All rights reserved.
//


typedef void(^selectBlock)(void);

#import <UIKit/UIKit.h>

@interface LeftMenuView : UIView
{

}


@property(nonatomic,strong)UITableView *x_tableView;

@property(nonatomic,copy)selectBlock selectBlock;

-(instancetype)initWithFrame:(CGRect)frame selectBlock:(selectBlock)selectBlock;

@end
