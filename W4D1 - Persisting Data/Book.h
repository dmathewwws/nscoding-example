//
//  Book.h
//  W4D1 - Persisting Data
//
//  Created by Daniel Mathews on 2015-02-01.
//  Copyright (c) 2015 com.lighthouse-labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject <NSCoding>

@property (strong, nonatomic) NSString *title;
@property (nonatomic) int ISBNNumber;
@property (nonatomic, strong) NSSet *authors;
@property (nonatomic, strong) NSMutableDictionary *chapters;

@end
