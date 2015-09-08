//
//  PeopleDAO.m
//  ExamTest
//
//  Created by Lonely Stone on 15/9/8.
//  Copyright (c) 2015年 Lonely Stone. All rights reserved.
//

#import "PeopleDAO.h"
#import "databaseUtil.h"

@implementation PeopleDAO
+ (BOOL)AddContactToTable:(People*)people{
    BOOL success;
    FMDatabase *db = [databaseUtil sharedDatabase];
    if (![db open]) {
        [db close];
        return NO;
    }
    success = [db executeUpdate:@"INSERT INTO contact(name , phoneNumber) VALUES (? , ?) ",people.name,@(people.phoneNumber)];
    return success;
}

+ (NSMutableArray*)getAllContactInfo{
    FMDatabase *db = [databaseUtil sharedDatabase];
    if (![db open]) {
        [db close];
        return nil;
    }
    [db setShouldCacheStatements:YES];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    
    FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM contact "];
    while ([resultSet next]) {
        People *people = [[People alloc]init];
        people.name = [resultSet stringForColumn:@"name"];
        people.phoneNumber = [resultSet intForColumn:@"phoneNumber"];
        people.cId = [resultSet intForColumn:@"id"];
        [array addObject:people];
    }
    [resultSet close];
    [db close];
    return array;
    
}

+ (BOOL)updateInformationFromContact:(People*)people{
    BOOL success;
    FMDatabase *db = [databaseUtil sharedDatabase];
    if (![db open]) {
        [db close];
        return NO;
    }
    success = [db executeUpdate:@"UPDATE contact SET name = (?), phoneNumber = (?) WHERE id = (?)",people.name,@(people.phoneNumber), @(people.cId)];
    [db close];
    return success;
}

+ (BOOL)deleteContact:(People*)people{
    BOOL success;
    FMDatabase *db = [databaseUtil sharedDatabase];
    if (![db open]) {
        [db close];
        return NO;
    }
    success = [db executeUpdate:@"DELETE FROM contact WHERE id = (?)",@(people.cId)];
    [db close];
    return success;
    
}
@end
