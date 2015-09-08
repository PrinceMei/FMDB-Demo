//
//  alertContactViewController.h
//  ExamTest
//
//  Created by Lonely Stone on 15/9/7.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "People.h"
@interface alertContactViewController : UIViewController{
    __weak IBOutlet UITextField *_nameTextField;
    
    __weak IBOutlet UITextField *_phoneNunberTextField;
}
@property(nonatomic,retain)People *receivePeople;

@end
