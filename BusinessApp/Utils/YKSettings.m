/*
 * Settings.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2013 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "YKSettings.h"
#import <YMKConfiguration.h>

static NSString *const kYandexMapKitApiKey = @"YandexMapKitApiKey";

static NSString *const kDefaultAPIKey = @"F0D5HD4KwIDCfFm7c9gpIY7w0VMy6I-nUaEqgkf9PspJ~AKuKrjEr3OL0g8sY8IPZaHPYZgKo~Bj02~QXe~I-2C16qZgNr6Lvzn7HT2wZNU=";


@implementation YKSettings

@dynamic apiKey;

static YKSettings *sharedSettings = nil;

+ (YKSettings *)sharedSettings {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSettings = [self new];
    });
    return sharedSettings;
}

- (NSString *)apiKey {
    NSString *apiKey = [[NSUserDefaults standardUserDefaults] stringForKey:kYandexMapKitApiKey];
    return [apiKey length] ? apiKey : kDefaultAPIKey;
}

- (void)setApiKey:(NSString *)apiKey {
    [[NSUserDefaults standardUserDefaults] setValue:apiKey forKey:kYandexMapKitApiKey];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [YMKConfiguration sharedInstance].apiKey = apiKey;
}

@end
