//
//  ConstantRNGTest.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 07/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ConstantRNG.h"

@interface ConstantRNGTest : XCTestCase

@end

@implementation ConstantRNGTest

- (void)test_returns_the_same_constant {
    ConstantRNG *rng = [[ConstantRNG alloc] initWithConstant:42];

    XCTAssertEqual(rng.next, 42);
    XCTAssertEqual(rng.next, 42);
    XCTAssertEqual(rng.next, 42);
}

@end
