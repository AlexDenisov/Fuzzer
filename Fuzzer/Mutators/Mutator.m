//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "Mutator.h"
#import "MutationGenerator.h"
#import "Mutation.h"

@interface Mutator ()

@property MutationGenerator *mutationGenerator;
@property NSDictionary *original;

@end

@implementation Mutator

+ (instancetype)mutatorForOriginal:(NSDictionary *)original withMutationGenerator:(MutationGenerator *)mutationGenerator {
    Mutator *mutator = [Mutator new];

    mutator.original = [original copy];
    mutator.mutationGenerator = mutationGenerator;

    return mutator;
}

- (void)enumerateMutantsUsingBLock:(MutantEnumeratorBlock)mutantEnumeratorBlock {
    for (id<Mutation> mutation in self.mutationGenerator.mutations) {
        for (NSString *key in self.original.allKeys) {
            NSDictionary *mutant = [mutation mutateSample:self.original atNode:key];
            mutantEnumeratorBlock(mutant);
        }
    }
}

- (NSUInteger)amountOfMutants {
    return self.original.count * self.mutationGenerator.mutations.count;
}

@end
