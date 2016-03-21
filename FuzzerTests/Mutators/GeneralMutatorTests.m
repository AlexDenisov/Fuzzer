//
//  GeneralMutatorTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 08/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FZRMutationGenerator.h"
#import "FZRMutator.h"
#import "FZRNodeReplacement.h"
#import "FZRDeleteNodeMutation.h"
#import "FZRReplaceNodeMutation.h"

@interface GeneralMutatorTests : XCTestCase

@end

@implementation GeneralMutatorTests

- (void)test_applies_delete_node_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    NSDictionary *firstnameLessMutant = @{
            @"last name" : @"Doe",
            @"age" : @42
    };

    NSDictionary *lastnameLessMutant = @{
            @"first name" : @"John",
            @"age" : @42
    };

    NSDictionary *agelessMutant = @{
            @"first name" : @"John",
            @"last name" : @"Doe"
    };

    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:@[[FZRDeleteNodeMutation new]]];
    FZRMutator *mutator = [FZRMutator mutatorForSample:original withMutationGenerator:mutationGenerator];

    NSMutableArray *mutants = [NSMutableArray new];

    [mutator enumerateMutantsUsingBLock:^(NSDictionary *mutant) {
        [mutants addObject:mutant];
    }];

    XCTAssertEqual(mutants.count, 3);

    XCTAssertTrue([mutants containsObject:firstnameLessMutant]);
    XCTAssertTrue([mutants containsObject:lastnameLessMutant]);
    XCTAssertTrue([mutants containsObject:agelessMutant]);
}

- (void)test_simple_mutator_calculates_amount_of_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    FZRMutationGenerator *deleteNodeMutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:@[[FZRDeleteNodeMutation new]]];
    FZRMutator *mutator = [FZRMutator mutatorForSample:original withMutationGenerator:deleteNodeMutationGenerator];
    XCTAssertEqual(mutator.amountOfMutants, 3);
}

- (void)test_complex_mutator_calculates_amount_of_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    FZRMutationGenerator *deleteNodeMutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:@[[FZRDeleteNodeMutation new]]];

    NSMutableArray *replacements = [NSMutableArray new];
    for (FZRNodeReplacement *replacement in @[ [FZRNodeReplacement stringReplacement], [FZRNodeReplacement floatReplacement], [FZRNodeReplacement integerReplacement] ]) {
        [replacements addObject:[FZRReplaceNodeMutation mutationWithReplacement:replacement]];
    }

    FZRMutationGenerator *replaceNodeMutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:replacements];

    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator combineMutationGenerators:@[deleteNodeMutationGenerator, replaceNodeMutationGenerator]];

    FZRMutator *mutator = [FZRMutator mutatorForSample:original withMutationGenerator:mutationGenerator];
    XCTAssertEqual(mutator.amountOfMutants, 12);
}

- (void)test_all_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    FZRMutator *mutator = [FZRMutator mutatorForSample:original withMutationGenerator:[FZRMutationGenerator builtinMutationGenerator]];
    XCTAssertEqual(mutator.amountOfMutants, 27, @"(All ReplaceNode mutations + DeleteNode mutations) * sample.count");
}

@end
