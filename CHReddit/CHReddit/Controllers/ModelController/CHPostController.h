//
//  CHPostController.h
//  CHReddit
//
//  Created by Colby Harris on 3/25/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CHPost;
@interface CHPostController : NSObject


+(void)fetchPosts:(void(^)(NSArray<CHPost *> *))completion;
+(void)fetchImageForPost:(CHPost *)post completion:(void(^)(UIImage * _Nullable))completion;



@end

NS_ASSUME_NONNULL_END
