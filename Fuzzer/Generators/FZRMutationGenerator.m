//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRMutationGenerator.h"
#import "FZRMutationFactory.h"

@interface FZRMutationGenerator ()

@property NSArray <id <FZRMutation>> *mutations;

@end

@implementation FZRMutationGenerator

+ (instancetype)builtinMutationGenerator {
    return [self mutationGeneratorWithMutations:[FZRMutationFactory builtinMutations]];
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
