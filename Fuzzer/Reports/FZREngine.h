//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EngineEnumeratorBlock)(NSDictionary *mutant);

@class FZRMutator;
@class FZRReport;

@interface FZREngine : NSObject

+ (instancetype)engineWithMutator:(FZRMutator *)mutator;

- (NSArray <FZRReport *> *)runEngineOverMutants:(EngineEnumeratorBlock)engineEnumeratorBlock;

@end
