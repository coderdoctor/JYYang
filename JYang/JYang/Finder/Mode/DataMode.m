//
//  DataMode.m
//  JY
//
//  Created by kaicaibao on 16/1/7.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import "DataMode.h"
#import "SubMode.h"

#import <MJExtension.h>

@implementation DataMode

+(NSDictionary *)mj_objectClassInArray{
    
        return @{
                 @"sub" : @"SubMode"
                 };
}
@end
