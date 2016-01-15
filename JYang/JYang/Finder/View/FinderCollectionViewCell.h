//
//  FinderCollectionViewCell.h
//  JYang
//
//  Created by kaicaibao on 16/1/8.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataMode;
@class SubMode;

@interface FinderCollectionViewCell : UICollectionViewCell
/**模型*/
@property (nonatomic , strong) DataMode * dataMode;
@property (nonatomic , strong) SubMode  * subMode;
/**背景图片*/
@property (nonatomic , weak) IBOutlet UIImageView * imgBgview;
/**名称*/
@property (nonatomic , weak) IBOutlet UILabel * lbName;
/**地址图标*/
@property (nonatomic , weak) IBOutlet UIImageView * imgLoadView;
/**地址名称*/
@property (nonatomic , weak) IBOutlet UILabel * lbLoadName;
/**当more为false时，标题*/
@property (nonatomic , weak) IBOutlet UILabel * lbfalseName;
+(instancetype)collectionCell:(UICollectionView *)collectionView numberOfItemsInSection:(NSIndexPath *)indexPath;
@end
