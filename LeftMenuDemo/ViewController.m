//
//  ViewController.m
//  LeftMenuDemo
//
//  Created by lxj on 15/2/1.
//  Copyright (c) 2015年 lxj. All rights reserved.
//

#import "ViewController.h"
#import "LeftMenuView.h"

#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight  [[UIScreen mainScreen] bounds].size.height


@interface ViewController ()
{
    BOOL _showLeftMenu;
}

@property(nonatomic,strong)LeftMenuView *leftMenu;
@property(nonatomic,strong)UIView       *disPlayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)leftMenu:(UIBarButtonItem *)sender
{
    [self creatLeftMenu];
    [self showOrHidden:_showLeftMenu];
    

}





#pragma mark - 原来设计的
-(void)creatLeftMenu
{
    if (!_leftMenu) {
        _disPlayView =[[UIView alloc] initWithFrame:CGRectMake(0, 64,ScreenWidth ,ScreenHeight-64)];
        UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(displayViewTap:)];
        [_disPlayView addGestureRecognizer:tap];
        _disPlayView.hidden = YES;
        _disPlayView.backgroundColor = [UIColor grayColor];
        __block typeof(self) weakSelf = self;
        _leftMenu =[[LeftMenuView alloc] initWithFrame:CGRectMake(-300, 64, 200, ScreenHeight-64) selectBlock:^{
            //
            [weakSelf showOrHidden:_showLeftMenu];
            NSLog(@"这里设计  代理  ～～ 等等～");
        }];
        _leftMenu.backgroundColor =[UIColor yellowColor];
        [self.view addSubview:_disPlayView];
        [self.view addSubview:_leftMenu];
    }
}

-(void)displayViewTap:(id)sender
{
    [self showOrHidden:_showLeftMenu];
}

-(void)showOrHidden:(BOOL)aBool
{
    if (aBool)
    {
        [UIView animateWithDuration:.5 animations:^{
            _leftMenu.frame =CGRectMake(-300, 64, 200, ScreenHeight-64);
            _disPlayView.hidden = YES;
        } completion:^(BOOL finished) {
        }];
    }
    else{
        
        [UIView animateWithDuration:.5 animations:^{
            _leftMenu.frame =CGRectMake(0, 64, 200, ScreenHeight-64);
            _disPlayView.hidden = NO;
        } completion:^(BOOL finished) {
        }];
    }
    _showLeftMenu =!_showLeftMenu;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
