//
//  RequestManager.m
//  BusinessApp
//
//  Created by Extremall on 12.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "RequestManager.h"
#import <CoreData/CoreData.h>
#import <RestKit.h>
#import "Constants.h"
#import "ServiceURLs.h"
#import <MagicalRecord/CoreData+MagicalRecord.h>
#import "AppHelper.h"
#import "Enums.h"

// Error domain for API
NSString * const SRErrorDomain = @"org.GiveMeSign.ErrorDomain";


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

- (void)setupStorage {
    //  Configure RestKit Core Data stack
    NSError *error = nil;
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Model" ofType:@"momd"]];
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    
    [managedObjectStore createPersistentStoreCoordinator];
    
    NSPersistentStore *persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:[kDocumentsPath stringByAppendingPathComponent:@"Model.sqlite"]
                                                                     fromSeedDatabaseAtPath:nil
                                                                          withConfiguration:nil
                                                                                    options:nil
                                                                                      error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    NSLog(@"persistent store %@", persistentStore);
    
    [managedObjectStore createManagedObjectContexts];
    
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    
    // Configure MagicalRecord to use RestKit's Core Data stack
    [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:managedObjectStore.persistentStoreCoordinator];
    [NSManagedObjectContext MR_setRootSavingContext:managedObjectStore.persistentStoreManagedObjectContext];
    [NSManagedObjectContext MR_setDefaultContext:managedObjectStore.mainQueueManagedObjectContext];
}

- (void)setupNetworking {
    //
    //  Logging
    //
    //RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    //RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    
    //
    //  Inner request manager
    //
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.HTTPClient.parameterEncoding = AFFormURLParameterEncoding;
    [manager setRequestSerializationMIMEType:RKMIMETypeFormURLEncoded];
    [manager setAcceptHeaderWithMIMEType:RKMIMETypeFormURLEncoded];
    manager.managedObjectStore = [RKManagedObjectStore defaultStore];
    [RKObjectManager setSharedManager:manager];
    
    //[manager.HTTPClient setDefaultHeader:@"User-Agent" value:@"application/x-www-form-urlencoded"];
    
    //
    //  Mappings
    //
    [self addMappings];
}

- (void)addMappings {
    RKObjectManager *manager = [RKObjectManager sharedManager];
    
    //  Shared fields for mappings
    
    NSDictionary *dictItem =
    @{
      @"id" : @"itemID",
      @"name" : @"name",
      @"image" : @"imageURL",
      @"isFolder" : @"isFolder",
      @"price" : @"price"
      };
    
    
    NSDictionary *dictNews =
    @{
      @"id" : @"newsID",
      @"title" : @"title",
      @"date" : @"date",
      @"type" : @"type",
      @"content" : @"content"
      };
    
    NSDictionary *dictAnnounce =
    @{
      @"id" : @"announceID",
      @"title" : @"title",
      @"image" : @"imageURL",
      @"type" : @"type",
      @"content" : @"content"
      };
    
    NSDictionary *dictPhoto =
    @{
      @"id" : @"photoID",
      @"url" : @"url",
      @"desc" : @"desc"
      };
    
    //
    //  Mappings
    //
    
    //  user
    RKEntityMapping *mappingItem = [RKEntityMapping mappingForEntityForName:@"BAItem" inManagedObjectStore:manager.managedObjectStore];
    mappingItem.identificationAttributes = @[@"itemID"];
    [mappingItem addAttributeMappingsFromDictionary:dictItem];
    
    [mappingItem addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"children" toKeyPath:@"children" withMapping:mappingItem]];
    
    RKEntityMapping *mappingNews = [RKEntityMapping mappingForEntityForName:@"BANews" inManagedObjectStore:manager.managedObjectStore];
    mappingNews.identificationAttributes = @[@"newsID"];
    [mappingNews addAttributeMappingsFromDictionary:dictNews];
    
    RKEntityMapping *mappingAnnounces = [RKEntityMapping mappingForEntityForName:@"BAAnnounce" inManagedObjectStore:manager.managedObjectStore];
    mappingAnnounces.identificationAttributes = @[@"announceID"];
    [mappingAnnounces addAttributeMappingsFromDictionary:dictAnnounce];
    
    RKEntityMapping *mappingPhoto = [RKEntityMapping mappingForEntityForName:@"BAPhoto" inManagedObjectStore:manager.managedObjectStore];
    mappingPhoto.identificationAttributes = @[@"photoID"];
    [mappingPhoto addAttributeMappingsFromDictionary:dictPhoto];
    
    //
    //  Responses
    //
    
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:mappingItem
                                                                                method:RKRequestMethodGET
                                                                           pathPattern:GetAllItems
                                                                               keyPath:@"items"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:mappingNews
                                                                                method:RKRequestMethodGET
                                                                           pathPattern:News
                                                                               keyPath:@"news"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:mappingNews
                                                                                method:RKRequestMethodGET
                                                                           pathPattern:DetailedNews
                                                                               keyPath:@"news"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:mappingAnnounces
                                                                                method:RKRequestMethodGET
                                                                           pathPattern:Announces
                                                                               keyPath:@"announces"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:mappingAnnounces
                                                                                method:RKRequestMethodGET
                                                                           pathPattern:DetailedAnnounce
                                                                               keyPath:@"announce"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:mappingPhoto
                                                                                method:RKRequestMethodGET
                                                                           pathPattern:Photos
                                                                               keyPath:@"photos"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
}

