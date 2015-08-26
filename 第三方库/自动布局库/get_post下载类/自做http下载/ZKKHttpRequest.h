//
//  ZKKHttpRequest.h
//  ui分装类
//
//  Created by qianfeng007 on 15/7/16.
//  Copyright (c) 2015年 qianfeng0zk. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^DownloadSuccessBlock)(NSMutableData *download);
typedef void (^DownloadFailedBlock)(NSError *error);

@interface ZKKHttpRequest : NSObject<NSURLConnectionDataDelegate>
{
    NSURLConnection *_httpRequest;
    NSMutableData *_downloadData;
}
@property(nonatomic,strong)NSMutableData *downloadData;
@property(nonatomic,copy)DownloadSuccessBlock mysuccessblock;
@property(nonatomic,copy)DownloadFailedBlock myfailedblock;
- (void)downloadDataWithUrl:(NSString *)urlStr
                    success:(DownloadSuccessBlock)successBlock
                     failed:(DownloadFailedBlock)failedBlock;


@end
