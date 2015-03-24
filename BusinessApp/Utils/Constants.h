//
//  Constants.h
//  BusinessApp
//
//  Created by Extremall on 12.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#ifndef BusinessApp_Constants_h
#define BusinessApp_Constants_h

#define kDocumentsPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

typedef void(^BACompletionBlock)(id result, NSError *error);

#define mainStoryboard ([UIStoryboard storyboardWithName:@"Main" bundle:nil])

// Settings

#define kDownloadAll YES

// Info

#define kLatitude 47.112351
#define kLongitude 39.423992

#define kName @"Ван Гог"

#define kPhoneNumber @"+79185841525"

#endif