#pragma mark - API methods

- (void)getAllItemsWithCompletion:(BACompletionBlock)completion
{
    [self getRequest:GetAllItems
           parameters:nil
           completion:^(id result, NSError *error) {
               completion(result, error);
           }];
}

- (void)getNewsWithCompletion:(BACompletionBlock)completion
{
    [self getRequest:News
          parameters:nil
          completion:^(id result, NSError *error) {
              completion(result, error);
          }];
}

- (void)getDetailedNews:(NSInteger)newsID completion:(BACompletionBlock)completion
{
    [self getRequest:DetailedNews
          parameters:nil
          completion:^(id result, NSError *error) {
              completion(result, error);
          }];
}

- (void)getAnnouncesWithCompletion:(BACompletionBlock)completion
{
    [self getRequest:Announces
          parameters:nil
          completion:^(id result, NSError *error) {
              completion(result, error);
          }];
}

- (void)getDetailedAnnounce:(NSInteger)announceID completion:(BACompletionBlock)completion
{
    [self getRequest:DetailedAnnounce
          parameters:nil
          completion:^(id result, NSError *error) {
              completion(result, error);
          }];
}

- (void)getPhotosWithCompletion:(BACompletionBlock)completion
{
    [self getRequest:Photos
          parameters:nil
          completion:^(id result, NSError *error) {
              completion(result, error);
          }];
}

+ (void)downloadImageAtURL: (NSString *)urlString completion: (BACompletionBlock)completion {
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:urlString]
                                                    options:SDWebImageAllowInvalidSSLCertificates
                                                   progress:^(NSInteger receivedSize, NSInteger expectedSize) {}
                                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                      completion(image, error);
                                                  }];
}

- (void)sendFeedback:(NSString *)name text:(NSString *)text completion:(BACompletionBlock)completion
{
    [[self class] sendRequestWithoutMapping:SendFeedback
                             params:@{@"name" : name, @"text" : text}
                         completion:completion];
}

#pragma mark - Handling Methods

- (void)printRequest: (RKObjectRequestOperation *)operation {
    NSLog(@"%@", operation.HTTPRequestOperation.request.URL);
}

- (void)printResponse: (RKObjectRequestOperation *)operation {
    
    NSString *resp = @"<no response>";
    
    NSData *responseData = operation.HTTPRequestOperation.responseData;
    if (responseData)
    {
        NSDictionary *parsedResponse = (NSDictionary*)[RKMIMETypeSerialization objectFromData:responseData    MIMEType:RKMIMETypeJSON error:nil];
        
        resp = [parsedResponse description];
        
        //DLog(@"parsedResponse = %@\n%@", operation.HTTPRequestOperation.request.URL, resp);
    }
}

- (void)handleError: (NSError *)error forOperation: (RKObjectRequestOperation *)operation {
    
}

#pragma mark Requests

- (void)getRequest: (NSString *)route parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"GET" object:nil parameters:params completion:completion];
}

- (void)postRequest: (NSString *)route parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"POST" object:nil parameters:params completion:completion];
}

- (void)putRequest: (NSString *)route parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"PUT" object:nil parameters:params completion:completion];
}

- (void)deleteRequest: (NSString *)route parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"DELETE" object:nil parameters:params completion:completion];
}

- (void)headRequest: (NSString *)route parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"HEAD" object:nil parameters:params completion:completion];
}

