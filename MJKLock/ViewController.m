//
//  ViewController.m
//  MJKLock
//
//  Created by Ansel on 2018/4/3.
//  Copyright © 2018年 Ansel. All rights reserved.
//

#import "ViewController.h"
#import "MJKLockProxy.h"
#import "MJKSemaphoreLock.h"
#import "MJKMutexLock.h"
#import "MJKRecursiveLock.h"
#import "MJKReadWriteLock.h"
#import "MJKGCDReadWriteLock.h"

@interface ViewController ()

@property (nonatomic, strong) MJKGCDReadWriteLock *lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lock = [[MJKGCDReadWriteLock alloc] init];
    
    for (NSInteger index = 0; index < 10; index++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self write];
        });
    }
    
    for (NSInteger index = 0; index < 10; index++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self read];
        });
    }
}

- (void)read {
    [self.lock safeRead:^{
        NSLog(@"read");
    }];
}

- (void)write {
    [self.lock safeWrite:^{
        NSLog(@"write");
        sleep(10);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
