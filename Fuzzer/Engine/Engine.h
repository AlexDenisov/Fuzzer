//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EngineEnumeratorBlock)(NSDictionary *mutant);

@class Mutator;
@class Report;

@interface Engine : NSObject

- (instancetype)initWithMutator:(Mutator *)mutator;

- (NSArray <Report *> *)runEngineOverMutants:(EngineEnumeratorBlock)engineEnumeratorBlock;

@end
