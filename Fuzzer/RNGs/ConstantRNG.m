//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "ConstantRNG.h"

@interface ConstantRNG ()

@property NSUInteger constant;

@end

@implementation ConstantRNG

- (instancetype)initWithConstant:(NSUInteger)constant {
    self = [super init];

    self.constant = constant;

    return self;
}

- (NSUInteger)next {
    return self.constant;
}

@end
