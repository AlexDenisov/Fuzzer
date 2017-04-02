//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRReplaceNodeMutation.h"
#import "FZRNodeReplacement.h"

@interface FZRReplaceNodeMutation ()

@property (atomic) FZRNodeReplacement *replacement;

@end

@implementation FZRReplaceNodeMutation

+ (id<FZRMutation>)mutationWithReplacement:(FZRNodeReplacement *)replacement {
    FZRReplaceNodeMutation *mutation = [FZRReplaceNodeMutation new];

    mutation.replacement = replacement;

    return mutation;
}

- (NSDictionary *)mutateSample:(NSDictionary *)sample atNode:(NSString *)nodeName {
    NSMutableDictionary *mutatedCopy = [NSMutableDictionary dictionaryWithDictionary:sample];

    mutatedCopy[nodeName] = self.replacement.value;

    return mutatedCopy;
}

@end
