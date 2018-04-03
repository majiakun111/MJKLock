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
#import "MJKPThreadMutexLock.h"

@interface ViewController ()

@property (nonatomic, strong) MJKPThreadMutexLock *lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lock = [[MJKPThreadMutexLock alloc] initWithLockType:MJKPThreadMutexRecursiveLockType];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self test:1];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self test:2];
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self test:3];
    });
    
}

- (void)test:(NSInteger)number {
    MJKLockProxy *lockproxy = [[MJKLockProxy alloc] initWithLock:self.lock];
    NSLog(@"--number:%d----", (int)number);
    lockproxy = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
