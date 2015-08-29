//
//  newsTableViewCell.h
//  Green
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titlelable;
@property (weak, nonatomic) IBOutlet UILabel *pubtimelable;
@property (weak, nonatomic) IBOutlet UILabel *contentlable;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
-(void)newsShowWithModel:(zkkBaseModel*)model;
@end
