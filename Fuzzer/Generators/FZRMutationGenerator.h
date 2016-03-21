//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FZRNodeReplacement;
@protocol FZRMutation;

@interface FZRMutationGenerator : NSObject

+ (instancetype)builtinMutationGenerator;

+ (instancetype)mutationGeneratorWithMutations:(NSArray <id <FZRMutation>>*)mutations;

+ (instancetype)combineMutationGenerators:(NSArray <FZRMutationGenerator *> *)mutationGenerators;

- (NSArray< id<FZRMutation> > *)mutations;

@end
