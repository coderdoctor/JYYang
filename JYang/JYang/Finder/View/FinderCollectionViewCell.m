//
//  FinderCollectionViewCell.m
//  JYang
//
//  Created by kaicaibao on 16/1/8.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import "FinderCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "SubMode.h"
#import "DataMode.h"

@implementation FinderCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

//重写
+(instancetype)collectionCell:(UICollectionView *)collectionView numberOfItemsInSection:(NSIndexPath *)indexPath{
    static NSString *cellID=@"finderFirst";
    FinderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}



#pragma mark 重写DataMode的set方法
-(void)setDataMode:(DataMode *)dataMode{
    if (_dataMode != dataMode) {
        _dataMode = dataMode;
    }
    
}

#pragma mark 重写SubMode的set方法
-(void)setSubMode:(SubMode *)subMode{
    if (_subMode != subMode) {
        _subMode  = subMode;
    }
    if (_dataMode.more == true) {
        [self.imgBgview sd_setImageWithURL:[NSURL URLWithString:_subMode.pic] placeholderImage:nil];
        self.lbName.hidden = NO;
        self.lbName.text = [NSString stringWithFormat:@"%@",_subMode.title];
        self.lbLoadName.hidden = NO;
        self.lbLoadName.text = [NSString stringWithFormat:@"%@.%@",_subMode.countryCn,_subMode.cityCn];
        self.lbfalseName.hidden = YES;
    }else{
        [self.imgBgview sd_setImageWithURL:[NSURL URLWithString:_subMode.banner] placeholderImage:nil];
        self.lbfalseName.text = [NSString stringWithFormat:@"%@",_subMode.title];
        self.lbLoadName.hidden = YES;
        self.lbName.hidden = YES;
        self.lbfalseName.hidden = NO;
    }
    
 
    
    
}






@end
