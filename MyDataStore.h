//
//  MyDataStore.h
//  FMDBDemo
//
//  Created by bme on 16/1/28.
//  Copyright © 2016年 bme.seu.edu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface MyDataStore : NSObject

+ (instancetype)sharedInstance;
- (BOOL)insertData:(int)value;
@end
