//
//  DeleteNodeMutationTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 07/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Fuzzer/Fuzzer.h>

@interface DeleteNodeMutationTests : XCTestCase

@end

@implementation DeleteNodeMutationTests

- (void)test_deletes_node_from_dictionary {
    id<FZRMutation> mutation = [FZRMutationFactory builtinDeleteNodeMutation];

    NSDictionary *original = @{
            @"first name" : @"john",
            @"last name" : @"doe",
            @"age" : @42
    };

    NSString *key0 = @"first name";
    NSDictionary *key0Less = [mutation mutateSample:original atNode:key0];
    XCTAssertFalse([key0Less.allKeys containsObject:key0], @"Node '%@' deleted from sample dictionary '%@'", key0, original);

    NSString *key1 = @"last name";
    NSDictionary *key1Less = [mutation mutateSample:original atNode:key1];
    XCTAssertFalse([key1Less.allKeys containsObject:key1], @"Node '%@' deleted from sample dictionary '%@'", key1, original);

    NSString *key2 = @"age";
    NSDictionary *key2Less = [mutation mutateSample:original atNode:key2];
    XCTAssertFalse([key2Less.allKeys containsObject:key2], @"Node '%@' deleted from sample dictionary '%@'", key2, original);
}

@end
