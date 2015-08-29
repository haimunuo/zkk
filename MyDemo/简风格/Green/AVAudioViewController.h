//
//  AVAudioViewController.h
//  Green
//
//  Created by qianfeng on 15/8/24.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVAudioViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *stopRecord;
@property (weak, nonatomic) IBOutlet UIButton *pauseRecord;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *stopPlay;
@property (weak, nonatomic) IBOutlet UIButton *pausePlay;

- (IBAction)recordClick:(id)sender;

- (IBAction)playClick:(id)sender;
@end
