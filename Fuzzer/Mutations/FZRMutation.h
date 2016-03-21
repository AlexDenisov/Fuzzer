//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FZRMutation <NSObject>

- (NSDictionary *)mutateSample:(NSDictionary *)sample atNode:(NSString *)nodeName;

@end
