//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZREngine.h"
#import "FZRMutator.h"
#import "FZRReport.h"

@interface FZREngine ()

@property FZRMutator *mutator;

@end

@implementation FZREngine

+ (instancetype)engineWithMutator:(FZRMutator *)mutator {
    FZREngine *engine = [FZREngine new];

    engine.mutator = mutator;

    return engine;
}

- (NSArray <FZRReport *> *)runEngineOverMutants:(EngineEnumeratorBlock)engineEnumeratorBlock {
    NSMutableArray *reports = [NSMutableArray new];

    [self.mutator enumerateMutantsUsingBLock:^(NSDictionary *mutant) {
        @try {
            engineEnumeratorBlock(mutant);
        }
        @catch (NSException *exception) {
            FZRReport *report = [FZRReport reportWithMutant:mutant exception:exception];
            [reports addObject:report];
        }
    }];

    return reports;
}

@end
