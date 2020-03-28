//
//  MJKGCDReadWriteLock.h
//  MJKLock
//
//  Created by Ansel on 2020/3/29.
//  Copyright © 2020 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJKLocking.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJKReadWriteLock : NSObject <MJKReadWriteLocking>

- (void)lock NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
