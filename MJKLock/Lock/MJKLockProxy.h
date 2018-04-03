//
//  MJKLockProxy.h
//  MJKLock
//
//  Created by Ansel on 2018/4/3.
//  Copyright © 2018年 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 只要实现了 NSLocking 协议的都可以代理
 */
@interface MJKLockProxy : NSObject

- (instancetype)initWithLock:(id<NSLocking>)lock;

@end
