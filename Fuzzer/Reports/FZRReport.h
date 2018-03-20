//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZRReport : NSObject

+ (instancetype)reportWithMutant:(NSDictionary *)mutant exception:(NSException *)exception;

- (NSDictionary *)mutant;
- (NSException *)exception;

@end

NS_ASSUME_NONNULL_END
