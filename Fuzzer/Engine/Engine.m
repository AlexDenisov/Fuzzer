//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "Engine.h"
#import "Mutator.h"
#import "Report.h"

@interface Engine ()

@property Mutator *mutator;

@end

@implementation Engine

- (instancetype)initWithMutator:(Mutator *)mutator {
    self = [super init];

    self.mutator = mutator;

    return self;
}

- (NSArray <Report *> *)runEngineOverMutants:(EngineEnumeratorBlock)engineEnumeratorBlock {
    NSMutableArray *reports = [NSMutableArray new];

    [self.mutator enumerateMutantsUsingBLock:^(NSDictionary *mutant) {
        @try {
            engineEnumeratorBlock(mutant);
        }
        @catch (NSException *exception) {
            Report *report = [[Report alloc] initWithMutant:mutant exception:exception];
            [reports addObject:report];
        }
    }];

    return reports;
}

@end
