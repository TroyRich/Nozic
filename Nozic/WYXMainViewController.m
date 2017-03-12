//
//  WYXMainViewController.m
//  Nozic
//
//  Created by Troy-Wu on 13/03/2017.
//  Copyright © 2017 com.LittleTroy. All rights reserved.
//

#import "WYXMainViewController.h"

@interface WYXMainViewController ()


/** 下工具栏 */
@property (nonatomic,strong) UIToolbar *toolBar;

/** 保存按钮 */
@property (nonatomic,strong) UIBarButtonItem *saveBtn;
/** 播放按钮 */
@property (nonatomic,strong) UIBarButtonItem *playBtn;
/** 定时按钮 */
@property (nonatomic,strong) UIBarButtonItem *timerBtn;




@end

@implementation WYXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加底部按钮
-(void)addButtomBtn
{
    self.saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveBtnDidTouch:)];
    self.playBtn = [[UIBarButtonItem alloc] initWithTitle:@"播放" style:UIBarButtonItemStyleDone target:self action:@selector(playBtnDidTouch)];
}

//保存按钮点击的处理函数书
-(void)saveBtnDidTouch:(id *)sender
{
    NSLog(@"保存按钮被电击了");
}

//播放按钮被点击
-(void)playBtnDidTouch:(id *)sender
{
    NSLog(@"播放按钮被点击了");
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
