//
//  FinderViewController.m
//  JY
//
//  Created by kaicaibao on 15/12/29.
//  Copyright © 2015年 kaicaibao. All rights reserved.
//

#import "FinderViewController.h"
#import <MobClick.h>
#import <AFNetworking.h>
#import "FindMode.h"
#import "DataMode.h"
#import "SubMode.h"
#import "FinderCollectionViewCell.h"
#import "MJExtension.h"
#import "HeaderCollectionReusableView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface FinderViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic , weak) IBOutlet UICollectionView * collectionView;
@property (nonatomic , strong) NSMutableArray * findDateArray;//分组的页眉
@property (nonatomic , strong) NSMutableArray  * subArray;//分组的内容
@property (nonatomic , strong) FindMode * findMode;
@property (nonatomic , strong) DataMode * dataMode;
@property (nonatomic , strong) SubMode  * subMode;
@property (nonatomic , strong) UILabel  * lbName;
@end

@implementation FinderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.title = @"发现";
    
    _findDateArray = [NSMutableArray array];
    _subArray      = [NSMutableArray array];
    //注册网格cell
    self.collectionView.delegate   = self;
    self.collectionView.dataSource = self;
    
    UINib * nibCell = [UINib nibWithNibName:@"FinderCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nibCell forCellWithReuseIdentifier:@"finderFirst"];
    //设置页眉尺寸
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    collectionViewLayout.headerReferenceSize = CGSizeMake(300, 40);
    //注册页眉
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HeaderCollectionReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    //网络请求
    [self httpRequest];
}
#pragma mark 网络请求
-(void)httpRequest{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://v23appapi.hivetrips.com/index/list" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //        NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        _findMode = [FindMode mj_objectWithKeyValues:dic];
        [_findDateArray addObjectsFromArray:_findMode.data];
        
        
        [_collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}




#pragma mark 友盟统计
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"FinderViewController"];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"FinderViewController"];
}

#pragma  mark UIScrollView
//分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _findDateArray.count;
}
//该方法返回值决定每个单元格的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout: (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == _findDateArray.count-2) {
        return CGSizeMake(SCREEN_WIDTH/2-14, 200);
    }
    return CGSizeMake(SCREEN_WIDTH, 200);
}

//该 法返回值决定每个单元格与上、下、左、右的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout: (UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //    UIEdgeInsets insets = {top, left, bottom, right};
    return UIEdgeInsetsMake((SCREEN_WIDTH-((SCREEN_WIDTH/2-12)*2))/3, (SCREEN_WIDTH-((SCREEN_WIDTH/2-12)*2))/3, (SCREEN_WIDTH-((SCREEN_WIDTH/2-12)*2))/3, (SCREEN_WIDTH-((SCREEN_WIDTH/2-12)*2))/3);
    
}
//每个分组的items
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //    _subArray = [];
    return  ((DataMode *)[_findDateArray objectAtIndex:section]).sub.count;
    
}


//显示网格内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FinderCollectionViewCell * cell = [FinderCollectionViewCell collectionCell:collectionView numberOfItemsInSection:indexPath];
    
    cell.dataMode  = [_findDateArray objectAtIndex:indexPath.section];
    cell.subMode = [cell.dataMode.sub objectAtIndex:indexPath.row];
    
    return cell;
}


//设置页眉
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        
        
        DataMode *dataMode  = [_findDateArray objectAtIndex:indexPath.section];
        headerView.model = dataMode;
        
        
        return headerView;
    }
    
    
    return nil;
    
    
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
