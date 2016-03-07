//
//  LinearRNG.m
//  JSONFuzzer
//
//  Created by AlexDenisov on 07/03/16.
//  Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RangeRNG.h"

@interface RangeRNGTest : XCTestCase

@end

@implementation RangeRNGTest

- (void)test_generates_random_numbers_linearly {
    RangeRNG *rng = [[RangeRNG alloc] initWithRange:NSMakeRange(2, 5)];

    XCTAssertEqual(rng.next, 2);
    XCTAssertEqual(rng.next, 3);
    XCTAssertEqual(rng.next, 4);
    XCTAssertEqual(rng.next, 5);
    XCTAssertEqual(rng.next, 6);

    XCTAssertEqual(rng.next, 2);
}

@end
