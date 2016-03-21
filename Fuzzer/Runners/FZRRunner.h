//
// Created by AlexDenisov on 21/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RunnerBlock)(NSDictionary *mutant);

@protocol FZRMutation;
@class FZRReport;

@interface FZRRunner : NSObject

+ (instancetype)runnerWithMutations:(NSArray <id<FZRMutation>>*)mutations forSample:(NSDictionary *)sample;
+ (instancetype)runnerWithBuiltinMutationsForSample:(NSDictionary *)sample;

- (NSUInteger)amountOfMutants;
- (NSArray <FZRReport *> *)enumerateMutantsUsingBlock:(RunnerBlock)runnerBlock;

@end
