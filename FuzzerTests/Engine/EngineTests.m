//
//  EngineTests.m
//  Fuzzer
//
//  Created by AlexDenisov on 08/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Mutator.h"
#import "MutationGenerator.h"
#import "Engine.h"
#import "Report.h"

@interface EngineTests : XCTestCase

@end

@implementation EngineTests

- (void)test_engine_records_failures {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe"
    };

    Mutator *mutator = [Mutator mutatorForOriginal:original withMutationGenerator:[MutationGenerator deleteNodeMutations]];
    Engine *engine = [Engine engineWithMutator:mutator];

    NSException *exception = [NSException exceptionWithName:@"Nothing" reason:@"No reason" userInfo:@{}];

    NSArray *reports = [engine runEngineOverMutants:^(NSDictionary *mutant) {
        @throw exception;
    }];

    Report *firstnameLessReport = [Report reportWithMutant:@{ @"last name" : @"Doe" } exception:exception];
    Report *lastnameLessReport = [Report reportWithMutant:@{ @"first name" : @"John" } exception:exception];

    XCTAssertEqual(reports.count, 2);

    XCTAssertTrue([reports containsObject:firstnameLessReport]);
    XCTAssertTrue([reports containsObject:lastnameLessReport]);
}

- (void)test_engine_records_nothing_when_no_failures {
    NSDictionary *original = @{
            @"first name" : @"John",
            @"last name" : @"Doe"
    };

    Mutator *mutator = [Mutator mutatorForOriginal:original withMutationGenerator:[MutationGenerator deleteNodeMutations]];
    Engine *engine = [Engine engineWithMutator:mutator];

    NSArray *reports = [engine runEngineOverMutants:^(NSDictionary *mutant) {
        // all good
    }];

    XCTAssertEqual(reports.count, 0);
}

@end
