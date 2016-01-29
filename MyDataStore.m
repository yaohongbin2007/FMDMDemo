//
//  MyDataStore.m
//  FMDBDemo
//
//  Created by bme on 16/1/28.
//  Copyright © 2016年 bme.seu.edu.cn. All rights reserved.
//

#import "MyDataStore.h"
#import <FMDB.h>

@interface MyDataStore ()

@property (nonatomic, strong) NSString *dbPath;

@end

@implementation MyDataStore

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString * doc = PATH_OF_DOCUMENT;
        NSString * path = [doc stringByAppendingPathComponent:@"mytest.sqlite"];
        self.dbPath = path;
        NSLog(@"%@",path);
        [self createTable];
    }
    return self;
}



- (void)createTable {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.dbPath] == NO) {
        FMDatabase *db = [FMDatabase databaseWithPath:self.dbPath];
        if ([db open]) {
            NSString *sql = @"CREATE TABLE 'heartRate' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'value' INT)";
            BOOL res = [db executeUpdate:sql];
            if (res) {
                NSLog(@"successed create database");
            }
            [db close];
            
        }
    }
    

    
    
    
}

- (BOOL)insertData:(int)value {
    FMDatabase *db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString * sql = @"insert into heartRate (value) values(?) ";
        BOOL res = [db executeUpdate:sql,[NSNumber numberWithInt:value]];
        [db close];
        return res;
    } else
        return NO;
}


@end
