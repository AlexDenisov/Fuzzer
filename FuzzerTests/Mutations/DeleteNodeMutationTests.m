//
//  DeleteNodeMutationTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 07/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DeleteNodeMutation.h"
#import "ConstantRNG.h"

@interface DeleteNodeMutationTests : XCTestCase

@end

@implementation DeleteNodeMutationTests

- (void)test_deletes_node_from_dictionary {
    DeleteNodeMutation *mutation = [DeleteNodeMutation new];

    NSDictionary *original = @{
            @"first name" : @"john",
            @"last name" : @"doe",
            @"age" : @42
    };

    NSArray *originalKeys = original.allKeys;

    id<RandomNumberGenerator> rng0 = [[ConstantRNG alloc] initWithConstant:0];
    NSString *key0 = originalKeys[0];
    NSDictionary *key0Less = [mutation mutate:original withRNG:rng0];
    XCTAssertFalse([key0Less.allKeys containsObject:key0], @"Node '%@' deleted from original dictionary '%@'", key0, original);

    id<RandomNumberGenerator> rng1 = [[ConstantRNG alloc] initWithConstant:1];
    NSString *key1 = originalKeys[1];
    NSDictionary *key1Less = [mutation mutate:original withRNG:rng1];
    XCTAssertFalse([key1Less.allKeys containsObject:key1], @"Node '%@' deleted from original dictionary '%@'", key1, original);

    id<RandomNumberGenerator> rng2 = [[ConstantRNG alloc] initWithConstant:2];
    NSString *key2 = originalKeys[2];
    NSDictionary *key2Less = [mutation mutate:original withRNG:rng2];
    XCTAssertFalse([key2Less.allKeys containsObject:key2], @"Node '%@' deleted from original dictionary '%@'", key2, original);
}

@end