- (void)getRequest: (NSString *)route object: (id)object parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"GET" object:object parameters:params completion:completion];
}

- (void)postRequest: (NSString *)route object: (id)object parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"POST" object:object parameters:params completion:completion];
}

- (void)putRequest: (NSString *)route object: (id)object parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"PUT" object:object parameters:params completion:completion];
}

- (void)deleteRequest: (NSString *)route object: (id)object parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"DELETE" object:object parameters:params completion:completion];
}

- (void)headRequest: (NSString *)route object: (id)object parameters: (NSDictionary *)params completion: (BACompletionBlock)completion {
    [self sendRequest:route method:@"HEAD" object:object parameters:params completion:completion];
}

- (void)sendRequest: (NSString *)route
             method: (NSString *)method
             object: (id)object
         parameters: (NSDictionary *)params
         completion: (BACompletionBlock)completion
{
    [self sendRequest:route method:method object:object parameters:params requestAction:nil completion:completion];
}

- (void)sendRequest: (NSString *)route
             method: (NSString *)method
             object: (id)object
         parameters: (NSDictionary *)params
      requestAction: (void(^)(NSMutableURLRequest *request))requestAction
         completion: (BACompletionBlock)completion {
    __block NSInteger errCode = 0;
    
    if ([AppHelper isInternetAvailable])
    {
        AFHTTPClient *client = [[RKObjectManager sharedManager] HTTPClient];
        client.parameterEncoding = AFFormURLParameterEncoding;
        
        RKObjectRequestOperation *request = [[RKObjectManager sharedManager] appropriateObjectRequestOperationWithObject:object
                                                                                                                  method:RKRequestMethodFromString(method)
                                                                                                                    path:route
                                                                                                              parameters:params];
        if (requestAction != nil)
            requestAction((NSMutableURLRequest *)request.HTTPRequestOperation.request);
        
        [request setWillMapDeserializedResponseBlock:^id(id deserializedResponseBody) {
            errCode = [deserializedResponseBody[@"ErrCode"] intValue];
            
            
            return deserializedResponseBody;
        }];
        
        [request setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self printResponse:operation];
            
            if (errCode == 0)
                completion([mappingResult array], nil);
            else
            {
                NSError *error = [NSError errorWithDomain:SRErrorDomain code:errCode userInfo:[mappingResult dictionary]];
                completion(nil, error);
            }
        }
                                       failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                           [self printResponse:operation];
                                           if (errCode != 0)
                                           {
                                               NSError *error = [NSError errorWithDomain:SRErrorDomain code:errCode userInfo:nil];
                                               completion(nil, error);
                                           }
                                           else
                                               completion(nil, error);
                                       }];
        [[RKObjectManager sharedManager] enqueueObjectRequestOperation:request];
        //[self printRequest:request];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:SRErrorDomain code:ErrorCodeTroublesInternet userInfo:nil];
        completion(nil, error);
    }
}

#pragma mark - Private Methods

+ (void)sendRequestWithoutMapping: (NSString *)route
                           params: (NSDictionary *)params
                       completion: (BACompletionBlock)completion {
    
    if ([AppHelper isInternetAvailable])
    {
        AFHTTPClient* client = [[RKObjectManager sharedManager] HTTPClient];
        [client getPath:route
             parameters:params
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    completion(responseObject, nil);
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    completion(nil, error);
                }];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:SRErrorDomain code:ErrorCodeTroublesInternet userInfo:nil];
        completion(nil, error);
    }
}

+ (void)postRequestWithoutMapping: (NSString *)route
                           params: (NSDictionary *)params
                       completion: (BACompletionBlock)completion {
    
    if ([AppHelper isInternetAvailable])
    {
        AFHTTPClient* client = [[RKObjectManager sharedManager] HTTPClient];
        client.parameterEncoding = AFFormURLParameterEncoding;
        [client postPath:route
              parameters:params
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     NSInteger errCode = [responseObject[@"ErrCode"] integerValue];
                     if (errCode == 0)
                         completion(responseObject, nil);
                     else
                     {
                         NSError *error = [NSError errorWithDomain:SRErrorDomain code:errCode userInfo:nil];
                         completion(nil, error);
                     }
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     completion(nil, error);
                 }];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:SRErrorDomain code:ErrorCodeTroublesInternet userInfo:nil];
        completion(nil, error);
    }
}


@end
