//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FZRMutation <NSObject>

- (NSDictionary *)mutateSample:(NSDictionary *)sample atNode:(NSString *)nodeName;

@end

NS_ASSUME_NONNULL_END
