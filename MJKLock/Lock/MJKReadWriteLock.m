//
//  MJKGCDReadWriteLock.m
//  MJKLock
//
//  Created by Ansel on 2020/3/29.
//  Copyright © 2020 Ansel. All rights reserved.
//

#import "MJKReadWriteLock.h"
#import <pthread.h>

@interface MJKReadWriteLock () {
    pthread_rwlock_t _rwlock;
}

@end

@implementation MJKReadWriteLock

- (void)dealloc {
    pthread_rwlock_destroy(&_rwlock);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        pthread_rwlock_init(&_rwlock, NULL);
    }
    
    return self;
}

#pragma mark - MJKReadWriteLocking

- (void)readLock {
    pthread_rwlock_rdlock(&_rwlock);
}

- (void)writeLock {
    pthread_rwlock_wrlock(&_rwlock);
}

- (void)lock {
    
}

- (void)unlock {
    pthread_rwlock_unlock(&_rwlock);
}

@end
