//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "NodeReplacement.h"

@interface NodeReplacement ()

@property id value;

@end

@implementation NodeReplacement

+ (NSArray <NodeReplacement *> *)allReplacements {
    return @[
            [self integerReplacement],
            [self floatReplacement],
            [self stringReplacement],
            [self booleanReplacement],
            [self arrayReplacement],
            [self dictionaryReplacement],
            [self nullReplacement],
            [self nilReplacement]
    ];
}

+ (instancetype)integerReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = @42;

    return replacement;
}

+ (instancetype)floatReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = @42.13;

    return replacement;
}

+ (instancetype)stringReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = @"some random (actually no) string";

    return replacement;
}

+ (instancetype)booleanReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = @YES;

    return replacement;
}

+ (instancetype)arrayReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = @[ @"array", @"of",  @"strings" ];

    return replacement;
}

+ (instancetype)dictionaryReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = @{
            @"key" : @42,
            @"value" : @"value"
    };

    return replacement;
}

+ (instancetype)nullReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = [NSNull null];

    return replacement;
}

+ (instancetype)nilReplacement {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = nil;

    return replacement;
}

@end
