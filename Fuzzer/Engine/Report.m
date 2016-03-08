//
// Created by AlexDenisov on 08/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "Report.h"

@interface Report ()

@property NSDictionary *mutant;
@property NSException *exception;

@end

@implementation Report

+ (instancetype)reportWithMutant:(NSDictionary *)mutant exception:(NSException *)exception {
    Report *report = [self new];

    report.mutant = mutant;
    report.exception = exception;

    return report;
}

- (BOOL)isEqual:(Report *)report {
    return [self.exception isEqual:report.exception] && [self.mutant isEqual:report.mutant];
}

@end
