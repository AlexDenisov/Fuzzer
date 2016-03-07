//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "DeleteNodeMutation.h"
#import "RandomNumberGenerator.h"

@implementation DeleteNodeMutation

- (NSDictionary *)mutate:(NSDictionary *)original withRNG:(id <RandomNumberGenerator>)rng {
    NSMutableDictionary *mutatedCopy = [NSMutableDictionary dictionaryWithDictionary:original];

    NSString *keyForNodeToRemove = original.allKeys[rng.next];
    [mutatedCopy removeObjectForKey:keyForNodeToRemove];

    return mutatedCopy;
}

@end
