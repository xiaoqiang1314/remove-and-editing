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
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
/**所有的模型数据*/
@property (strong ,nonatomic) NSMutableArray *modelArr;
/**删除数组*/
@property (nonatomic, strong) NSMutableArray *deletedArr;
/**分组数组*/
@property (strong ,nonatomic) NSMutableArray *sectionArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab.delegate =self;
    self.tab.dataSource = self;
    self.tab.allowsMultipleSelectionDuringEditing = YES;
    self.removeBtn.hidden=YES;
    self.allBtn.hidden = YES;
}
-(NSMutableArray *)modelArr{
    if (!_modelArr) {
        //保存模型数据
        _modelArr = [NSMutableArray  arrayWithObjects:@"我是第1行数据",@"我是第2行数据",@"我是第3行数据",@"我是第4行数据",@"我是第5行数据",@"我是第6行数据",@"我是第7行数据",@"我是第8行数据",@"我是第9行数据",@"我是第10行数据",@"我是第11行数据",@"我是第12行数据",@"我是第13行数据",@"我是第14行数据",@"我是第15行数据",@"我是第16行数据",@"我是第17行数据",@"我是第18行数据", nil];
    }
   
    return _modelArr;
}

-(NSMutableArray *)sectionArr{
    if (!_sectionArr) {
        _sectionArr = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F", nil];

       }
    return _sectionArr;
}
//批量删除
- (IBAction)deleteClick:(id)sender {
    [self.tab setEditing:!self.tab.isEditing animated:YES];
    self.removeBtn.hidden  =!self.tab.isEditing;
    self.allBtn.hidden  =!self.tab.isEditing;
}

//删除
- (IBAction)deleteBtn:(id)sender {

//    //所有被选中的行数
    NSArray *arr=[self.tab indexPathsForSelectedRows];
    _deletedArr = [NSMutableArray array];
    
    for (NSIndexPath *indexPath in arr) {
        //将选中行数模型数据保存到一个数组中
//        NSLog(@"组=%ld 行=%ld",indexPath.section,indexPath.row);
         NSLog(@"shu=%@",self.modelArr[indexPath.row]);
        [self.deletedArr addObject:self.modelArr[indexPath.row]];
    }
    
    [self.modelArr removeObjectsInArray:self.deletedArr];
    [self.tab reloadData];
}
//全选  有bug
- (IBAction)allSelection:(UIButton *)sender {
//    [self.tab setEditing:!self.tab.isEditing animated:YES];
    for (int i =0; i<self.modelArr.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [self.tab selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        [self.deletedArr addObjectsFromArray:self.modelArr];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"数组=%lu",(unsigned long)self.sectionArr.count);
    return self.sectionArr.count;
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
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionArr[section];
}


@end
