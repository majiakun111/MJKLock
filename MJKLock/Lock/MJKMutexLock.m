//
//  MJKPThreadMutexLock.m
//  MJKLock
//
//  Created by Ansel on 2018/4/3.
//  Copyright © 2018年 Ansel. All rights reserved.
//

#import "MJKMutexLock.h"
#import <pthread/pthread.h>

@interface MJKMutexLock () {
    pthread_mutex_t _threadMutexLock;
}

@end

@implementation MJKMutexLock

- (void)dealloc {
    pthread_mutex_destroy(&_threadMutexLock);
}

- (void)dealloc {
    pthread_mutex_destroy(&_threadMutexLock);
}

- (instancetype)init {
    return [self initWithLockType:MJKPThreadMutexNormalLockType];
}

- (instancetype)initWithLockType:(MJKPThreadMutexLockType)lockType {
    self = [super init];
    if (self) {
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        if (lockType == MJKPThreadMutexNormalLockType) {
            pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
        } else { //MJKPThreadMutexRecursiveLockType
            pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        }
        
        pthread_mutex_init(&_threadMutexLock, &attr);
        pthread_mutexattr_destroy(&attr);
    }
    
    return self;
}

#pragma mark - NSLocking

- (void)lock {
    pthread_mutex_lock(&_threadMutexLock);
}

- (void)unlock {
    pthread_mutex_unlock(&_threadMutexLock);
}

@end
