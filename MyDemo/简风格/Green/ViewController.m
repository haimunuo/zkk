//
//  ViewController.m
//  Demo2-MapDemo
//
//  Created by LZXuan on 15-7-30.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import "ViewController.h"
//导入头文件
#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>



@interface ViewController () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) MKMapView *mapView;//地图
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //地图
    [self initMapView];

    self.title=@"当前地图定位";

    for (NSInteger i = 0; i < 1; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(20+100*i, self.view.bounds.size.height-90, 50, 50);
        
        [button setBackgroundImage:[UIImage imageNamed:@"story-add-button"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"story-place"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 101+i;
        [self.view addSubview:button];
    }
}
-(void)createLable{
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 30)];
    lable.text=[NSString stringWithFormat:@"当前经度:%lf 纬度:%lf",self.mapView.userLocation.coordinate.longitude,self.mapView.userLocation.coordinate.latitude];
    lable.textAlignment=UITextAlignmentCenter;
    lable.backgroundColor=[UIColor blackColor];
    lable.textColor=[UIColor whiteColor];
    [self.view addSubview:lable];
}
- (void)btnClick:(UIButton *)button {
    switch (button.tag) {
        case 102:
        {
            CLLocationCoordinate2D coordinate = self.mapView.region.center;
            coordinate.latitude += 0.01;
            coordinate.longitude += 0.01;
            //修改区域中心点
            [self.mapView setCenterCoordinate:coordinate animated:YES];
        }
            break;
        case 101:
        {
            //获取当前用户的位置
            CLLocation *location =  self.mapView.userLocation.location;
            //回到用户位置
            [self.mapView setCenterCoordinate:location.coordinate animated:YES];
                [self createLable];
       
        }
            break;
            
               default:
            break;
    }
}
#pragma mark - 定位
- (void)initManager {
    if (self.manager) {
        return;
    }
    self.manager = [[CLLocationManager alloc] init];
#ifdef __IPHONE_8_0 //判断版本
    if ([self.manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        //有 就调用
        [self.manager performSelector:@selector(requestAlwaysAuthorization)];
    }
    self.manager.delegate = self;
#endif
}
//定位 位置改变之后调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  
}
#pragma mark - 地图
/*
 MKMapTypeStandard = 0,//标准地图
 MKMapTypeSatellite,//卫星地图
 */
- (void)initMapView {
    [self initManager];//需要定位 就调用
    //实例化 地图
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 94, self.view.bounds.size.width, self.view.bounds.size.height-94)];
    self.mapView.mapType = MKMapTypeStandard;
    //设置地图显示的 区域 (给一个中心位置)
    // 给一个 经纬度 和 缩放比例(0.01---0.05)
    //34.77274892, 113.67591140
    //获取当前用户的位置
    CLLocation  *location =  self.mapView.userLocation.location;
    //回到用户位置
    [self.mapView setCenterCoordinate:location.coordinate animated:YES];
   
    self.mapView.region = MKCoordinateRegionMake(self.mapView.userLocation.location.coordinate, MKCoordinateSpanMake(0.01, 0.01));
    //是否显示 用户位置
    self.mapView.showsUserLocation = YES;
    
    //粘贴地图
    [self.view addSubview:self.mapView];
        [self createLable];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
