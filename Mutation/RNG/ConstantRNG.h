//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "RandomNumberGenerator.h"

@interface ConstantRNG : NSObject
    <RandomNumberGenerator>

- (instancetype)initWithConstant:(NSUInteger)constant;

@end
