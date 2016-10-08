//
//  ViewController.m
//  批量删除
//
//  Created by strong on 16/10/8.
//  Copyright © 2016年 strong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tab;
/**所有的模型数据*/
@property (strong ,nonatomic) NSMutableArray *modelArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab.delegate =self;
    self.tab.dataSource = self;
    self.tab.allowsMultipleSelectionDuringEditing = YES;
}
-(NSMutableArray *)modelArr{
    if (!_modelArr) {
        //保存模型数据
        _modelArr = [NSMutableArray  arrayWithObjects:@"我是第1行数据",@"我是第2行数据",@"我是第3行数据",@"我是第4行数据",@"我是第5行数据",@"我是第6行数据",@"我是第7行数据",@"我是第8行数据",@"我是第9行数据",@"我是第10行数据",@"我是第11行数据",@"我是第12行数据",@"我是第13行数据",@"我是第14行数据",@"我是第15行数据",@"我是第16行数据",@"我是第17行数据",@"我是第18行数据", nil];
    }
   
    return _modelArr;
}
- (IBAction)deleteClick:(id)sender {
    [self.tab setEditing:!self.tab.isEditing animated:YES];
}
- (IBAction)deleteBtn:(id)sender {
    //所有被选中的行数
    NSArray *arr=[self.tab indexPathsForSelectedRows];
    NSMutableArray *deletedArr = [NSMutableArray array];
    for (NSIndexPath *path in arr) {
        //将选中行数模型数据保存到一个数组中
        [deletedArr addObject:self.modelArr[path.row]];
    }
    
    [self.modelArr removeObjectsInArray:deletedArr];
    [self.tab reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text =self.modelArr[indexPath.row];
    return cell;
}
@end
