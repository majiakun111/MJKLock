//
//  MJKRecursiveLock.m
//  MJKLock
//
//  Created by Ansel on 2020/3/28.
//  Copyright © 2020 Ansel. All rights reserved.
//

#import "MJKRecursiveLock.h"
#import "MJKSemaphoreLock.h"
#import <pthread.h>

@interface MJKRecursiveLock ()

@property (nonatomic, strong) MJKSemaphoreLock *semaphoreLock;
@property (nonatomic, assign) pthread_t currentLockThread;
@property (nonatomic, assign) NSInteger lockCount;

@end

@implementation MJKRecursiveLock



- (instancetype)init {
    self = [super init];
    if (self) {
        _semaphoreLock = [[MJKSemaphoreLock alloc] init];
        _currentLockThread = 0;
        _lockCount = 0;
    }
    
    return self;
}

#pragma mark - NSLocking

- (void)lock {
    if (self.currentLockThread == pthread_self()) {
        self.lockCount++;
    } else {
        [self.semaphoreLock lock];
        self.currentLockThread = pthread_self();
        self.lockCount = 1;
    }
}

- (void)unlock {
    if (self.currentLockThread == pthread_self()) {
        self.lockCount--;
        if (self.lockCount <= 0) {
            self.currentLockThread = 0;
            [self.semaphoreLock unlock];
        }
    } else {
        NSAssert(NO, @"unlock error");
    }
}

@end
