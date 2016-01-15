//
//  DataMode.h
//  JY
//
//  Created by kaicaibao on 16/1/7.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataMode : NSObject
@property (nonatomic , assign) int id;
@property (nonatomic , copy) NSString * title;
@property (nonatomic , assign) int type;
@property (nonatomic , assign) BOOL more;
@property (nonatomic , strong) NSArray * sub;

@end
