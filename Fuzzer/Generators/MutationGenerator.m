//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "MutationGenerator.h"
#import "DeleteNodeMutation.h"
#import "ReplaceNodeMutation.h"
#import "NodeReplacement.h"

@interface MutationGenerator ()

@property NSArray <id <Mutation>> *mutations;

@end

@implementation MutationGenerator

+ (instancetype)builtinMutationGenerator {
    NSArray *replacements = [NodeReplacement builtinReplacements];

    NSMutableArray *mutations = [NSMutableArray arrayWithCapacity:replacements.count];
    for (NodeReplacement *replacement in replacements) {
        id<Mutation> mutation = [ReplaceNodeMutation mutationWithReplacement:replacement];
        [mutations addObject:mutation];
    }

    [mutations addObject:[DeleteNodeMutation new]];

    return [self mutationGeneratorWithMutations:mutations];
}

+ (instancetype)mutationGeneratorWithMutations:(NSArray *)mutations {
    MutationGenerator *mutationGenerator = [MutationGenerator new];

    mutationGenerator.mutations = mutations;

    return mutationGenerator;
}

+ (instancetype)combineMutationGenerators:(NSArray <MutationGenerator *> *)mutationGenerators {
    NSMutableArray *mutations = [NSMutableArray new];

    for (MutationGenerator *mutationGenerator in mutationGenerators) {
        [mutations addObjectsFromArray:mutationGenerator.mutations];
    }

    MutationGenerator *mutationGenerator = [MutationGenerator new];

    mutationGenerator.mutations = [mutations copy];

    return mutationGenerator;
}

@end
