//
//  zkkBaseModel.h
//  Green
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface zkkBaseModel : NSObject
//左侧新闻接口
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *img;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *pubtime;
@property(nonatomic,strong)NSString *toUrl;

//右下视频接口
@property(nonatomic,strong)NSString *text;
@property(nonatomic,strong)NSString *videouri;
@property(nonatomic,strong)NSString *bimageuri;
@property(nonatomic,strong)NSString *height;
@property(nonatomic,strong)NSString *width;
/*
 "id": "15253011",
 "type": "41",
 "text": "如此流弊的削苹果，我看了一遍又一遍。。能问下那又卖么？",
 "user_id": "12161818",
 "name": "简、美\\~晴天—",
 "screen_name": "简、美\\~晴天—",
 "profile_image": "http://wimg.spriteapp.cn/picture2/M00/0C/0D/wKiFRlRWHMqAT33QAAAQY2Qi2dg.cn_qqa",
 "created_at": "2015-08-22 11:15:02",
 "create_time": "2015-08-21 15:14:08",
 "passtime": "2015-08-22 11:15:02",
 "love": "1483",
 "hate": "65",
 "comment": "32",
 "repost": "295",
 "bookmark": "318",
 "bimageuri": "http://wimg.spriteapp.cn/picture/2015/0821/55d6cfc145c8c_wpd.jpg",
 "voiceuri": "",
 "voicetime": "0",
 "voicelength": "0",
 "status": "4",
 "theme_id": "0",
 "theme_name": "",
 "theme_type": "0",
 "videouri": "http://wvideo.spriteapp.cn/video/2015/0821/55d6cfc145c8c_wpd.mp4",
 "videotime": "47",
 "original_pid": "0",
 "cache_version": 2,
 "playcount": 23618,
 "playfcount": 13464,
 "cai": "65",
 "top_cmt": [],
 "weixin_url": "http://15253011-x.f.budejie.com/budejie/land.php?pid=15253011&wx.qq.com&appname=",
 "themes": [],
 "image1": "http://wimg.spriteapp.cn/picture/2015/0821/55d6cfc145c8c_wpd.jpg",
 "image2": "http://wimg.spriteapp.cn/picture/2015/0821/55d6cfc145c8c_wpd.jpg",
 "is_gif": "0",
 "image0": "http://wimg.spriteapp.cn/picture/2015/0821/55d6cfc145c8c_wpd.jpg",
 "image_small": "http://wimg.spriteapp.cn/picture/2015/0821/55d6cfc145c8c_wpd.jpg",
 "cdn_img": "http://wimg.spriteapp.cn/picture/2015/0821/55d6cfc145c8c_wpd.jpg",
 "width": "204",
 "height": "362",
 "tag": "",
 "t": 1440213302,
 "ding": "1483",
 "favourite": "318"
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
