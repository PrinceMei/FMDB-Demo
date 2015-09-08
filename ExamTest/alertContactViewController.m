//
//  alertContactViewController.m
//  ExamTest
//
//  Created by Lonely Stone on 15/9/7.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import "alertContactViewController.h"
#import "PeopleDAO.h"

@interface alertContactViewController ()

@end

@implementation alertContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.frame = CGRectMake(400, 10, 40, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button addTarget:self action:@selector(barButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    
    _nameTextField.text = self.receivePeople.name;
    _phoneNunberTextField.text = [NSString stringWithFormat:@"%d",self.receivePeople.phoneNumber];
}

- (void)barButtonClick{
    self.receivePeople.name = _nameTextField.text;
    self.receivePeople.phoneNumber = [_phoneNunberTextField.text intValue];
    [PeopleDAO updateInformationFromContact:self.receivePeople];
    [self.navigationController popViewControllerAnimated:YES];
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
