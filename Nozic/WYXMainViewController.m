//
//  WYXMainViewController.m
//  Nozic
//
//  Created by Troy-Wu on 13/03/2017.
//  Copyright © 2017 com.LittleTroy. All rights reserved.
//

#import "WYXMainViewController.h"
#import <Masonry.h>

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
    [self addButtomBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//创建配置好的数据
-(void)createTableView{
    
}

//添加底部按钮
-(void)addButtomBtn
{
    self.saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveBtnDidTouch:)];
    
    self.playBtn = [[UIBarButtonItem alloc] initWithTitle:@"播放" style:UIBarButtonItemStyleDone target:self action:@selector(playBtnDidTouch:)];
    
    self.timerBtn = [[UIBarButtonItem alloc] initWithTitle:@"定时器" style:UIBarButtonItemStyleDone target:self action:@selector(timerBtnDidTouch:)];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray *toolBarItems = [NSArray arrayWithObjects:self.saveBtn,flexible,self.playBtn,flexible,self.timerBtn,nil];
    //ToolBar的创建
//    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 366 + 54, 320, 50)];
    self.toolBar = [[UIToolbar alloc] init];
    [self.toolBar setBarStyle:UIBarStyleBlackOpaque];
    [self.view addSubview:self.toolBar];
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 64.0));
    }];
    

    [self.toolBar setItems:toolBarItems];

}

//保存按钮点击的处理函数书
-(void)saveBtnDidTouch:(id *)sender
{
    //保存一个数据到用户的本地
    
    
    //有一个弹窗告诉用户已经完成了保存
}

//播放按钮被点击
-(void)playBtnDidTouch:(id *)sender
{
    //播放当前选中的音轨
}

//定时器按钮点击的处理函数
-(void)timerBtnDidTouch:(id *)sender
{
    
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
