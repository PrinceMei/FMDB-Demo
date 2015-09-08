//
//  ListViewController.h
//  ExamTest
//
//  Created by Lonely Stone on 15/9/7.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    __weak IBOutlet UITableView *_tableView;
}

@end
