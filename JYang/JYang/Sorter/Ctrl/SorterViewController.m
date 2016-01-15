//
//  SorterViewController.m
//  JY
//
//  Created by kaicaibao on 15/12/29.
//  Copyright © 2015年 kaicaibao. All rights reserved.
//

#import "SorterViewController.h"
#import "SorterCell.h"
#import <MobClick.h>


@interface SorterViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/**网格*/
@property (nonatomic , weak) IBOutlet UICollectionView * collection;


@end

@implementation SorterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.title = @"分类";
    _collection.delegate   = self;
    _collection.dataSource = self;
    
    
    
    //为UICollectionView注册单元格
    UINib *nibCell=[UINib nibWithNibName:@"SorterCell" bundle:[NSBundle mainBundle]];
    [_collection registerNib:nibCell forCellWithReuseIdentifier:@"Sorter"];
    
}
#pragma mark 网络请求
-(void)httpRequest{



}



#pragma mark 友盟统计
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick event:@"AAAAA"];
    [MobClick beginLogPageView:@"SorterViewController"];//("PageOne"为页面名称，可自定义)
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"SorterViewController"];
}



#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"Sorter";
    SorterCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.lbSortBgName.text=@"未知";
    return cell;
}

#pragma mark UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout: (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath  {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/3-10, 115);
}
//该方法返回值决定每行之间的间隔像素
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
//该方法返回值决定每列之间的间隔像素
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
////该方法返回值决定每个单元格与上、下、左、右的间距
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout: (UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
////UIEdgeInsets insets = {top, left, bottom, right};
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//
//}
//当用户点击单元格时触发该方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath: (NSIndexPath *)indexPath{
    NSLog(@" 户点击了第%li个单元格",indexPath.row);  }


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
