//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NodeReplacement;
@protocol Mutation;

@interface MutationGenerator : NSObject

+ (instancetype)builtinMutationGenerator;

+ (instancetype)mutationGeneratorWithMutations:(NSArray <id <Mutation>>*)mutations;

+ (instancetype)combineMutationGenerators:(NSArray <MutationGenerator *> *)mutationGenerators;

- (NSArray< id<Mutation> > *)mutations;

@end
