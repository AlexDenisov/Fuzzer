//
//  GeneralMutatorTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 08/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MutationGenerator.h"
#import "Mutator.h"
#import "NodeReplacement.h"
#import "DeleteNodeMutation.h"
#import "ReplaceNodeMutation.h"

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

    MutationGenerator *mutationGenerator = [MutationGenerator mutationGeneratorWithMutations:@[[DeleteNodeMutation new]]];
    Mutator *mutator = [Mutator mutatorForSample:original withMutationGenerator:mutationGenerator];

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

    MutationGenerator *deleteNodeMutationGenerator = [MutationGenerator mutationGeneratorWithMutations:@[[DeleteNodeMutation new]]];
    Mutator *mutator = [Mutator mutatorForSample:original withMutationGenerator:deleteNodeMutationGenerator];
    XCTAssertEqual(mutator.amountOfMutants, 3);
}

- (void)test_complex_mutator_calculates_amount_of_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    MutationGenerator *deleteNodeMutationGenerator = [MutationGenerator mutationGeneratorWithMutations:@[[DeleteNodeMutation new]]];

    NSMutableArray *replacements = [NSMutableArray new];
    for (NodeReplacement *replacement in @[ [NodeReplacement stringReplacement], [NodeReplacement floatReplacement], [NodeReplacement integerReplacement] ]) {
        [replacements addObject:[ReplaceNodeMutation mutationWithReplacement:replacement]];
    }

    MutationGenerator *replaceNodeMutationGenerator = [MutationGenerator mutationGeneratorWithMutations:replacements];

    MutationGenerator *mutationGenerator = [MutationGenerator combineMutationGenerators:@[ deleteNodeMutationGenerator, replaceNodeMutationGenerator ]];

    Mutator *mutator = [Mutator mutatorForSample:original withMutationGenerator:mutationGenerator];
    XCTAssertEqual(mutator.amountOfMutants, 12);
}

- (void)test_all_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    Mutator *mutator = [Mutator mutatorForSample:original withMutationGenerator:[MutationGenerator builtinMutationGenerator]];
    XCTAssertEqual(mutator.amountOfMutants, 27, @"(All ReplaceNode mutations + DeleteNode mutations) * sample.count");
}

@end
