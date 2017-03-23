//
//  WYXMainViewController.m
//  Nozic
//
//  Created by Troy-Wu on 13/03/2017.
//  Copyright © 2017 com.LittleTroy. All rights reserved.
//

#import "WYXMainViewController.h"
#import <Masonry.h>
#import "WYXSettingTableViewController.h"
#import "WYXMusicTool.h"
#import "WYXMusic.h"
#import <AVFoundation/AVFoundation.h>

@interface WYXMainViewController ()

/** tableVC */
@property (nonatomic,strong) UITableViewController *tableVC;



/** 上工具栏 */
@property (nonatomic,strong) UIToolbar *topToolBar;
/** 用户自己的库的按钮 */
@property (nonatomic,strong) UIBarButtonItem *libraryBarItem;
/** 设置按钮 */
@property (nonatomic,strong) UIBarButtonItem *settingBarItem;




/** 下工具栏 */
@property (nonatomic,strong) UIToolbar *buttomToolBar;

/** 保存按钮 */
@property (nonatomic,strong) UIBarButtonItem *saveBarItem;
/** 播放按钮 */
@property (nonatomic,strong) UIBarButtonItem *playBarItem;
/** 定时按钮 */
@property (nonatomic,strong) UIBarButtonItem *timerBarItem;

/** 声音特效arr */
@property (nonatomic,strong)NSArray *soundsArr;

/** player */
@property (nonatomic,strong) AVAudioPlayer *player;
/** playerDic */
//@property (nonatomic,strong) NSMutableDictionary *playerDic;




@end

@implementation WYXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //获取音频配置
    self.soundsArr = [[WYXMusicTool sharedMusicTool] musics];
//    _playerDic = [[WYXMusicTool sharedMusicTool] avPlayerDic];
    
    [self createTopBar];
    [self addButtomBar];
    
    self.tableVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.view addSubview:self.tableVC.view];
    
    [self.tableVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topToolBar.mas_bottom);
        make.bottom.mas_equalTo(self.buttomToolBar.mas_top);
        make.width.mas_equalTo(self.view.mas_width);
    }];
    self.tableVC.tableView.delegate = self;
    self.tableVC.tableView.dataSource = self;
     self.tableVC.tableView.allowsMultipleSelection = YES;
    
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)viewDidAppear:(BOOL)animated
{
        [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTopBar{
    self.libraryBarItem = [[UIBarButtonItem alloc] initWithTitle:@"资料库" style:UIBarButtonItemStyleDone target:self action:@selector(libraryBtnDidTouch:)];
    
//    [self navigationController].navigationItem.leftBarButtonItem = self.libraryBarItem;
    
    self.settingBarItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(settingBtnDidTouch:)];
//     [self navigationController].navigationItem.rightBarButtonItem = self.settingBarItem;
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray *toolBarItems = [NSArray arrayWithObjects:self.libraryBarItem,flexible,self.settingBarItem,nil];
    
    //ToolBar的创建

    self.topToolBar = [[UIToolbar alloc] init];
    [self.topToolBar setBarStyle:UIBarStyleBlackOpaque];
    [self.view addSubview:self.topToolBar];
    [self.topToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 44));
    }];
    
    [self.topToolBar setItems:toolBarItems];
}

-(void)libraryBtnDidTouch:(id *)sender
{
    
}

-(void)settingBtnDidTouch:(id *)sender
{
    WYXSettingTableViewController *tableVC = [[WYXSettingTableViewController alloc] init];
//    tableVC.view.frame = self.navigationController.view.frame;
    [self.navigationController pushViewController:tableVC animated:YES];
}

//创建配置好的数据
-(void)createTableView{
    
}

//添加底部按钮
-(void)addButtomBar
{
    self.saveBarItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveBtnDidTouch:)];
    
    self.playBarItem = [[UIBarButtonItem alloc] initWithTitle:@"播放" style:UIBarButtonItemStyleDone target:self action:@selector(playBtnDidTouch:)];
    
    self.timerBarItem = [[UIBarButtonItem alloc] initWithTitle:@"定时器" style:UIBarButtonItemStyleDone target:self action:@selector(timerBtnDidTouch:)];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray *toolBarItems = [NSArray arrayWithObjects:self.saveBarItem,flexible,self.playBarItem,flexible,self.timerBarItem,nil];
    //ToolBar的创建
    self.buttomToolBar = [[UIToolbar alloc] init];
    [self.buttomToolBar setBarStyle:UIBarStyleBlackOpaque];
    [self.view addSubview:self.buttomToolBar];

    [self.buttomToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 44));
    }];

    [self.buttomToolBar setItems:toolBarItems];

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
    [WYXMusicTool sharedMusicTool].isPlayingMusic = ! [[WYXMusicTool sharedMusicTool] isPlayingMusic];
    [self updatePlayerBtnStatue];
}

//定时器按钮点击的处理函数
-(void)timerBtnDidTouch:(id *)sender
{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.soundsArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    WYXMusic *music = self.soundsArr[indexPath.row];
    cell.textLabel.text = music.name;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self playMusic:indexPath selected:YES];

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self playMusic:indexPath selected:NO];
}

-(void)playMusic:(NSIndexPath *)indexPath selected:(BOOL)selected
{
    WYXMusic *music = self.soundsArr[indexPath.row];
    
//    _player = [_playerDic valueForKey:music.filename];
    _player  = [[[WYXMusicTool sharedMusicTool] avPlayerDic] valueForKey:music.filename];
    if (!_player) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:music.filename ofType:@"mp3"];

        NSError *error = [[NSError alloc]init];

        NSURL *url = [[NSURL alloc]initFileURLWithPath:filePath];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];

        NSMutableDictionary *dic = [WYXMusicTool sharedMusicTool].avPlayerDic;
                              
        [dic setValue:_player forKey:music.filename];
        _player.numberOfLoops = -1;
        [_player pause];
    }
    if (selected && [WYXMusicTool sharedMusicTool].isPlayingMusic) {
        [_player play];
        
    }else{
        [_player pause];
    }
    music.isSelected = selected;
    [self updatePlayerBtnStatue];
}

-(void)updatePlayerBtnStatue
{
    if ([WYXMusicTool sharedMusicTool].isPlayingMusic) {
        self.playBarItem.title = @"暂停";
    }else{
        self.playBarItem.title = @"播放";
    }
}




@end
