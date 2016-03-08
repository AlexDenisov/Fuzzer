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

+ (instancetype)replacementWithValue:(id)value {
    NodeReplacement *replacement = [NodeReplacement new];

    replacement.value = value;

    return replacement;
}

+ (instancetype)integerReplacement {
    return [self replacementWithValue:@42];
}

+ (instancetype)floatReplacement {
    return [self replacementWithValue:@42.13];
}

+ (instancetype)stringReplacement {
    return [self replacementWithValue:@"some random (actually no) string"];
}

+ (instancetype)booleanReplacement {
    return [self replacementWithValue:@YES];
}

+ (instancetype)arrayReplacement {
    return [self replacementWithValue:@[ @"array", @"of",  @"strings" ]];
}

+ (instancetype)dictionaryReplacement {
    return [self replacementWithValue:@{ @"key" : @42, @"value" : @"value" }];
}

+ (instancetype)nullReplacement {
    return [self replacementWithValue:[NSNull null]];
}

+ (instancetype)nilReplacement {
    return [self replacementWithValue:nil];
}

@end
