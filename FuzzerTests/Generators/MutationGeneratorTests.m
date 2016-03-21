//
//  MutationGeneratorTests.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 08/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FZRMutationGenerator.h"
#import "FZRNodeReplacement.h"
#import "FZRDeleteNodeMutation.h"
#import "FZRReplaceNodeMutation.h"

@interface MutationGeneratorTests : XCTestCase

@end

@implementation MutationGeneratorTests

- (void)test_generates_delete_node_mutation {
    FZRDeleteNodeMutation *mutation = [FZRDeleteNodeMutation new];
    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:@[mutation]];
    XCTAssertEqual([mutationGenerator mutations].count, 1);
}

- (void)test_generates_replace_node_mutations {
    NSMutableArray *replacements = [NSMutableArray new];
    for (FZRNodeReplacement *replacement in @[ [FZRNodeReplacement stringReplacement], [FZRNodeReplacement floatReplacement], [FZRNodeReplacement integerReplacement] ]) {
        [replacements addObject:[FZRReplaceNodeMutation mutationWithReplacement:replacement]];
    }

    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:replacements];
    XCTAssertEqual([mutationGenerator mutations].count, 3);
}

- (void)test_combines_two_generators {
    FZRDeleteNodeMutation *mutation = [FZRDeleteNodeMutation new];
    FZRMutationGenerator *deleteNodeMutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:@[mutation]];

    NSMutableArray *replacements = [NSMutableArray new];
    for (FZRNodeReplacement *replacement in @[ [FZRNodeReplacement stringReplacement], [FZRNodeReplacement floatReplacement], [FZRNodeReplacement integerReplacement] ]) {
        [replacements addObject:[FZRReplaceNodeMutation mutationWithReplacement:replacement]];
    }

    FZRMutationGenerator *replaceNodeMutationGenerator = [FZRMutationGenerator mutationGeneratorWithMutations:replacements];

    FZRMutationGenerator *mutationGenerator = [FZRMutationGenerator combineMutationGenerators:@[deleteNodeMutationGenerator, replaceNodeMutationGenerator]];
    XCTAssertEqual([mutationGenerator mutations].count, 4);
}

@end
