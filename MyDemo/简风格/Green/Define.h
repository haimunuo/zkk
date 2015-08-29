//
//  Define.h
//  GreenApple
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 凯哥. All rights reserved.
//

#ifndef GreenApple_Define_h
#define GreenApple_Define_h

#include "zkkBaseModel.h"

#import "MMProgressHUD.h"
#import "MMRadialProgressView.h"


#define kNewsUrl @"http://ku.m.chinanews.com/forapp/cl/yw/newslist_%ld.xml"


#define kjokesUrl @"http://223.6.252.214/weibofun/weibo_list.php?apiver=10500&category=weibo_jokes&page=%ld&page_size=%ld&max_timestamp=%@"
// 页面从第0页开始30条开始，然后是第1页15条，第2页15条...
// max_timestamp 第0页，或者下拉刷新，值为-1，否则，为最后一个条目的update_time字段的值!(特别注意)
//-1 用于下拉刷新  page == 0 下拉刷新 最多刷新30条
//上拉加载 的时候max_timestamp应该是 数据源中最后一条数据的时间
//默认加载15条

// 评论接口
// fid为对应的wid，category同上
#define kCommentUrl @"http://223.6.252.214/weibofun/comments_list.php?apiver=10600&fid=%@&&category=%@&page=0&page_size=15&max_timestamp=-1"

// 点赞接口，post请求
// fid为对应的wid，category同上
#define kZanUrl @"http://223.6.252.214/weibofun/add_count.php?apiver=10500&vip=1&platform=iphone&appver=1.6&udid=6762BA9C-789C-417A-8DEA-B8D731EFDC0B"
//请求体拼接参数是下面的形式参数
// type=like&category=weibo_girls&fid=30310


//上面接口
#define kfang @"http://www.fang.com/"
#define kqiau @"http://qiqu.uc.cn"
#define kduniang @"https://www.baidu.com/"
#define kganji @"http://www.ganji.com/"
#define kmeituan @"http://www.meituan.com/"
#define kyitao @"http://www.taobao.com/"
#define kymx @"http://www.amazon.cn/"
#define knba @"http://www.zhibo8.cc/"
#define kyouku @"http://www.youku.com/"
#define ksuding @"http://www.suning.com/"
#define kbaixing @"http://www.baixing.com/"
//左下角弧形菜单接口

#define kViode @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie_NEW&asid=5003D997-1FC6-4CD3-B5A4-CAAE76F57887&c=video&client=iphone&from=ios&order=timewarp&page=%ld&per=15"
#define kVideoLaster @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie_NEW&asid=5003D997-1FC6-4CD3-B5A4-CAAE76F57887&c=video&client=iphone&from=ios&order=timelaster&page=%ld&per=15"

#endif
