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

- (instancetype)initWithMutant:(NSDictionary *)mutant exception:(NSException *)exception {
    self = [super init];

    self.mutant = mutant;
    self.exception = exception;

    return self;
}

- (BOOL)isEqual:(Report *)report {
    return [self.exception isEqual:report.exception] && [self.mutant isEqual:report.mutant];
}

@end
