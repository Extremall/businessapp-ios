//
//  RequestManager.m
//  BusinessApp
//
//  Created by Extremall on 12.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "RequestManager.h"
#import <CoreData/CoreData.h>

@interface NSManagedObjectContext ()
+ (void)MR_setRootSavingContext:(NSManagedObjectContext *)context;
+ (void)MR_setDefaultContext:(NSManagedObjectContext *)moc;
@end


@implementation RequestManager

+ (instancetype)sharedInstance
{
    static RequestManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[RequestManager alloc] init];
    });
    return _sharedInstance;
}

- (void)setup {
    [self setupStorage];
    [self setupNetworking];
}


@end
