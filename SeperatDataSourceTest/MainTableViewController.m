//
//  MainTableViewController.m
//  SeperatDataSourceTest
//
//  Created by YS_Chan on 15/7/24.
//  Copyright (c) 2015年 YS_Chan. All rights reserved.
//

#import "MainTableViewController.h"
#import "MyModel.h"
#import "MyTableViewCell.h"
#import "TableViewDataSource.h"
static NSString * const cellIdentifier = @"myCell";
@interface MainTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTabelView;
@property (strong, nonatomic) NSArray *myModels;
@property (strong, nonatomic) TableViewDataSource *dataSoures;@end

@implementation MainTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMyDataArray];
    self.myModels = [self createMyDataArray];
    
    //使用系统的UITableViewCell时
//    TableViewCellConfigureBlock cellConfigureBlock = ^(UITableViewCell *cell, MyModel *item){
//        cell.textLabel.text = item.name;
//        cell.detailTextLabel.text = item.age;
//    };
//    [self.myTabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    //使用自定义cell时
    TableViewCellConfigureBlock cellConfigureBlock = ^(MyTableViewCell *cell, MyModel *item){
        //将item应用到cell上的方法
        [cell configureCellWithModel:item];
    };
    [self.myTabelView registerNib:[MyTableViewCell nib] forCellReuseIdentifier:cellIdentifier];
    self.dataSoures = [[TableViewDataSource alloc]initWithItems:self.myModels cellIdentifier:cellIdentifier configureCellBlock:cellConfigureBlock];
    self.myTabelView.dataSource = self.dataSoures;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - createDataArray
- (NSArray *)createMyDataArray{
    MyModel *jack = [[MyModel alloc]initWithName:@"jack" Age:@"20" Address:@"southStree 17" Identifier:@"1"];
    MyModel *jone = [[MyModel alloc]initWithName:@"jone" Age:@"21" Address:@"north 18" Identifier:@"2"];
    MyModel *may = [[MyModel alloc]initWithName:@"may" Age:@"19" Address:@"westStree 20" Identifier:@"3"];
    MyModel *tony = [[MyModel alloc]initWithName:@"tony" Age:@"18" Address:@"eastStreet" Identifier:@"4"];
    MyModel *marry = [[MyModel alloc]initWithName:@"marry" Age:@"20" Address:@"nononStreet" Identifier:@"5"];
    NSArray *myModels = @[jack, jone, may, tony, marry];
    return myModels;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc]init];
//    return view;
//}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}

@end
