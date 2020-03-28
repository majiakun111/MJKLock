//
//  MJKLockProxy.m
//  MJKLock
//
//  Created by Ansel on 2018/4/3.
//  Copyright © 2018年 Ansel. All rights reserved.
//

#import "MJKLockProxy.h"

@interface MJKLockProxy ()

@property (nonatomic, strong) id<NSLocking> lock;

@end

@implementation MJKLockProxy

- (void)dealloc {
    [_lock unlock];
}

- (instancetype)initWithLock:(id<NSLocking>)lock {
    return [self initWithLock:lock block:^{
        [lock lock];
    }];
}

- (instancetype)initWithReadLock:(id<MJKReadWriteLocking>)lock {
    return [self initWithLock:lock block:^{
        [lock readLock];
    }];
}

- (instancetype)initWithWriteLock:(id<MJKReadWriteLocking>)lock {
    return [self initWithLock:lock block:^{
        [lock writeLock];
    }];
}

#pragma mark - PrivateMethod

- (instancetype)initWithLock:(id<NSLocking>)lock block:(void(^)(void))block {
    self = [super init];
    if (self) {
        self.lock = lock;
    }
    
    return self;
}

@end
