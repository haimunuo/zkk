//
//  VideoViewController.h
//  GreenApple
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 凯哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic) BOOL isRefrech;
@property(nonatomic) BOOL isMoreLoad;
@property(nonatomic) NSInteger currentpage;


@end
