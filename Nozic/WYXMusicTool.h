//
//  WYXMusicTool.h
//  Nozic
//
//  Created by Troy-Wu on 17/03/2017.
//  Copyright © 2017 com.LittleTroy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AVAudioPlayer;

@interface WYXMusicTool : NSObject

/** 应用程序配置的音乐 */
@property (nonatomic,strong) NSArray *musics;

/** 音频播放 */
@property (nonatomic,strong) NSMutableDictionary *avPlayerDic;


+(instancetype)sharedMusicTool;

-(BOOL)isPlayMusic;

-(void)pushMusic:(NSArray *)pushArr;


@end
