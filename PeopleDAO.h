//
//  PeopleDAO.h
//  ExamTest
//
//  Created by Lonely Stone on 15/9/8.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"

@interface PeopleDAO : NSObject
+ (BOOL)AddContactToTable:(People*)people;
+ (NSMutableArray*)getAllContactInfo;
+ (BOOL)updateInformationFromContact:(People*)people;
+ (BOOL)deleteContact:(People*)people;
@end
