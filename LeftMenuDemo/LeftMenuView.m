//
//  LeftMenuView.m
//  LeftMenuDemo
//
//  Created by lxj on 15/2/1.
//  Copyright (c) 2015年 lxj. All rights reserved.
//

//static float 
#define  ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define  NAV_Height     64.0f

#import "LeftMenuView.h"

@interface LeftMenuView ()<UITableViewDataSource,UITableViewDelegate>
{
    UIViewController *_leftViewController;
    
}
@property (nonatomic,strong)UIView          *disPlayView;
@end

@implementation LeftMenuView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //
        [self.superview  addSubview:self.disPlayView];
        self.disPlayView.backgroundColor =[UIColor grayColor];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame selectBlock:(selectBlock)selectBlock
{
    self =[super initWithFrame:frame];
    if (self) {
        //
        self.selectBlock =selectBlock;
        _x_tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height) style:UITableViewStylePlain];
        _x_tableView.delegate =self;
        _x_tableView.tableFooterView =[[UIView alloc] init];
        _x_tableView.dataSource =self;
        _x_tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        [self addSubview:_x_tableView];
        
    }
    return self;
}

#pragma mark - table delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier =@"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"test--%ld",(long)indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.selectBlock) {
        self.selectBlock();
    }
}

-(void)showOrHidden:(BOOL)aBool
{
    
}



@end
