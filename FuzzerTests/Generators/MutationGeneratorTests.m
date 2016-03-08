//
//  MutationGeneratorTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 08/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MutationGenerator.h"
#import "NodeReplacement.h"
#import "DeleteNodeMutation.h"
#import "ReplaceNodeMutation.h"

@interface MutationGeneratorTests : XCTestCase

@end

@implementation MutationGeneratorTests

- (void)test_generates_delete_node_mutation {
    DeleteNodeMutation *mutation = [DeleteNodeMutation new];
    MutationGenerator *mutationGenerator = [MutationGenerator mutationGeneratorWithMutations:@[mutation]];
    XCTAssertEqual([mutationGenerator mutations].count, 1);
}

- (void)test_generates_replace_node_mutations {
    NSMutableArray *replacements = [NSMutableArray new];
    for (NodeReplacement *replacement in @[ [NodeReplacement stringReplacement], [NodeReplacement floatReplacement], [NodeReplacement integerReplacement] ]) {
        [replacements addObject:[ReplaceNodeMutation mutationWithReplacement:replacement]];
    }

    MutationGenerator *mutationGenerator = [MutationGenerator mutationGeneratorWithMutations:replacements];
    XCTAssertEqual([mutationGenerator mutations].count, 3);
}

- (void)test_combines_two_generators {
    DeleteNodeMutation *mutation = [DeleteNodeMutation new];
    MutationGenerator *deleteNodeMutationGenerator = [MutationGenerator mutationGeneratorWithMutations:@[mutation]];

    NSMutableArray *replacements = [NSMutableArray new];
    for (NodeReplacement *replacement in @[ [NodeReplacement stringReplacement], [NodeReplacement floatReplacement], [NodeReplacement integerReplacement] ]) {
        [replacements addObject:[ReplaceNodeMutation mutationWithReplacement:replacement]];
    }

    MutationGenerator *replaceNodeMutationGenerator = [MutationGenerator mutationGeneratorWithMutations:replacements];

    MutationGenerator *mutationGenerator = [MutationGenerator combineMutationGenerators:@[ deleteNodeMutationGenerator, replaceNodeMutationGenerator ]];
    XCTAssertEqual([mutationGenerator mutations].count, 4);
}

@end
