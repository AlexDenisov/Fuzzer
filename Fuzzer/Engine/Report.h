//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Report : NSObject

- (instancetype)initWithMutant:(NSDictionary *)mutant exception:(NSException *)exception;

- (NSDictionary *)mutant;
- (NSException *)exception;

@end
