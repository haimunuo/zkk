//
//  LeftViewController.h
//  Green
//
//  Created by qianfeng on 15/8/19.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController<
UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic) BOOL isRefrech;
@property(nonatomic) BOOL isMoreLoad;
@property(nonatomic) NSInteger currentpage;
@end
