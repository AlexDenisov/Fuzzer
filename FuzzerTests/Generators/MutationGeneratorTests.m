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

@interface MutationGeneratorTests : XCTestCase

@end

@implementation MutationGeneratorTests

- (void)test_generates_delete_node_mutation {
    MutationGenerator *mutationGenerator = [MutationGenerator deleteNodeMutations];
    XCTAssertEqual([mutationGenerator mutations].count, 1);
}

- (void)test_generates_replace_node_mutations {
    NSArray *replacements = @[ [NodeReplacement stringReplacement], [NodeReplacement floatReplacement], [NodeReplacement integerReplacement] ];
    MutationGenerator *mutationGenerator = [MutationGenerator replaceNodeMutationsWithReplacements:replacements];
    XCTAssertEqual([mutationGenerator mutations].count, 3);
}

- (void)test_combines_two_generators {
    MutationGenerator *deleteNodeMutationGenerator = [MutationGenerator deleteNodeMutations];

    NSArray *replacements = @[ [NodeReplacement stringReplacement], [NodeReplacement floatReplacement], [NodeReplacement integerReplacement] ];
    MutationGenerator *replaceNodeMutationGenerator = [MutationGenerator replaceNodeMutationsWithReplacements:replacements];

    MutationGenerator *mutationGenerator = [MutationGenerator combineMutationGenerators:@[ deleteNodeMutationGenerator, replaceNodeMutationGenerator ]];

    XCTAssertEqual([mutationGenerator mutations].count, 4);
}

@end
