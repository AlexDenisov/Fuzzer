//
// Created by AlexDenisov on 21/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRRunner.h"
#import "FZRMutation.h"
#import "FZRMutationFactory.h"
#import "FZRReport.h"

@interface FZRRunner ()

@property (atomic) NSArray *mutations;
@property (atomic) NSDictionary *sample;

@end

@implementation FZRRunner

+ (instancetype)runnerWithMutations:(NSArray <id <FZRMutation>> *)mutations forSample:(NSDictionary *)sample {
    NSParameterAssert(mutations.count > 0);
    NSParameterAssert(sample != nil);

    FZRRunner *runner = [FZRRunner new];

    runner.mutations = mutations;
    runner.sample = sample;

    return runner;
}

+ (instancetype)runnerWithBuiltinMutationsForSample:(NSDictionary *)sample {
    return [self runnerWithMutations:[FZRMutationFactory builtinMutations] forSample:sample];
}

- (NSUInteger)amountOfMutants {
    return self.mutations.count * self.sample.count;
}

- (NSArray <FZRReport *> *)enumerateMutantsUsingBlock:(RunnerBlock)runnerBlock {
    NSArray *nodeNames = self.sample.allKeys;
    NSMutableArray *reports = [NSMutableArray new];

    for (id<FZRMutation> mutation in self.mutations) {
        for (NSString *nodeName in nodeNames) {
            NSDictionary *mutant = [mutation mutateSample:self.sample atNode:nodeName];
            @try {
                runnerBlock(mutant);
            }
            @catch (NSException *exception) {
                FZRReport *report = [FZRReport reportWithMutant:mutant exception:exception];
                [reports addObject:report];
            }
        }
    }

    return reports;
}

@end
