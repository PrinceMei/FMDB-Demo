//
//  modalViewController.m
//  ExamTest
//
//  Created by Lonely Stone on 15/9/8.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import "modalViewController.h"
#import "PeopleDAO.h"

@interface modalViewController ()

@end

@implementation modalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _stateBarView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)submitButtonClick:(id)sender {
    People *people = [[People alloc]init];
    people.name = _nameTextField.text;
    people.phoneNumber = [_phoneNumberTextField.text intValue];
    if ([PeopleDAO AddContactToTable:people]) {
        NSLog(@"okok");
    }

    [self dismissViewControllerAnimated:YES completion:nil];
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
