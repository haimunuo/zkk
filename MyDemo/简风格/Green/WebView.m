//
//  WebView.m
//  Green
//
//  Created by qianfeng on 15/8/19.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import "WebView.h"

#import <WebKit/WebKit.h>
#import "MMProgressHUD.h"
#import "MMRadialProgressView.h"
#import <UMSocial.h>

@interface WebView ()<WKNavigationDelegate>
{
    WKWebView *_webView;
}
@property(nonatomic,strong)NSTimer *time;
@end

@implementation WebView

- (void)viewDidLoad {

    [super viewDidLoad];
  
    self.view.backgroundColor=[UIColor whiteColor];
      [self createNav];
    [self createUMScoal];
    _webView =[[WKWebView alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height-60)];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.contentUrl]];
    _webView.navigationDelegate=self;
    [_webView loadRequest:request];
    
    _webView.backgroundColor=[UIColor colorWithRed:0.3 green:0.7 blue:0.3 alpha:0.3];
    
   
    [self.view addSubview:_webView];
    
    
}
-(void)createUMScoal{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-50, 20, 50, 30)];
    [btn setImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(socalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)socalClick{
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"507fcab25270157b37000010" shareText:@"分享你的内容" shareImage:[UIImage imageNamed:@"barck"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,UMShareToQQ,UMShareToWechatSession,nil]delegate:nil];
}
-(void)createNav{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor colorWithRed:0.1 green:0.3 blue:0.1 alpha:0.1];
    label.userInteractionEnabled=YES;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"<返回" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:21];
    
    btn.frame=CGRectMake(0, 0, 60, 35);
    btn.backgroundColor=[UIColor clearColor];
    [btn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
     [label addSubview:btn];
    
    [self.view addSubview:label];
}
-(void)Click{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark-xieyi
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

    if (!self.time) {
        self.time=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updata:) userInfo:nil repeats:YES];
    }
    [MMProgressHUD setProgressViewClass:[MMRadialProgressView  class]];
    [MMProgressHUD showDeterminateProgressWithTitle:@"加载中" status:@"load..."];
}
-(void)updata:(NSTimer *)timer{
    
    [MMProgressHUD updateProgress:_webView.estimatedProgress];
    
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"完成加载");
    if (self.time) {
        [self.time invalidate];
        self.time=nil;
    }
    [MMProgressHUD dismiss];
}
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"加载失败");
    if (self.time) {
        [self.time invalidate];
        self.time=nil;
    }
     [MMProgressHUD dismiss];
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
