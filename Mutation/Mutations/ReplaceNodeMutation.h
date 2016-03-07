//
// Created by AlexDenisov on 07/03/16.
// Copyright (c) 2016 lowlevelbits. All rights reserved.
//

#import "Mutation.h"

@class NodeReplacement;

@interface ReplaceNodeMutation : NSObject
    <Mutation>

- (instancetype)initWithReplacement:(NodeReplacement *)replacement;

@end
