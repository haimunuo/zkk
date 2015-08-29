//
//  ViodeCell.h
//  Green
//
//  Created by qianfeng on 15/8/21.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViodeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titlelable;
@property (weak, nonatomic) IBOutlet UIImageView *Viodeimage;

-(void)showVoideWithModel:(zkkBaseModel *)model;
@end
