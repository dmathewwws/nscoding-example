//
//  Book.m
//  W4D1 - Persisting Data
//
//  Created by Daniel Mathews on 2015-02-01.
//  Copyright (c) 2015 com.lighthouse-labs. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tile = @"title";
    }
    return self;
}
@end
