//
//  MJKSemaphoreLock.h
//  MJKLock
//
//  Created by Ansel on 2018/4/3.
//  Copyright © 2018年 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJKSemaphoreLock : NSObject <NSLocking>

@property (nonatomic, assign) dispatch_time_t timeout;

- (instancetype)initWithTimeout:(dispatch_time_t)timeout;

@end
