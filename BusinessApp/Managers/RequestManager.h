//
//  RequestManager.h
//  BusinessApp
//
//  Created by Extremall on 12.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface RequestManager : NSObject

+ (instancetype)sharedInstance;
- (void)setup;

- (void)getAllItemsWithCompletion:(BACompletionBlock)completion;
- (void)getNewsWithCompletion:(BACompletionBlock)completion;
- (void)getDetailedNews:(NSInteger)newsID completion:(BACompletionBlock)completion;
- (void)getAnnouncesWithCompletion:(BACompletionBlock)completion;
- (void)getDetailedAnnounce:(NSInteger)announceID completion:(BACompletionBlock)completion;
- (void)sendFeedback:(NSString *)name text:(NSString *)text completion:(BACompletionBlock)completion;
- (void)getPhotosWithCompletion:(BACompletionBlock)completion;

+ (void)downloadImageAtURL: (NSString *)urlString completion: (BACompletionBlock)completion;

@end
