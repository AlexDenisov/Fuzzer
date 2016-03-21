//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "FZRMutation.h"

@class FZRNodeReplacement;

@interface FZRReplaceNodeMutation : NSObject
    <FZRMutation>

+ (id<FZRMutation>)mutationWithReplacement:(FZRNodeReplacement *)replacement;

@end
