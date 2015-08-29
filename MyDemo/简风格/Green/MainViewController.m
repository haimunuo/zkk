//
//  MainViewController.m
//  Green apple
//
//  Created by qianfeng on 15/8/10.
//  Copyright (c) 2015年 ZKK. All rights reserved.
//

#import "MainViewController.h"
#import "ImageTool.h"
#import "Webshangtu.h"

#import "VideoViewController.h"
#import "ViewController.h"
#import "ZCZBarViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "AVAudioViewController.h"
@interface MainViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    BOOL _isPath;
    BOOL _isPathM;
   
    NSArray *_xArr;
    NSArray *_yArr;
    NSArray *_xArrM;
    NSArray *_yArrM;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.automaticallyAdjustsScrollViewInsets=NO;
    UILabel *labletitle=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-30, 20, 60, 44)];
  labletitle.text=@"简风格";
    labletitle.textColor=[UIColor colorWithRed:0.3 green:0.6 blue:0.3 alpha:0.8];
     labletitle.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:21];
     self.navigationItem.titleView = labletitle;
  
    UIImage*image=[UIImage imageNamed:@"mm.jpg"];
    self.view.backgroundColor=[UIColor colorWithRed:0.3 green:0.7 blue:0.3 alpha:0.4];
    self.view.backgroundColor=[UIColor colorWithPatternImage:image];
       [self createLeftItem];


    [self createPathMenu];
    [self createMenu];
}
#pragma mark-二维码
-(void)createLeftItem {
    UIButton *rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
[rightButton setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];

[rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
   self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];

}

-(void)rightBtnClick{
    
    ZCZBarViewController *zbar=[[ZCZBarViewController alloc]initWithBlock:^(NSString *str, BOOL isSucceed) {
        if (isSucceed ) {
            NSLog(@"扫描成功");
        }else{
            NSLog(@"扫描失败");
        }
        
    }];
   
    
    [self presentViewController:zbar animated:YES completion:nil];
    
    
}

#pragma mark-创建上方弹出菜单

-(void)createMenu{
 
    _xArr = @[@"20",@"90",@"160",@"230",@"300",@"20",@"90",@"160",@"230",@"300"];
    _yArr = @[@"260",@"260",@"260",@"260",@"260",@"330",@"330",@"330",@"330",@"330"];
//    _xArr = @[@"20",@"80",@"140",@"200",@"260",@"20",@"80",@"140",@"200",@"260"];
//    _yArr = @[@"260",@"260",@"260",@"260",@"260",@"330",@"330",@"330",@"330",@"330"];

    [self creatMenuButton]; 
    
    
}
-(void)creatMenuButton{
    
    self.btnNameArr=@[@"duniang",@"meituan",@"yitao",@"fang",@"yamaxun",@"ganji",@"youku",@"NBA",@"suning",@"baixing"];
    
    for (NSInteger i=0; i<self.btnNameArr.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30, 170, 50, 50);
  
        [btn setImage:[UIImage imageNamed:self.btnNameArr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnMenuDown:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1000+i;
        
        [self.view addSubview:btn];
    }
    _isPath = NO;
    
    UIButton *pathBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pathBtn.frame = CGRectMake(30, 170, 51, 51);
    [pathBtn setImage:[UIImage imageNamed:@"fudai1"] forState:UIControlStateNormal];
    
    [pathBtn addTarget:self action:@selector(pathMenuDown) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pathBtn];
}

-(void)btnMenuDown:(UIButton*)btn{
    switch (btn.tag) {
        case 1000:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=kduniang;
            NSString *str=@"百度";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1001:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=kmeituan;
            NSString *str=@"美团";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1002:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=kyitao;
            NSString *str=@"淘宝";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1003:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=kfang;
            NSString *str=@"搜房";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1004:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=kymx;
            NSString *str=@"亚马逊";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1005:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=kganji;
            NSString *str=@"赶集";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1006:
        {
            Webshangtu *web=[[Webshangtu alloc]init];

            web.contentUrl=kyouku;
            NSString *str=@"优酷";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1007:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=knba;
            NSString *str=@"NBA直播";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1008:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=ksuding;
            NSString *str=@"苏宁易购";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;
        case 1009:
        {
            Webshangtu *web=[[Webshangtu alloc]init];
            web.contentUrl=kbaixing;
            NSString *str=@"百姓";
            [web createTitie:str];
            [self presentViewController:web animated:YES completion:nil];
        }
            break;

        default:
            break;
    }
}

-(void)pathMenuDown
{
    if(_isPath == NO){
        for(int i = 0;i<self.btnNameArr.count;i++){
            UIButton *btn = (UIButton*)[self.view viewWithTag:1000+i];
            [UIView animateWithDuration:0.7 animations:^{
                 btn.frame=CGRectMake(30, 30, 50, 50);
            } completion:nil];
            btn.transform = CGAffineTransformMakeRotation(M_PI);
            [UIView animateWithDuration:2 animations:^{
                btn.frame = CGRectMake([_xArr[i] intValue], [_yArr[i] intValue], 50, 50);
            
                btn.transform = CGAffineTransformMakeRotation(2*M_PI);
            } completion:nil];
        }
        _isPath = YES;
    }else{
        for(int i = 0;i<self.btnNameArr.count;i++){
            UIButton *btn = (UIButton*)[self.view viewWithTag:1000+i];
            [UIView animateWithDuration:0.8 animations:^{
                btn.frame=CGRectMake(30, 40, 50, 50);
            } completion:nil];
            [UIView animateWithDuration:2 animations:^{
                btn.frame = CGRectMake(30, 170, 50, 50);
                
                btn.transform = CGAffineTransformMakeRotation(M_PI);} completion:nil];
        }
        _isPath = NO;
    }
    
}


#pragma mark-创建下角弹出菜单
-(void)createPathMenu{
//    _xArrM = @[@"40",@"80",@"120",@"160"];
//    _yArrM = @[@"450",@"470",@"495",@"525"];
    _xArrM = @[@"40",@"75",@"110",@"140",@"165"];
    _yArrM = @[@"450",@"470",@"495",@"525",@"560"];
//    _xArrM = @[@"40",@"75",@"110",@"140",@"165"];
//    _yArrM = @[@"250",@"270",@"295",@"325",@"360"];
    [self creatButtons];
    
}
-(void)creatButtons{
  
    
   self.btnNameArr=@[@"story-camera",@"phote",@"Viode2",@"story-place",@"story-thought"];
//     self.btnNameArr=@[@"story-camera",@"phote",@"Viode2",@"story-place"];

    for (NSInteger i=0; i<4; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30, self.view.frame.size.height-80, 40, 40);
        [btn setBackgroundImage:[UIImage imageNamed:@"story-button@2x"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:self.btnNameArr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1100+i;

        [self.view addSubview:btn];
    }
    _isPathM = NO;
    
    UIButton *pathBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pathBtn.frame = CGRectMake(30, self.view.frame.size.height-80, 40, 40);
      [pathBtn addTarget:self action:@selector(pathDown:) forControlEvents:UIControlEventTouchUpInside];
    
      [pathBtn setImage:[UIImage imageNamed:@"story-add-button@2x"] forState:UIControlStateNormal];
      [pathBtn setImage:[UIImage imageNamed:@"story-add-button-pressed"] forState:UIControlStateSelected];

  
   
        [self.view addSubview:pathBtn];
}
-(void)btnDown:(UIButton*)btn{
    switch (btn.tag) {
        case 1100:
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                [self loadImagePickerControllerWithType:UIImagePickerControllerSourceTypeCamera];
            }else{
                [self showAlertViewWithTitle:@"警告" message:@"相机不可用"];
            }

        }
            break;
        case 1101:
        {
            [self loadImagePickerControllerWithType:UIImagePickerControllerSourceTypePhotoLibrary];

            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            }else{
                [self showAlertViewWithTitle:@"警告" message:@"相册不可用"];
            }
            
 
        }
            break;
        case 1102:
        {
            VideoViewController *videoView=[[VideoViewController alloc]init];
           
    
            [self.navigationController pushViewController:videoView animated:YES];
           
        
        }
            break;
        case 1103:
        {
            ViewController *Map=[[ViewController alloc]init];
            [self.navigationController pushViewController:Map animated:YES];
           
        }
            break;
//        case 1104:
//        {
//            AVAudioViewController *avide=[[AVAudioViewController alloc]init];
//            
//            [self.navigationController pushViewController:avide animated:YES];
//        }
//            break;
        default:
            break;
    }
}
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

