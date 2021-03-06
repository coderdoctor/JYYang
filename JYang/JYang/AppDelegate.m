//
//  AppDelegate.m
//  JYang
//
//  Created by kaicaibao on 16/1/8.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import "AppDelegate.h"
#import "FinderViewController.h"
#import "SorterViewController.h"
#import "MyerViewController.h"
#import <MobClick.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //友盟统计
    [MobClick startWithAppkey:@"568f3b1b67e58e07a0000fe0" reportPolicy:BATCH   channelId:nil];
    
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_window setBackgroundColor:[UIColor whiteColor]];
    
    //发现
    FinderViewController * findCtrl =[[FinderViewController alloc]init];
    findCtrl.tabBarItem.title = @"发现";
    findCtrl.tabBarItem.image = [UIImage imageNamed:@""];
    
    //分类
    SorterViewController * sortCtrl = [[SorterViewController alloc]init];
    sortCtrl.tabBarItem.title = @"分类";
    sortCtrl.tabBarItem.image = [UIImage imageNamed:@""];
    
    //我的
    MyerViewController   * myerCtrl = [[MyerViewController alloc]init];
    myerCtrl.tabBarItem.title = @"我的";
    myerCtrl.tabBarItem.image = [UIImage imageNamed:@""];
    
    //设置为标签页
    UITabBarController * tabbar = [[UITabBarController alloc]init];
    tabbar.viewControllers      = @[findCtrl,sortCtrl,myerCtrl];
    tabbar.tabBar.tintColor     = [UIColor greenColor];
    //设置导航
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:tabbar];
    //    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    _window.rootViewController = nav;

    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
