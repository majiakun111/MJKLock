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
#import "MJKRecursiveLock.h"

@interface ViewController ()

@property (nonatomic, strong) MJKRecursiveLock *lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lock = [[MJKRecursiveLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self test:1];
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self test1];
    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self test:3];
//    });

}

- (void)test:(NSInteger)number {
    if (number == 6) {
        return;
    }
   
    MJKLockProxy *lockproxy = [[MJKLockProxy alloc] initWithLock:self.lock];
    NSLog(@"xxx%zd", number);
    sleep(2);
    
    [self test:++number];
    
    lockproxy = nil;
}

- (void)test1 {
    MJKLockProxy *lockproxy = [[MJKLockProxy alloc] initWithLock:self.lock];
    
    NSLog(@"yyyyyyyyy");
    
    lockproxy = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
