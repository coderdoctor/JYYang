//
//  FinderDetailViewCtrl.m
//  JYang
//
//  Created by kaicaibao on 16/1/18.
//  Copyright © 2016年 kaicaibao. All rights reserved.
//

#import "FinderDetailViewCtrl.h"

@interface FinderDetailViewCtrl ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , weak) IBOutlet UITableView * tableview;

@end

@implementation FinderDetailViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    
    
    // Do any additional setup after loading the view from its nib.
}
#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }
    return cell;
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
