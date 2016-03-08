//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NodeReplacement : NSObject

+ (instancetype)replacementWithValue:(id)value;

+ (NSArray <NodeReplacement *> *)builtinReplacements;

+ (instancetype)integerReplacement;
+ (instancetype)floatReplacement;
+ (instancetype)stringReplacement;
+ (instancetype)booleanReplacement;
+ (instancetype)arrayReplacement;
+ (instancetype)dictionaryReplacement;
+ (instancetype)nullReplacement;
+ (instancetype)nilReplacement;

- (id)value;

@end
