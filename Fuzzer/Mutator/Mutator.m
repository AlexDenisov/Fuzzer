//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "Mutator.h"
#import "MutationGenerator.h"
#import "Mutation.h"

@interface Mutator ()

@property MutationGenerator *mutationGenerator;
@property NSDictionary *sample;

@end

@implementation Mutator

+ (instancetype)mutatorForSample:(NSDictionary *)sample withMutationGenerator:(MutationGenerator *)mutationGenerator {
    Mutator *mutator = [Mutator new];

    mutator.sample = [sample copy];
    mutator.mutationGenerator = mutationGenerator;

    return mutator;
}

- (void)enumerateMutantsUsingBLock:(MutantEnumeratorBlock)mutantEnumeratorBlock {
    for (id<Mutation> mutation in self.mutationGenerator.mutations) {
        for (NSString *key in self.sample.allKeys) {
            NSDictionary *mutant = [mutation mutateSample:self.sample atNode:key];
            mutantEnumeratorBlock(mutant);
        }
    }
}

- (NSUInteger)amountOfMutants {
    return self.sample.count * self.mutationGenerator.mutations.count;
}

@end
