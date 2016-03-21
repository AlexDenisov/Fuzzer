//
//  EngineTests.m
//  Fuzzer
//
//  Created by AlexDenisov on 08/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FZRMutator.h"
#import "FZRMutationGenerator.h"
#import "FZRDeleteNodeMutation.h"
#import "FZREngine.h"
#import "FZRReport.h"

@interface EngineTests : XCTestCase

@end

@implementation EngineTests

- (void)test_engine_records_failures {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe"
    };

    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:@[[FZRDeleteNodeMutation new]]];
    FZRMutator *mutator = [FZRMutator mutatorForSample:original withMutationGenerator:mutationGenerator];
    FZREngine *engine = [FZREngine engineWithMutator:mutator];

    NSException *exception = [NSException exceptionWithName:@"Nothing" reason:@"No reason" userInfo:@{}];

    NSArray *reports = [engine runEngineOverMutants:^(NSDictionary *mutant) {
        @throw exception;
    }];

    FZRReport *firstnameLessReport = [FZRReport reportWithMutant:@{@"last name" : @"Doe"} exception:exception];
    FZRReport *lastnameLessReport = [FZRReport reportWithMutant:@{@"first name" : @"John"} exception:exception];

    XCTAssertEqual(reports.count, 2);

    XCTAssertTrue([reports containsObject:firstnameLessReport]);
    XCTAssertTrue([reports containsObject:lastnameLessReport]);
}

- (void)test_engine_records_nothing_when_no_failures {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe"
    };

    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:@[[FZRDeleteNodeMutation new]]];
    FZRMutator *mutator = [FZRMutator mutatorForSample:original withMutationGenerator:mutationGenerator];
    FZREngine *engine = [FZREngine engineWithMutator:mutator];

    NSArray *reports = [engine runEngineOverMutants:^(NSDictionary *mutant) {
        // all good
    }];

    XCTAssertEqual(reports.count, 0);
}

@end
