//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MutantEnumeratorBlock)(NSDictionary *mutant);

@class MutationGenerator;

@interface Mutator : NSObject

+ (instancetype)mutatorForOriginal:(NSDictionary *)original withMutationGenerator:(MutationGenerator *)mutationGenerator;

- (void)enumerateMutantsUsingBLock:(MutantEnumeratorBlock)mutantEnumeratorBlock;

- (NSUInteger)amountOfMutants;

@end
