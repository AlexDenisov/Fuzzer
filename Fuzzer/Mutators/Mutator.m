//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "Mutator.h"
#import "RandomNumberGenerator.h"
#import "MutationGenerator.h"
#import "RangeRNG.h"
#import "Mutation.h"

@interface Mutator ()

@property id<RandomNumberGenerator> rng;
@property MutationGenerator *mutationGenerator;
@property NSDictionary *original;

@end

@implementation Mutator

+ (instancetype)mutatorForOriginal:(NSDictionary *)original withMutationGenerator:(MutationGenerator *)mutationGenerator {
    Mutator *mutator = [Mutator new];

    mutator.original = [original copy];
    mutator.mutationGenerator = mutationGenerator;
    mutator.rng = [[RangeRNG alloc] initWithRange:NSMakeRange(0, mutator.original.count)];

    return mutator;
}

- (void)enumerateMutantsUsingBLock:(MutantEnumeratorBlock)mutantEnumeratorBlock {
    for (id<Mutation> mutation in self.mutationGenerator.mutations) {
        for (int i = 0; i < self.original.count; i++) {
            NSDictionary *mutant = [mutation mutate:self.original withRNG:self.rng];
            mutantEnumeratorBlock(mutant);
        }
    }
}

- (NSUInteger)amountOfMutants {
    return self.original.count * self.mutationGenerator.mutations.count;
}

@end
