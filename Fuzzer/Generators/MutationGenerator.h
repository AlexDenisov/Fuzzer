//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NodeReplacement;
@protocol Mutation;

@interface MutationGenerator : NSObject

+ (instancetype)allMutations;

+ (instancetype)deleteNodeMutations;
+ (instancetype)replaceNodeMutationsWithReplacements:(NSArray <NodeReplacement *> *)replacements;

+ (instancetype)combineMutationGenerators:(NSArray <MutationGenerator *> *)mutationGenerators;

- (NSArray< id<Mutation> > *)mutations;

@end
