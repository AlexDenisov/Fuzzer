//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RandomNumberGenerator;

@protocol Mutation <NSObject>

- (NSDictionary *)mutate:(NSDictionary *)original withRNG:(id<RandomNumberGenerator>)rng;

@end
