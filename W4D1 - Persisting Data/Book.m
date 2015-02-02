//
//  Book.m
//  W4D1 - Persisting Data
//
//  Created by Daniel Mathews on 2015-02-01.
//  Copyright (c) 2015 com.lighthouse-labs. All rights reserved.
//

#import "Book.h"

@implementation Book

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.title = [decoder decodeObjectForKey:@"title"];
    self.ISBNNumber = [decoder decodeIntForKey:@"ISBNNumber"];
    self.authors = [decoder decodeObjectForKey:@"authors"];
    NSDictionary *chapersDict = [decoder decodeObjectForKey:@"chapersDict"];
    self.chapters = [[NSMutableDictionary alloc] initWithDictionary:chapersDict copyItems:YES];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeInt:self.ISBNNumber forKey:@"ISBNNumber"];
    [encoder encodeObject:self.authors forKey:@"authors"];
    [encoder encodeObject:self.chapters forKey:@"chapersDict"];
}


@end
