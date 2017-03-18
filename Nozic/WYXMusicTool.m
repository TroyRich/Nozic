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


-(NSArray *)musics
{
    if (!_musics) {
        _musics = [WYXMusic
                   mj_objectArrayWithFilename:@"Musics.plist"];
    }
    
    return  _musics;
}

@end
