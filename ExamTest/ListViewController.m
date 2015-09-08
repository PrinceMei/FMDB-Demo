//
//  ListViewController.m
//  ExamTest
//
//  Created by Lonely Stone on 15/9/7.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import "ListViewController.h"
#import "alertContactViewController.h"
#import "PeopleDAO.h"

@interface ListViewController (){
    NSMutableArray *_allContactArray;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"通讯录";
    
}

- (void)viewWillAppear:(BOOL)animated{
    _allContactArray = [[NSMutableArray alloc]initWithCapacity:0];
    _allContactArray = [PeopleDAO getAllContactInfo];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allContactArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    People *people = [_allContactArray objectAtIndex:indexPath.row];
    cell.textLabel.text = people.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",people.phoneNumber];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    alertContactViewController *alertVC = [[alertContactViewController alloc]init];
    People *people = [_allContactArray objectAtIndex:indexPath.row];
    alertVC.title = people.name;
    alertVC.receivePeople = people;
    [self.navigationController pushViewController:alertVC animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [PeopleDAO deleteContact:[_allContactArray objectAtIndex:indexPath.row]];
    [_allContactArray removeObjectAtIndex:indexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    
}

- (NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
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
