//
//  AVAudioViewController.m
//  Green
//
//  Created by qianfeng on 15/8/24.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import "AVAudioViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface AVAudioViewController ()<AVAudioRecorderDelegate>
{
    AVAudioRecorder *_recoder;  //录音
    AVAudioPlayer *_player;
}

@end

@implementation AVAudioViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"录音播放机";
    
    self.recordButton.tag = 101;
    self.stopRecord.tag = 102;
    self.pauseRecord.tag = 103;
  
    
    self.playButton.tag = 201;
    self.stopPlay.tag = 202;
    self.pausePlay.tag = 203;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 101://录音
        {
            if (!_recoder) {
                //沙盒路径
                NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/myTest.caf"];//保存录音文件的路径
                
                //第二个参数：录音相关设置
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                //1.设置录音格式:AVFormatIDKey
                [dict setObject:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
                //2.设置录音采样速率:AVSampleRateKey 8000/44100/96000
                [dict setObject:[NSNumber numberWithInt:44100] forKey:AVSampleRateKey];
                //3.设置录音质量:AVEncoderAudioQualityKey
                [dict setObject:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
                //4.设置线性采样位数:AVLinearPCMBitDepthKey 8/16/24
                [dict setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
                //5.录音通道:AVNumberOfChannelsKey 1/2
                [dict setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
                
                //音频会话
                //
                AVAudioSession *session = [AVAudioSession sharedInstance];
                [session setCategory:AVAudioSessionCategoryRecord error:nil];
                [session setActive:YES error:nil];
                //录音对象
                _recoder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:path] settings:dict error:nil];
                //设置代理
                _recoder.delegate = self;
            }
            [_recoder prepareToRecord];
            [_recoder record];
        }
            break;
        case 102://停止
        {
            [_recoder stop];
        }
            break;
        case 103://暂停
        {
            [_recoder pause];
        }
            break;
            
        default:
            break;
    }
    
    
}
#pragma mark - AVAudioRecorderDelegate相关
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    NSLog(@"录音完毕");
    
}
-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error{
    NSLog(@"出错");
    NSLog(@"error:%@",error);
}
-(void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder{
    NSLog(@"中断开始");
}
-(void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder withOptions:(NSUInteger)flags{
    NSLog(@"中断结束");
    //中断结束后，
    //判断是否要恢复录音/播放
    if (flags == AVAudioSessionInterruptionOptionShouldResume) {
        [_recoder record];
    }
}



- (IBAction)playClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 201://播放
        {
            
            if (!_player) {
                NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/myTest.caf"];
                _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            }
            [_player play];
        }
            break;
        case 202://停止
        {
            [_player stop];
        }
            break;
        case 203://暂停
        {
            [_player pause];
        }
            break;
            
        default:
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
