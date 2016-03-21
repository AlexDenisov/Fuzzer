//
//  ReplaceNodeMutationTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 07/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Fuzzer/Fuzzer.h>

@interface ReplaceNodeMutationTests : XCTestCase

@end

@implementation ReplaceNodeMutationTests

- (void)test_replaces_specific_node_with_string {
    FZRNodeReplacement *replacement = [FZRNodeReplacement stringReplacement];

    id<FZRMutation> mutation = [FZRMutationFactory replaceNodeMutationWithReplacement:replacement];

    NSDictionary *original = @{
            @"first name" : @"john",
            @"last name" : @"doe",
            @"age" : @42
    };

    NSString *key0 = @"first name";
    NSDictionary *key0Change = [mutation mutateSample:original atNode:key0];
    XCTAssertEqualObjects(key0Change[key0], replacement.value, @"Node '%@' has value '%@', not '%@'", key0, replacement.value, key0Change[key0]);

    NSString *key1 = @"last name";
    NSDictionary *key1Change = [mutation mutateSample:original atNode:key1];
    XCTAssertEqualObjects(key1Change[key1], replacement.value, @"Node '%@' has value '%@', not '%@'", key1, replacement.value, key1Change[key1]);

    NSString *key2 = @"age";
    NSDictionary *key2Change = [mutation mutateSample:original atNode:key2];
    XCTAssertEqualObjects(key2Change[key2], replacement.value, @"Node '%@' has value '%@', not '%@'", key2, replacement.value, key2Change[key2]);
}

- (void)test_replaces_specific_node_with_integer {
    FZRNodeReplacement *replacement = [FZRNodeReplacement integerReplacement];

    id<FZRMutation> mutation = [FZRMutationFactory replaceNodeMutationWithReplacement:replacement];

    NSDictionary *original = @{
            @"first name" : @"john",
            @"last name" : @"doe",
            @"age" : @42
    };

    NSString *key0 = @"first name";
    NSDictionary *key0Change = [mutation mutateSample:original atNode:key0];
    XCTAssertEqualObjects(key0Change[key0], replacement.value, @"Node '%@' has value '%@', not '%@'", key0, replacement.value, key0Change[key0]);

    NSString *key1 = @"last name";
    NSDictionary *key1Change = [mutation mutateSample:original atNode:key1];
    XCTAssertEqualObjects(key1Change[key1], replacement.value, @"Node '%@' has value '%@', not '%@'", key1, replacement.value, key1Change[key1]);

    NSString *key2 = @"age";
    NSDictionary *key2Change = [mutation mutateSample:original atNode:key2];
    XCTAssertEqualObjects(key2Change[key2], replacement.value, @"Node '%@' has value '%@', not '%@'", key2, replacement.value, key2Change[key2]);
}

@end
