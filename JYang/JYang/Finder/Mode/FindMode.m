//
//  FindMode.m
//  JY
//
//  Created by kaicaibao on 16/1/7.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import "FindMode.h"
#import "DataMode.h"
#import <MJExtension.h>

@implementation FindMode
+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"data" : @"DataMode"
             
             };
}
@end
