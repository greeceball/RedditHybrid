//
//  CHPost.h
//  CHReddit
//
//  Created by Colby Harris on 3/25/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHPost : NSObject
// Declaring a property of type NSString called title
// let title: String
@property (nonatomic, copy, readonly) NSString *title;

// Declaring a property of type NSString called thumbnail
// var thumbnail: String
@property (nonatomic, copy, nullable) NSString *thumbnail; // Nullable meaning its optional

// Declaring method signature initWithTitle that takes in a title and thumbnail
// func initWithTitle(title: String, thumbnail: String) -> instanetype
-(instancetype) initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail;

@end

// creating an extension to CHPost
// extention CHPost: JSONConvertable
@interface CHPost (JSONConvertable)

// Declaring method signature initWithDictionary that take in a dictionary
// func initWithDictionary(dictionary: Dictionary) -> instancetype
-(instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
