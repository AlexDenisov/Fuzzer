//
//  ReplaceNodeMutationTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 07/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ReplaceNodeMutation.h"
#import "ConstantRNG.h"
#import "NodeReplacement.h"

@interface ReplaceNodeMutationTests : XCTestCase

@end

@implementation ReplaceNodeMutationTests

- (void)test_replaces_specific_node_with_string {
    NodeReplacement *replacement = [NodeReplacement stringReplacement];

    ReplaceNodeMutation *mutation = [ReplaceNodeMutation mutationWithReplacement:replacement];

    NSDictionary *original = @{
            @"first name" : @"john",
            @"last name" : @"doe",
            @"age" : @42
    };

    NSArray *originalKeys = original.allKeys;

    id<RandomNumberGenerator> rng0 = [[ConstantRNG alloc] initWithConstant:0];
    NSString *key0 = originalKeys[0];
    NSDictionary *key0Change = [mutation mutate:original withRNG:rng0];
    XCTAssertEqualObjects(key0Change[key0], replacement.value, @"Node '%@' has value '%@', not '%@'", key0, replacement.value, key0Change[key0]);

    id<RandomNumberGenerator> rng1 = [[ConstantRNG alloc] initWithConstant:1];
    NSString *key1 = originalKeys[1];
    NSDictionary *key1Change = [mutation mutate:original withRNG:rng1];
    XCTAssertEqualObjects(key1Change[key1], replacement.value, @"Node '%@' has value '%@', not '%@'", key1, replacement.value, key1Change[key1]);

    id<RandomNumberGenerator> rng2 = [[ConstantRNG alloc] initWithConstant:2];
    NSString *key2 = originalKeys[2];
    NSDictionary *key2Change = [mutation mutate:original withRNG:rng2];
    XCTAssertEqualObjects(key2Change[key2], replacement.value, @"Node '%@' has value '%@', not '%@'", key2, replacement.value, key2Change[key2]);
}

- (void)test_replaces_specific_node_with_integer {
    NodeReplacement *replacement = [NodeReplacement integerReplacement];

    ReplaceNodeMutation *mutation = [ReplaceNodeMutation mutationWithReplacement:replacement];

    NSDictionary *original = @{
            @"first name" : @"john",
            @"last name" : @"doe",
            @"age" : @42
    };

    NSArray *originalKeys = original.allKeys;

    id<RandomNumberGenerator> rng0 = [[ConstantRNG alloc] initWithConstant:0];
    NSString *key0 = originalKeys[0];
    NSDictionary *key0Change = [mutation mutate:original withRNG:rng0];
    XCTAssertEqualObjects(key0Change[key0], replacement.value, @"Node '%@' has value '%@', not '%@'", key0, replacement.value, key0Change[key0]);

    id<RandomNumberGenerator> rng1 = [[ConstantRNG alloc] initWithConstant:1];
    NSString *key1 = originalKeys[1];
    NSDictionary *key1Change = [mutation mutate:original withRNG:rng1];
    XCTAssertEqualObjects(key1Change[key1], replacement.value, @"Node '%@' has value '%@', not '%@'", key1, replacement.value, key1Change[key1]);

    id<RandomNumberGenerator> rng2 = [[ConstantRNG alloc] initWithConstant:2];
    NSString *key2 = originalKeys[2];
    NSDictionary *key2Change = [mutation mutate:original withRNG:rng2];
    XCTAssertEqualObjects(key2Change[key2], replacement.value, @"Node '%@' has value '%@', not '%@'", key2, replacement.value, key2Change[key2]);
}

@end
