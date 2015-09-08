//
//  databaseUtil.h
//  ExamTest
//
//  Created by Lonely Stone on 15/9/7.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface databaseUtil : NSObject
+ (FMDatabase*)sharedDatabase;
@end
