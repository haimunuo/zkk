//
//  LeftViewController.m
//  Green
//
//  Created by qianfeng on 15/8/19.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import "LeftViewController.h"
#import "newsTableViewCell.h"
#import <AFNetworking.h>
#import "GDataXMLNode.h"
#import "JHRefresh.h"
#import "UIImageView+WebCache.h"
#import "WebView.h"


@interface LeftViewController ()<UINavigationBarDelegate>

@property(nonatomic,strong)AFHTTPRequestOperationManager *manager;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDataArr];
    [self createTableView];
    [self createFrist];
    [self createRefrechView];
    [self createtitle];
//   self.view.backgroundColor=[UIColor colorWithRed:0.3 green:0.8 blue:0.3 alpha:0.5];
    
}
-(void)createtitle{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 300, 44)];
    label.text=@"新闻头条";
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor colorWithRed:0.3 green:0.8 blue:0.3 alpha:0.5];
    [self.view addSubview:label];
    
}
#pragma mark-左右侧栏数据
-(void)createDataArr{
    self.manager=[[AFHTTPRequestOperationManager alloc]init];
    self.manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    self.dataArr=[[NSMutableArray alloc]init];
}
-(void)createTableView{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, 300, self.view.bounds.size.height)];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"newsTableViewCell" bundle:nil] forCellReuseIdentifier:@"newsTableViewCell"];
      [self.view addSubview:self.tableView];
    
}
-(void)createFrist{
    self.isRefrech=NO;
    self.isMoreLoad=NO;
    self.currentpage=1;
    
    [self loadDownWithPage:self.currentpage];
    
}
-(void)loadDownWithPage:(NSInteger )page{
    NSString *url=[NSString stringWithFormat:kNewsUrl,page];
    __weak typeof(self)weakSelf=self;
    
    //下载之前 设置特效
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    //设置 标题
    [MMProgressHUD showWithTitle:@"加载中" status:@"loading...."];
    //下载完成 、失败 要关闭特效
    
    [weakSelf.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            if (weakSelf.currentpage==1) {
                [weakSelf.dataArr removeAllObjects];
            }
            GDataXMLDocument *doc=[[GDataXMLDocument alloc]initWithData:responseObject error:nil];
            NSArray *items=[doc nodesForXPath:@"/root/item" error:nil];
            for (GDataXMLElement *eles in items) {
                NSArray *title=[eles elementsForName:@"title"];
                NSArray *content=[eles elementsForName:@"content"];
                NSArray *pubtime=[eles elementsForName:@"pubtime"];
                NSArray *img=[eles elementsForName:@"img"];
                NSArray *toUrl=[eles elementsForName:@"toUrl"];
                zkkBaseModel *model=[[zkkBaseModel alloc]init];
                model.title=[title[0] stringValue];
                if (![[content[0]stringValue] isEqualToString:@""]) {
                    model.content=[content[0] stringValue];
                }else{
                   
                    model.content=model.title;

                }

                model.pubtime=[pubtime[0] stringValue];;
                model.img=[img[0]stringValue];
                model.toUrl=[toUrl[0]stringValue];
                
                [self.dataArr addObject:model];
            }
            [self.tableView reloadData];
        }
        
        [self endRefreshing];
        [MMProgressHUD dismissWithSuccess:@"OK" title:@"下载网络数据"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"news下载失败");
        
        [MMProgressHUD dismissWithError:@"Error" title:@"下载数据"];
    }];
    
}
- (void)endRefreshing {
    if (self.isRefrech) {
        self.isRefrech = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    if (self.isMoreLoad ) {
        self.isMoreLoad = NO;
        [self.tableView footerEndRefreshing];
    }
}
-(void)createRefrechView{
      __weak typeof (self) weakSelf = self;
    
    [weakSelf.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefrech) {
            return;
        }else{
            
            
            self.isRefrech=YES;
            self.currentpage=1;
            
            [self loadDownWithPage:self.currentpage];
        }

    }];
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isMoreLoad) {
            return;
        }else{
            weakSelf.isMoreLoad=YES;
           weakSelf.currentpage+=1;
            
            [weakSelf loadDownWithPage:weakSelf.currentpage];
        }

    }];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    newsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"newsTableViewCell"forIndexPath:indexPath];
    zkkBaseModel *model=self.dataArr[indexPath.row];
    [cell newsShowWithModel:model];
    cell.backgroundColor=[UIColor colorWithRed:0.3 green:0.7 blue:0.3 alpha:0.3];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebView *webViewNews=[[WebView alloc]init];
    zkkBaseModel *model=self.dataArr[indexPath.row];
    
    webViewNews.contentUrl=model.toUrl;
    
    [self presentViewController:webViewNews animated:YES completion:nil];
   
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
