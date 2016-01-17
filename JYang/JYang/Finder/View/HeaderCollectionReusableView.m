//
//  HeaderCollectionReusableView.m
//  JYang
//
//  Created by kaicaibao on 16/1/17.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@interface HeaderCollectionReusableView ()

//题目
@property (nonatomic, weak) IBOutlet UILabel * nameLable;

//最右边图片
@property (nonatomic , weak) IBOutlet UILabel * lbimage;

@end

@implementation HeaderCollectionReusableView

- (void)awakeFromNib {
    [_lbimage setBackgroundColor:[UIColor greenColor]];
    //设置圆角
    _lbimage.layer.cornerRadius = 3;
    _lbimage.layer.masksToBounds = YES;
    // Initialization code
}

- (void)setModel:(DataMode *)model
{
    self.nameLable.text = model.title;
}

@end
