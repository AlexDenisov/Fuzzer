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

+ (instancetype)allMutations {
    MutationGenerator *deleteNodeMutationGenerator = [MutationGenerator deleteNodeMutations];
    MutationGenerator *replaceNodeMutationGenerator = [MutationGenerator replaceNodeMutationsWithReplacements:[NodeReplacement allReplacements]];

    return [self combineMutationGenerators:@[ deleteNodeMutationGenerator, replaceNodeMutationGenerator ]];
}

+ (instancetype)deleteNodeMutations {
    MutationGenerator *mutationGenerator = [MutationGenerator new];

    mutationGenerator.mutations = @[ [DeleteNodeMutation new] ];

    return mutationGenerator;
}

+ (instancetype)replaceNodeMutationsWithReplacements:(NSArray <NodeReplacement *> *)replacements {
    MutationGenerator *mutationGenerator = [MutationGenerator new];

    NSMutableArray *mutations = [NSMutableArray arrayWithCapacity:replacements.count];
    for (NodeReplacement *replacement in replacements) {
        id<Mutation> mutation = [[ReplaceNodeMutation alloc] initWithReplacement:replacement];
        [mutations addObject:mutation];
    }

    mutationGenerator.mutations = [mutations copy];

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
