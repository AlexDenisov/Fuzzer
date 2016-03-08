//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "RangeRNG.h"

@interface RangeRNG ()

@property NSRange range;
@property NSUInteger nextNumber;

@end

@implementation RangeRNG

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];

    self.range = range;
    self.nextNumber = self.range.location;

    return self;
}

- (NSUInteger)next {
    NSUInteger result = self.nextNumber;

    self.nextNumber++;
    if (self.nextNumber >= self.range.location + self.range.length) {
        self.nextNumber = self.range.location;
    }

    return result;
}

@end
