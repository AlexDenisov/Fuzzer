//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRDeleteNodeMutation.h"

@implementation FZRDeleteNodeMutation

- (NSDictionary *)mutateSample:(NSDictionary *)sample atNode:(NSString *)nodeName {
    NSMutableDictionary *mutatedCopy = [NSMutableDictionary dictionaryWithDictionary:sample];

    [mutatedCopy removeObjectForKey:nodeName];

    return mutatedCopy;
}

@end
