//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRMutator.h"
#import "FZRMutationGenerator.h"
#import "FZRMutation.h"

@interface FZRMutator ()

@property FZRMutationGenerator *mutationGenerator;
@property NSDictionary *sample;

@end

@implementation FZRMutator

+ (instancetype)mutatorForSample:(NSDictionary *)sample withMutationGenerator:(FZRMutationGenerator *)mutationGenerator {
    FZRMutator *mutator = [FZRMutator new];

    mutator.sample = [sample copy];
    mutator.mutationGenerator = mutationGenerator;

    return mutator;
}

- (void)enumerateMutantsUsingBLock:(MutantEnumeratorBlock)mutantEnumeratorBlock {
    for (id<FZRMutation> mutation in self.mutationGenerator.mutations) {
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
