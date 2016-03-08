//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "ReplaceNodeMutation.h"
#import "NodeReplacement.h"
#import "RandomNumberGenerator.h"

@interface ReplaceNodeMutation ()

@property NodeReplacement *replacement;

@end

@implementation ReplaceNodeMutation

+ (id<Mutation>)mutationWithReplacement:(NodeReplacement *)replacement {
    ReplaceNodeMutation *mutation = [ReplaceNodeMutation new];

    mutation.replacement = replacement;

    return mutation;
}

- (NSDictionary *)mutate:(NSDictionary *)original withRNG:(id <RandomNumberGenerator>)rng {
    NSMutableDictionary *mutatedCopy = [NSMutableDictionary dictionaryWithDictionary:original];

    NSString *keyForNodeToReplace = original.allKeys[rng.next];
    mutatedCopy[keyForNodeToReplace] = self.replacement.value;

    return mutatedCopy;
}

@end
