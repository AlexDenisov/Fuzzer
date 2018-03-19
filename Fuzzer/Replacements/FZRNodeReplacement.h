//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZRNodeReplacement : NSObject

+ (instancetype)replacementWithValue:(nullable id)value;

+ (NSArray <FZRNodeReplacement *> *)builtinReplacements;

+ (instancetype)integerReplacement;
+ (instancetype)floatReplacement;
+ (instancetype)stringReplacement;
+ (instancetype)booleanReplacement;
+ (instancetype)arrayReplacement;
+ (instancetype)dictionaryReplacement;
+ (instancetype)nullReplacement;
+ (instancetype)nilReplacement;

- (nullable id)value;

@end

NS_ASSUME_NONNULL_END
