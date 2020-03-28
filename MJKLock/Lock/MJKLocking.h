//
//  MJKLocking.h
//  MJKLock
//
//  Created by Ansel on 2020/3/29.
//  Copyright © 2020 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MJKReadWriteLocking <NSLocking>

@optional
- (void)readLock;
- (void)writeLock;

@end

NS_ASSUME_NONNULL_END
