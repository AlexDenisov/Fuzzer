//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "ReplaceNodeMutation.h"
#import "NodeReplacement.h"

@interface ReplaceNodeMutation ()

@property NodeReplacement *replacement;

@end

@implementation ReplaceNodeMutation

+ (id<Mutation>)mutationWithReplacement:(NodeReplacement *)replacement {
    ReplaceNodeMutation *mutation = [ReplaceNodeMutation new];

    mutation.replacement = replacement;

    return mutation;
}

- (NSDictionary *)mutateSample:(NSDictionary *)sample atNode:(NSString *)nodeName {
    NSMutableDictionary *mutatedCopy = [NSMutableDictionary dictionaryWithDictionary:sample];

    mutatedCopy[nodeName] = self.replacement.value;

    return mutatedCopy;
}

@end
