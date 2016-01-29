//
//  ViewController.m
//  FMDBDemo
//
//  Created by bme on 16/1/28.
//  Copyright © 2016年 bme.seu.edu.cn. All rights reserved.
//

#import "ViewController.h"
#import "MyDataStore.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonTapped:(id)sender {
    int randomInt = rand()%1000000+1;
    [[MyDataStore sharedInstance] insertData:randomInt];
//    [self.dataStore insertData:randomInt];
}



@end
