//
//  RunnerTests.m
//  Fuzzer
//
//  Created by AlexDenisov on 08/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Fuzzer/Fuzzer.h>

@interface RunnerTests : XCTestCase

@end

@implementation RunnerTests

- (void)test_engine_records_failures {
    NSDictionary *sample = @{
            @"first name" : @"John",
            @"last name" : @"Doe"
    };

    FZRRunner *runner = [FZRRunner runnerWithMutations:@[[FZRMutationFactory builtinDeleteNodeMutation]] forSample:sample];

    NSException *exception = [NSException exceptionWithName:@"Nothing" reason:@"No reason" userInfo:@{}];

    NSArray *reports = [runner enumerateMutantsUsingBlock:^(NSDictionary *mutant) {
        @throw exception;
    }];

    FZRReport *firstnameLessReport = [FZRReport reportWithMutant:@{@"last name" : @"Doe"} exception:exception];
    FZRReport *lastnameLessReport = [FZRReport reportWithMutant:@{@"first name" : @"John"} exception:exception];

    XCTAssertEqual(reports.count, 2u);

    XCTAssertTrue([reports containsObject:firstnameLessReport]);
    XCTAssertTrue([reports containsObject:lastnameLessReport]);
}

- (void)test_engine_records_nothing_when_no_failures {
    NSDictionary *sample = @{
            @"first name" : @"John",
            @"last name" : @"Doe"
    };

    FZRRunner *runner = [FZRRunner runnerWithMutations:@[[FZRMutationFactory builtinDeleteNodeMutation]] forSample:sample];

    NSArray *reports = [runner enumerateMutantsUsingBlock:^(NSDictionary *mutant) {
        // all good
    }];

    XCTAssertEqual(reports.count, 0u);
}

- (void)test_applies_delete_node_mutations {
    NSDictionary *sample = @{
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

    FZRRunner *runner = [FZRRunner runnerWithMutations:@[[FZRMutationFactory builtinDeleteNodeMutation]] forSample:sample];

    NSMutableArray *mutants = [NSMutableArray new];

    [runner enumerateMutantsUsingBlock:^(NSDictionary *mutant) {
        [mutants addObject:mutant];
    }];

    XCTAssertEqual(mutants.count, 3u);

    XCTAssertTrue([mutants containsObject:firstnameLessMutant]);
    XCTAssertTrue([mutants containsObject:lastnameLessMutant]);
    XCTAssertTrue([mutants containsObject:agelessMutant]);
}

- (void)test_simple_mutator_calculates_amount_of_mutations {
    NSDictionary *sample = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    FZRRunner *runner = [FZRRunner runnerWithMutations:@[[FZRMutationFactory builtinDeleteNodeMutation]] forSample:sample];
    XCTAssertEqual(runner.amountOfMutants, 3u);
}

- (void)test_complex_mutator_calculates_amount_of_mutations {
    NSDictionary *sample = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    NSMutableArray *mutations = [NSMutableArray new];
    for (FZRNodeReplacement *replacement in @[ [FZRNodeReplacement stringReplacement], [FZRNodeReplacement floatReplacement], [FZRNodeReplacement integerReplacement] ]) {
        [mutations addObject:[FZRMutationFactory replaceNodeMutationWithReplacement:replacement]];
    }

    [mutations addObject:[FZRMutationFactory builtinDeleteNodeMutation]];

    FZRRunner *runner = [FZRRunner runnerWithMutations:mutations forSample:sample];
    XCTAssertEqual(runner.amountOfMutants, 12u);
}

- (void)test_all_mutations {
    NSDictionary *sample = @{
            @"first name" : @"John",
            @"last name" : @"Doe",
            @"age" : @42
    };

    FZRRunner *runner = [FZRRunner runnerWithBuiltinMutationsForSample:sample];
    XCTAssertEqual(runner.amountOfMutants, 27u, @"(All ReplaceNode mutations + DeleteNode mutations) * sample.count");
}

@end
