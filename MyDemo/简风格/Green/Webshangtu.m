//
//  Webshangtu.m
//  Green
//
//  Created by qianfeng on 15/8/25.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import "Webshangtu.h"
#import <WebKit/WebKit.h>

@interface Webshangtu ()
{
    WKWebView *_webView;
}
@end

@implementation Webshangtu

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
    _webView =[[WKWebView alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height-60)];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.contentUrl]];
  
    [_webView loadRequest:request];
    
    _webView.backgroundColor=[UIColor colorWithRed:0.3 green:0.7 blue:0.3 alpha:0.3];
  
    [self.view addSubview:_webView];
}
-(void)Click{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)createNav{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor colorWithRed:0.1 green:0.3 blue:0.1 alpha:0.3];
    label.userInteractionEnabled=YES;
    label.tag=12;
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"<返回" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:20];
    
    btn.frame=CGRectMake(0, 5, 60, 35);
    btn.backgroundColor=[UIColor clearColor];
    [btn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [label addSubview:btn];
    
    [self.view addSubview:label];
}
-(void)createTitie:(NSString *)name{
    UILabel *labletitel=(UILabel *)[self.view viewWithTag:12];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-25, 0, 100, 40)];
     label.font=[UIFont systemFontOfSize:20];
    label.textColor=[UIColor greenColor];
    label.text=name;
    [labletitel addSubview:label];
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
