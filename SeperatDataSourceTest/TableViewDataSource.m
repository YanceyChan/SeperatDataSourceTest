//
//  TableViewDataSource.m
//  SeperatDataSourceTest
//
//  Created by YS_Chan on 15/7/24.
//  Copyright (c) 2015年 YS_Chan. All rights reserved.
//

#import "TableViewDataSource.h"
#import "MyTableViewCell.h"
@interface TableViewDataSource()
@property (copy, nonatomic) NSString *cellIdentifier;
@property (strong, nonatomic) NSArray *items;
@property (copy, nonatomic) TableViewCellConfigureBlock configureBlock;
@end

@implementation TableViewDataSource

- (instancetype)init{
    return nil;
}

- (instancetype)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)configureBlock{
    self = [super init];
    if (self) {
        self.cellIdentifier = aCellIdentifier;
        self.items = anItems;
        self.configureBlock = configureBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return self.items[indexPath.row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
//    /*⬇️使用系统UITableViewCell时，registerNib:这方法不用时，这段不加，崩溃⬇️*/
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:self.cellIdentifier];
//    }
//    /*⬆️使用系统UITableViewCell时，registerNib:这方法不用时，这段不加，崩溃⬆️*/

    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item);
    return cell;
}
@end
