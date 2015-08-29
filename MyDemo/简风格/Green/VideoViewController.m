//
//  VideoViewController.m
//  GreenApple
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 凯哥. All rights reserved.
//

#import "VideoViewController.h"
#import <AFNetworking.h>
#import "JHRefresh.h"
#import "ViodeCell.h"
#import <MediaPlayer/MediaPlayer.h>

#import "CustomViewController.h"
@interface VideoViewController ()

@property(nonatomic,strong)AFHTTPRequestOperationManager *manager;
@property(nonatomic,strong)MPMoviePlayerViewController *mpVC;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDataArr];
    [self createTableView];
    self.title=@"娱乐视频";
    
    self.isRefrech=NO;
    self.isMoreLoad=NO;
    self.currentpage=1;
    [self loadDownWithPage:self.currentpage withUrl:kVideoLaster];
    [self createRefrechView];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btn addTarget:self action:@selector(blackClick) forControlEvents:UIControlEventTouchUpInside];
    btn.tintColor=[UIColor blueColor];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}
-(void)blackClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)createDataArr{
    self.manager=[[AFHTTPRequestOperationManager alloc]init];
    self.manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    self.dataArr=[[NSMutableArray alloc]init];
}
-(void)createTableView{
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ViodeCell" bundle:nil] forCellReuseIdentifier:@"ViodeCell"];
    [self.view addSubview:self.tableView];
}

-(void)createRefrechView{
    __weak typeof (self) weakSelf = self;
    
    [weakSelf.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefrech) {
            return;
        }else{
            weakSelf.isRefrech=YES;
            [weakSelf loadDownWithPage:self.currentpage withUrl:kVideoLaster];
        }
    }];
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isMoreLoad) {
            return;
        }else{
            weakSelf.isMoreLoad=YES;
            weakSelf.currentpage+=1;
            [weakSelf loadDownWithPage:weakSelf.currentpage withUrl:kViode];
            
        }
        
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

-(void)loadDownWithPage:(NSInteger )page withUrl:(NSString *)viodeUrl{
    NSString *url=[NSString stringWithFormat:viodeUrl,page];
    __weak typeof(self)weakSelf=self;
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    [MMProgressHUD showWithTitle:@"加载中" status:@"loading...."];
   
    [weakSelf.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            if ([viodeUrl isEqualToString:kVideoLaster]) {
                [weakSelf.dataArr removeAllObjects];
                NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSArray *lists=dic[@"list"];
                for (NSDictionary *list in lists) {
                    zkkBaseModel *model=[[zkkBaseModel alloc]init];
                    [model setValuesForKeysWithDictionary:list];
                    [self.dataArr addObject:model];
                }
                
            }
            [self.tableView reloadData];
            [self endRefreshing];
            [MMProgressHUD dismissWithSuccess:@"OK" title:@"下载网络数据"];

        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"View下载失败");
         [MMProgressHUD dismissWithError:@"Error" title:@"下载数据"];
        
    }];
    
}

#pragma mark-协议

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   ViodeCell  *cell=[tableView dequeueReusableCellWithIdentifier:@"ViodeCell"forIndexPath:indexPath];
    zkkBaseModel *model=self.dataArr[indexPath.row];
       [cell showVoideWithModel:model];
 
    return cell;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    return (250);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 zkkBaseModel *model=self.dataArr[indexPath.row];
 CustomViewController *vc=[[CustomViewController alloc]initWithContentURL:[NSURL URLWithString:model.videouri]];
   
    [vc.moviePlayer prepareToPlay];
    [vc.moviePlayer play];
    
   [self presentViewController:vc animated:YES completion:nil];
    
//    if (!self.mpVC) {
//    
//        self.mpVC = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:model.videouri]];
//       
//       self.mpVC.moviePlayer.shouldAutoplay = YES;
//    }
//    [self.mpVC.moviePlayer play];
//    
//    [self presentViewController:self.mpVC animated:YES completion:nil];

    
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