#pragma mark - 加载相册 & 拍照

- (void)loadImagePickerControllerWithType:(UIImagePickerControllerSourceType)type {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];

    imagePicker.sourceType = type;//相册/相机
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;

    [self presentViewController:imagePicker animated:YES completion:nil];
}
#pragma mark - 自己处理 cancel
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    NSString *sourceType = info[UIImagePickerControllerMediaType];
    
    if ([sourceType isEqualToString:(NSString *)kUTTypeImage]) {
        
#if 1
        //编辑图片
        //图片有时比较大(1M~2M)这时我们可以进行压缩
        //图片资源
        //UIImagePickerControllerEditedImage 原始图片
        UIImage *image = info[UIImagePickerControllerEditedImage];
        

        UIImage *newImage = [[ImageTool shareTool] resizeImageToSize:self.view.bounds.size sizeOfImage:image];
        
        self.view.backgroundColor=[UIColor colorWithPatternImage:newImage];
        
#else
        //图片资源
        //UIImagePickerControllerOriginalImage 原始图片
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        //设置为TableView的背景
        self.tableView.backgroundView = [[UIImageView alloc] initWithImage:image];
#endif
    }
    
    [picker  dismissViewControllerAnimated:YES completion:nil];
}

-(void)pathDown:(UIButton *)button
{
    button.selected=!button.selected;
    if(_isPathM == NO){
        for(int i = 0;i<4;i++){
            UIButton *btn = (UIButton*)[self.view viewWithTag:1100+i];
            btn.transform = CGAffineTransformMakeRotation(M_PI);
            [UIView animateWithDuration:1 animations:^{
                btn.frame = CGRectMake([_xArrM[i] intValue], [_yArrM[i] intValue], 40, 40);
                
                btn.transform = CGAffineTransformMakeRotation(2*M_PI);
            } completion:nil];
        }
        _isPathM = YES;
    }else{
        for(int i = 0;i<4;i++){
            UIButton *btn = (UIButton*)[self.view viewWithTag:1100+i];
            [UIView animateWithDuration:1 animations:^{
                btn.frame = CGRectMake(30, self.view.frame.size.height-80, 40, 40);
                
                btn.transform = CGAffineTransformMakeRotation(M_PI);} completion:nil];
        }
        _isPathM = NO;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
