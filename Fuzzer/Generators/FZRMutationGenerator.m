//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRMutationGenerator.h"
#import "FZRDeleteNodeMutation.h"
#import "FZRReplaceNodeMutation.h"
#import "FZRNodeReplacement.h"

@interface FZRMutationGenerator ()

@property NSArray <id <FZRMutation>> *mutations;

@end

@implementation FZRMutationGenerator

+ (instancetype)builtinMutationGenerator {
    NSArray *replacements = [FZRNodeReplacement builtinReplacements];

    NSMutableArray *mutations = [NSMutableArray arrayWithCapacity:replacements.count];
    for (FZRNodeReplacement *replacement in replacements) {
        id<FZRMutation> mutation = [FZRReplaceNodeMutation mutationWithReplacement:replacement];
        [mutations addObject:mutation];
    }

    [mutations addObject:[FZRDeleteNodeMutation new]];

    return [self mutationGeneratorWithMutations:mutations];
}

+ (instancetype)mutationGeneratorWithMutations:(NSArray *)mutations {
    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator new];

    mutationGenerator.mutations = mutations;

    return mutationGenerator;
}

+ (instancetype)combineMutationGenerators:(NSArray <FZRMutationGenerator *> *)mutationGenerators {
    NSMutableArray *mutations = [NSMutableArray new];

    for (FZRMutationGenerator *mutationGenerator in mutationGenerators) {
        [mutations addObjectsFromArray:mutationGenerator.mutations];
    }

    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator new];

    mutationGenerator.mutations = [mutations copy];

    return mutationGenerator;
}

@end
