//
//  databaseUtil.m
//  ExamTest
//
//  Created by Lonely Stone on 15/9/7.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import "databaseUtil.h"
#import <sqlite3.h>

@implementation databaseUtil

+ (FMDatabase*)sharedDatabase{
    static FMDatabase *db = nil;
    if (db == nil) {
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/contact.sqlite"];
        db = [[FMDatabase alloc]initWithPath:path];
    }
    return db;
}
@end
