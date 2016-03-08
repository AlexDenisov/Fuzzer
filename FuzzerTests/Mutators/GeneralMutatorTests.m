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

    MutationGenerator *mutationGenerator = [MutationGenerator deleteNodeMutations];
    Mutator *mutator = [Mutator mutatorForOriginal:original withMutationGenerator:mutationGenerator];

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

    MutationGenerator *deleteNodeMutationGenerator = [MutationGenerator deleteNodeMutations];
    Mutator *mutator = [Mutator mutatorForOriginal:original withMutationGenerator:deleteNodeMutationGenerator];
    XCTAssertEqual(mutator.amountOfMutants, 3);
}

- (void)test_complex_mutator_calculates_amount_of_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    MutationGenerator *deleteNodeMutationGenerator = [MutationGenerator deleteNodeMutations];

    NSArray *replacements = @[ [NodeReplacement stringReplacement], [NodeReplacement floatReplacement], [NodeReplacement integerReplacement] ];
    MutationGenerator *replaceNodeMutationGenerator = [MutationGenerator replaceNodeMutationsWithReplacements:replacements];

    MutationGenerator *mutationGenerator = [MutationGenerator combineMutationGenerators:@[ deleteNodeMutationGenerator, replaceNodeMutationGenerator ]];

    Mutator *mutator = [Mutator mutatorForOriginal:original withMutationGenerator:mutationGenerator];
    XCTAssertEqual(mutator.amountOfMutants, 12);
}

- (void)test_all_mutations {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    Mutator *mutator = [Mutator mutatorForOriginal:original withMutationGenerator:[MutationGenerator allMutations]];
    XCTAssertEqual(mutator.amountOfMutants, 27, @"(All ReplaceNode mutations + DeleteNode mutations) * original.count");
}

@end
