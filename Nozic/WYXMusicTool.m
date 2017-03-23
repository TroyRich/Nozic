//
//  WYXMusicTool.m
//  Nozic
//
//  Created by Troy-Wu on 17/03/2017.
//  Copyright © 2017 com.LittleTroy. All rights reserved.
//

#import "WYXMusicTool.h"
#import <MJExtension.h>
#import "WYXMusic.h"
#import <AVFoundation/AVFoundation.h>

static WYXMusicTool *class = nil;

@interface WYXMusicTool()



@end

@implementation WYXMusicTool

+(instancetype)sharedMusicTool
{
    @synchronized (self) {
        if (!class) {
            class = [[self alloc] init];//这个方法会调用allocWithZoon
        }
    }
    
    return class;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized (self) {
        if (!class) {
            class = [super allocWithZone:zone]; //确保使用同一块内存地址
            return class;
        }
    }
    
    return  nil;
}

//当前控制器是否在播放音乐
-(void)setIsPlayingMusic:(BOOL)isPlayingMusic
{
    for (WYXMusic *music in _musics) {
        AVAudioPlayer *player = [[self avPlayerDic] valueForKey:music.filename];
        if (music.isSelected) {
            if (isPlayingMusic) {
                [player play];
            }else{
                [player pause];
            }
        }
    }
    _isPlayingMusic = isPlayingMusic;
}


//-(BOOL)isPlayingMusic
//{
//    for (id key in [self avPlayerDic]) {
//        AVAudioPlayer *player = [[self avPlayerDic] valueForKey:key];
//        if ([player isPlaying]) {
//            return YES;
//        }
//    }
//    
//    return NO;
//}

-(void)pushMusic:(NSArray *)pushArr{
    
}


-(NSArray *)musics
{
    if (!_musics) {
        _musics = [WYXMusic
                   mj_objectArrayWithFilename:@"Musics.plist"];
    }
    
    return  _musics;
}

-(NSMutableDictionary *)avPlayerDic
{
    if (!_avPlayerDic) {
        _avPlayerDic = [[NSMutableDictionary alloc] init];
    }
    return _avPlayerDic;
}


@end
