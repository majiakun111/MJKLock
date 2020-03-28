//
//  MJKGCDReadWriteLock.m
//  MJKLock
//
//  Created by Ansel on 2020/3/29.
//  Copyright © 2020 Ansel. All rights reserved.
//

#import "MJKGCDReadWriteLock.h"

@interface MJKGCDReadWriteLock () {
    dispatch_queue_t _asyncQueue;
}

@end

@implementation MJKGCDReadWriteLock

- (instancetype)init {
    self = [super init];
    if (self) {
        _asyncQueue = dispatch_queue_create("com.readwrite.queue", DISPATCH_QUEUE_CONCURRENT);
    }
    
    return self;
}

#pragma mark - MJKGCDReadWriteLocking

- (void)safeRead:(void(^)(void))block {
    if (!block) {
        return;
    }
    
    dispatch_async(_asyncQueue, ^{
        block();
    });
}

- (void)safeWrite:(void(^)(void))block {
    if (!block) {
        return;
    }
    
    dispatch_barrier_async(_asyncQueue, ^{
        block();
    });
}

@end
