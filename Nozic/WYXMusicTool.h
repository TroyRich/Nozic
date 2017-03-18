//
//  WYXMusicTool.h
//  Nozic
//
//  Created by Troy-Wu on 17/03/2017.
//  Copyright © 2017 com.LittleTroy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYXMusicTool : NSObject

/** 应用程序配置的音乐 */
@property (nonatomic,strong) NSArray *musics;

+(instancetype)sharedMusicTool;


@end
