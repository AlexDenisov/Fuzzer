//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRReport.h"

@interface FZRReport ()

@property (atomic) NSDictionary *mutant;
@property (atomic) NSException *exception;

@end

@implementation FZRReport

+ (instancetype)reportWithMutant:(NSDictionary *)mutant exception:(NSException *)exception {
    FZRReport *report = [self new];

    report.mutant = mutant;
    report.exception = exception;

    return report;
}

- (BOOL)isEqual:(FZRReport *)report {
    return [self.exception isEqual:report.exception] && [self.mutant isEqual:report.mutant];
}

@end
