//
//  ZKKHttpRequest.m
//  ui分装类
//
//  Created by qianfeng007 on 15/7/16.
//  Copyright (c) 2015年 qianfeng0zk. All rights reserved.
//

#import "ZKKHttpRequest.h"


@implementation ZKKHttpRequest
-(instancetype)init{

    self.downloadData=[[NSMutableData alloc]init];
    return self;
}
-(void)downloadDataWithUrl:(NSString *)urlStr success:(DownloadSuccessBlock)successBlock failed:(DownloadFailedBlock)failedBlock{

    if (_httpRequest) {
        [_httpRequest cancel];
        _httpRequest=nil;
    }
    self.mysuccessblock=successBlock;
    self.myfailedblock=failedBlock;
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    _httpRequest=[[NSURLConnection alloc]initWithRequest:request delegate:self];
    
  
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.downloadData setLength:0];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{

    [self.downloadData appendData:data];
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if (self.mysuccessblock) {
        self.mysuccessblock(self.downloadData);
    }
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (self.myfailedblock) {
        self.myfailedblock(error);
    }
    
}
@end
