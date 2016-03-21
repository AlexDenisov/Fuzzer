//
// Created by AlexDenisov on 21/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRMutationFactory.h"
#import "FZRMutation.h"
#import "FZRDeleteNodeMutation.h"
#import "FZRReplaceNodeMutation.h"
#import "FZRNodeReplacement.h"

@implementation FZRMutationFactory

+ (id <FZRMutation>)builtinDeleteNodeMutation {
    return [FZRDeleteNodeMutation new];
}

+ (NSArray *)builtinReplacementNodeMutations {
    NSArray *replacements = [FZRNodeReplacement builtinReplacements];
    NSMutableArray *mutations = [NSMutableArray arrayWithCapacity:replacements.count];

    for (FZRNodeReplacement *replacement in replacements) {
        id<FZRMutation> mutation = [self replaceNodeMutationWithReplacement:replacement];
        [mutations addObject:mutation];
    }

    return mutations.copy;
}


+ (NSArray <id <FZRMutation>> *)builtinMutations {
    NSArray *mutations = [FZRMutationFactory builtinReplacementNodeMutations];

    mutations = [mutations arrayByAddingObject:[FZRMutationFactory builtinDeleteNodeMutation]];

    return mutations;
}

+ (id <FZRMutation>)replaceNodeMutationWithReplacement:(FZRNodeReplacement *)replacement {
    return [FZRReplaceNodeMutation mutationWithReplacement:replacement];
}

@end
