//
//  MJKPThreadMutexLock.h
//  MJKLock
//
//  Created by Ansel on 2018/4/3.
//  Copyright © 2018年 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MJKPThreadMutexLockType) {
    MJKPThreadMutexNormalLockType = 0,
    MJKPThreadMutexRecursiveLockType = 1,
};

@interface MJKPThreadMutexLock : NSObject <NSLocking>

- (instancetype)initWithLockType:(MJKPThreadMutexLockType)lockType;

@end
