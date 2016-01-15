//
//  SubMode.h
//  JY
//
//  Created by kaicaibao on 16/1/7.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubMode : NSObject
@property (nonatomic , assign) int infoId;
@property (nonatomic , copy)   NSString * title;
@property (nonatomic , copy)   NSString * pic;
@property (nonatomic , copy)   NSString * countryCn;
@property (nonatomic , copy)   NSString * cityCn;
@property (nonatomic , assign) int isSelf;
@property (nonatomic , assign) int top;

@property (nonatomic , assign) int id;
//@property (nonatomic , copy)   NSString * title;
@property (nonatomic , copy)   NSString * banner;
@end
