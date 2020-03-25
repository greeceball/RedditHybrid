//
//  CHPostController.m
//  CHReddit
//
//  Created by Colby Harris on 3/25/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import "CHPostController.h"
#import "CHPost.h"

static NSString * const baseRedditURLString = @"https://www.reddit.com/r/funny.json";

@implementation CHPostController

+ (void)fetchPosts:(void (^)(NSArray<CHPost *> * _Nonnull))completion
{
    NSURL *finalURL = [NSURL URLWithString:baseRedditURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if (error)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        // Diving deep into children objects
        NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        NSDictionary *secondLevelJSON = topLevelJSON[@"data"];
        NSArray<NSDictionary *> *thirdLevelJSON = secondLevelJSON[@"children"];
        
        //[NSMutableArray new] is the same as [[NSMutableArray alloc] init];
        NSMutableArray *arrayOfPosts = [NSMutableArray new];
        
        for (NSDictionary *currentDictionary in thirdLevelJSON)
        {
            NSDictionary *postDictionary = currentDictionary[@"data"];
            CHPost *post = [[CHPost alloc] initWithDictionary:postDictionary];
            [arrayOfPosts addObject:post];
            
        }
        completion(arrayOfPosts);
                                                   
    }]resume];
}
+ (void)fetchImageForPost:(CHPost *)post completion:(void (^)(UIImage * _Nullable))completion
{
    if (post.thumbnail.length < 10)
    {
        completion(nil);
        return;
    }
    
    NSURL *imageURL = [NSURL URLWithString:post.thumbnail];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
}

@end
