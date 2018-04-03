//
//  MJKSemaphoreLock.m
//  MJKLock
//
//  Created by Ansel on 2018/4/3.
//  Copyright © 2018年 Ansel. All rights reserved.
//

#import "MJKSemaphoreLock.h"

@interface MJKSemaphoreLock ()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@end

@implementation MJKSemaphoreLock

- (instancetype)init {
    return [self initWithTimeout:DISPATCH_TIME_FOREVER];
}

- (instancetype)initWithTimeout:(dispatch_time_t)timeout {
    self = [super init];
    if (self) {
        self.timeout = timeout;
        self.semaphore = dispatch_semaphore_create(1);
    }
    
    return self;
}

#pragma mark - NSLocking

- (void)lock {
    dispatch_semaphore_wait(self.semaphore, self.timeout);
}

- (void)unlock {
    dispatch_semaphore_signal(self.semaphore);
}

@end
