//
//  CHPost.m
//  CHReddit
//
//  Created by Colby Harris on 3/25/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import "CHPost.h"

@implementation CHPost

// Building the implementation of our initWithTitle
// func initWith(title: String, thumbnail: String) -> instancetype
- (instancetype)initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail
{
    //initing our class
    // self = super.init
    self = [super init];
    
    //checking to make sure we have a model
    //if self != nil
    if (self)
    {
        _title = title;
        _thumbnail = thumbnail;
    }
    return self;
}

- (instancetype) init
{
    return [self initWithTitle:@"" thumbnail:@""];
}

@end

//JSON handler

@implementation CHPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *thumbnail = dictionary[@"thumbnail"];
    
    return [self initWithTitle:title thumbnail:thumbnail];
}

@end
