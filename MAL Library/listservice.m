//
//  listservice.m
//  Shukofukurou
//
//  Created by 桐間紗路 on 2017/12/14.
//  Copyright © 2017年 MAL Updater OS X Group. All rights reserved.
//

#import "listservice.h"
#import "Keychain.h"
#import "OAuthCredManager.h"

@implementation listservice
/* Note: Current Service type will be specified as the following:
         1. MyAnimeList
         2. Kitsu
         3. AniList */

+ (int)getCurrentServiceID {
    return (int)[NSUserDefaults.standardUserDefaults integerForKey:@"currentservice"];
}

+ (void)retrieveownListWithType:(int)type completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrieveList:[self getCurrentServiceUsername] listType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu retrieveOwnLisWithType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList retrieveList:[self getCurrentServiceUsername] listType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrieveList:(NSString *)username listType:(int)type completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrieveList:username listType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu retrieveList:username listType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList retrieveList:username listType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrieveAiringSchedule:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrieveAiringSchedule:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [MyAnimeList retrieveAiringSchedule:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [MyAnimeList retrieveAiringSchedule:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)searchTitle:(NSString *)searchterm withType:(int)type completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList searchTitle:searchterm withType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu searchTitle:searchterm withType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList searchTitle:searchterm withType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)advsearchTitle:(NSString *)searchterm withType:(int)type withGenres:(NSString *)genres excludeGenres:(bool)exclude startDate:(NSDate *)startDate endDate:(NSDate *)endDate minScore:(int)minscore rating:(int)rating withStatus:(int)status completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList advsearchTitle:searchterm withType:type withGenres:genres excludeGenres:exclude startDate:startDate endDate:endDate minScore:minscore rating:rating withStatus:status completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrieveTitleInfo:(int)titleid withType:(int)type useAccount:(bool)useAccount completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrieveTitleInfo:titleid withType:type useAccount:useAccount completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu retrieveTitleInfo:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList retrieveTitleInfo:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrieveReviewsForTitle:(int)titleid withType:(int)type completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrieveReviewsForTitle:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu retrieveReviewsForTitle:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList retrieveReviewsForTitle:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retriveUpdateHistory:(NSString *)username completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retriveUpdateHistory:username completion:completionHandler error:errorHandler];
            break;
        }
        case 2:
        case 3: {
            completionHandler(@[]);
            break;
        }
        default: {
            break;
        }
    }
}

+ (bool)verifyAccount {
    switch ([self getCurrentServiceID]) {
        case 1: {
            return [MyAnimeList verifyAccount];
        }
        default: {
            break;
        }
    }
    return false;
}

+ (void)verifyAccountWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    [self verifyAccountWithUsername:username password:password withServiceID:[self getCurrentServiceID] completion:completionHandler error:errorHandler];

}

+ (void)verifyAccountWithUsername:(NSString *)username password:(NSString *)password withServiceID:(int)serviceid completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch (serviceid) {
        case 1: {
            [MyAnimeList verifyAccountWithUsername:username password:password completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu verifyAccountWithUsername:username password:password completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList verifyAccountWithPin:password completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrieveProfile:(NSString *)username completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrieveProfile:username completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu retrieveProfile:username completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList retrieveProfile:username completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)addAnimeTitleToList:(int)titleid withEpisode:(int)episode withStatus:(NSString *)status withScore:(int)score completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList addAnimeTitleToList:titleid withEpisode:episode withStatus:status withScore:score completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu addAnimeTitleToList:titleid withEpisode:episode withStatus:status withScore:score completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList addAnimeTitleToList:titleid withEpisode:episode withStatus:status withScore:score completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)addMangaTitleToList:(int)titleid withChapter:(int)chapter withVolume:(int)volume withStatus:(NSString *)status withScore:(int)score completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList addMangaTitleToList:titleid withChapter:chapter withVolume:volume withStatus:status withScore:score completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu addMangaTitleToList:titleid withChapter:chapter withVolume:volume withStatus:status withScore:score completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList addMangaTitleToList:titleid withChapter:chapter withVolume:volume withStatus:status withScore:score completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)updateAnimeTitleOnList:(int)titleid withEpisode:(int)episode withStatus:(NSString *)status withScore:(int)score withExtraFields:(NSDictionary *)efields completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList updateAnimeTitleOnList:titleid withEpisode:episode withStatus:status withScore:score withExtraFields:efields completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu updateAnimeTitleOnList:titleid withEpisode:episode withStatus:status withScore:score withExtraFields:efields completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList updateAnimeTitleOnList:titleid withEpisode:episode withStatus:status withScore:score withExtraFields:efields completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)updateMangaTitleOnList:(int)titleid withChapter:(int)chapter withVolume:(int)volume withStatus:(NSString *)status withScore:(int)score withExtraFields:(NSDictionary *)efields completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList updateMangaTitleOnList:titleid withChapter:chapter withVolume:volume withStatus:status withScore:score withExtraFields:efields completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu updateMangaTitleOnList:titleid withChapter:chapter withVolume:volume withStatus:status withScore:score withExtraFields:efields completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList updateMangaTitleOnList:titleid withChapter:chapter withVolume:volume withStatus:status withScore:score withExtraFields:efields completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)removeTitleFromList:(int)titleid withType:(int)type completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList removeTitleFromList:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [Kitsu removeTitleFromList:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList removeTitleFromList:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrieveTitleIdsWithlistType:(int)type completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            break;
        }
        case 2: {
            [Kitsu retrieveTitleIdsWithlistType:type completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList retrieveTitleIdsWithlistType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrievemessagelist:(int)page completionHandler:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrievemessagelist:page completionHandler:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            break;
        }
        case 3: {
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrievemessage:(int)messageid completionHandler:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrievemessage:messageid completionHandler:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            break;
        }
        case 3: {
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)sendmessage:(NSString *)username withSubject:(NSString *)subject withMessage:(NSString *)message withthreadID:(int)threadid completionHandler:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList sendmessage:username withSubject:subject withMessage:message withthreadID:threadid completionHandler:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            break;
        }
        case 3: {
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)deletemessage:(int)messageid completionHandler:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList deletemessage:messageid completionHandler:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            break;
        }
        case 3: {
            break;
        }
        default: {
            break;
        }
    }
}

+ (void)retrieveStaff:(int)titleid withType:(int)type completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrieveStaff:titleid completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            //[Kitsu retrieveStaff:titleid completion:completionHandler error:errorHandler];
            /*[Kitsu retrieveTitleInfo:titleid withType:KitsuAnime completion:^(id responseObject) {
                [TitleIdConverter getMALIDFromKitsuId:titleid withTitle:responseObject[@"title"] titletype:responseObject[@"type"] withType:KitsuAnime completionHandler:^(int malid) {
                    [MyAnimeList retrieveStaff:malid completion:completionHandler error:errorHandler];
                } error:errorHandler];
            } error:^(NSError *error) {
                errorHandler(error);
            }];*/
            break;
        }
        case 3: {
            [AniList retrieveStaff:titleid withType:type completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}
+ (void)retrievePersonDetails:(int)personid completion:(void (^)(id responseObject)) completionHandler error:(void (^)(NSError * error)) errorHandler {
    switch ([self getCurrentServiceID]) {
        case 1: {
            [MyAnimeList retrievePersonDetails:personid completion:completionHandler error:errorHandler];
            break;
        }
        case 2: {
            [MyAnimeList retrievePersonDetails:personid completion:completionHandler error:errorHandler];
            break;
        }
        case 3: {
            [AniList retrievePersonDetails:personid completion:completionHandler error:errorHandler];
            break;
        }
        default: {
            break;
        }
    }
}

+ (NSString *)retrieveListFileName:(int)type {
    return [self retrieveListFileName:type withServiceID:[self getCurrentServiceID]];
}

+ (NSString *)retrieveListFileName:(int)type withServiceID:(int)serviceid {
    NSDictionary *usernames = [self getAllUserNames];
    switch (serviceid) {
        case 1: {
            if (type == 0) {
                return [NSString stringWithFormat:@"mal-animelist-%@.json",usernames[@"myanimelist"]];
            }
            else if (type == 1) {
                return [NSString stringWithFormat:@"mal-mangalist-%@.json",usernames[@"myanimelist"]];
            }
            break;
        }
        case 2: {
            if (type == 0) {
                return [NSString stringWithFormat:@"kitsu-animelist-%@.json",usernames[@"kitsu"]];
            }
            else if (type == 1) {
                return [NSString stringWithFormat:@"kitsu-mangalist-%@.json",usernames[@"kitsu"]];
            }
            break;
        }
        case 3: {
            if (type == 0) {
                return [NSString stringWithFormat:@"anilist-animelist-%@.json",usernames[@"anilist"]];
            }
            else if (type == 1) {
                return [NSString stringWithFormat:@"anilist-mangalist-%@.json",usernames[@"anilist"]];
            }
            break;
        }
        default: {
            break;
        }
    }
    return @"";
}

+ (id)retrieveHistoryFileName {
    return [self retrieveHistoryFileName:[self getCurrentServiceID]];
}

+ (id)retrieveHistoryFileName:(int)serviceid {
    NSDictionary *usernames = [self getAllUserNames];
    switch (serviceid) {
        case 1: {
            return [NSString stringWithFormat:@"mal-history-%@.json",usernames[@"myanimelist"]];
        }
        case 2: {
            return [NSString stringWithFormat:@"kitsu-history-%@.json",usernames[@"kitsu"]];
        }
        case 3: {
            return [NSString stringWithFormat:@"anilist-history-%@.json",usernames[@"anilist"]];

        }
        default: {
            break;
        }
    }
    return @"";
}

+ (bool)checkAccountForCurrentService {
    int service = [listservice getCurrentServiceID];
    bool hasUserInfo =  ([listservice getCurrentUserID] > 0 || [listservice getCurrentServiceUsername].length > 0);
    switch (service) {
        case 1:
            return ([Keychain checkaccount] || hasUserInfo);
        case 2:
        case 3:
            return ([OAuthCredManager.sharedInstance getFirstAccountForService:service] || hasUserInfo);
        default:
            return true;
    }
}

+ (NSString *)getCurrentServiceUsername {
    switch ([self getCurrentServiceID]) {
        case 1:
            return [Keychain getusername];
        case 2:
            return [NSUserDefaults.standardUserDefaults valueForKey:@"kitsu-username"];
        case 3:
            return [NSUserDefaults.standardUserDefaults valueForKey:@"anilist-username"];
        default:
            break;
    }
    return @"";
}

+ (NSDictionary *)getAllUserNames {
    NSString *kitsuusername = [NSUserDefaults.standardUserDefaults valueForKey:@"kitsu-username"];
    NSString *anilistusername = [NSUserDefaults.standardUserDefaults valueForKey:@"anilist-username"];
    return @{ @"myanimelist" : [Keychain getusername] ? [Keychain getusername] : [NSNull null], @"kitsu" : kitsuusername && kitsuusername.length > 0 ? kitsuusername : [NSNull null], @"anilist" : anilistusername && anilistusername.length > 0 ? anilistusername : [NSNull null] };
}

+ (NSDictionary *)getAllUserID {
    int kitsuid = (int)[NSUserDefaults.standardUserDefaults integerForKey:@"kitsu-userid"];
    int anilistid = (int)[NSUserDefaults.standardUserDefaults integerForKey:@"anilist-userid"];
    return @{ @"kitsu" : kitsuid > 0 ? @(kitsuid) : [NSNull null], @"anilist" :  anilistid > 0 ? @(anilistid) : [NSNull null]};
}


+ (NSString *)currentservicename {
    switch ([self getCurrentServiceID]) {
        case 1:
            return @"MyAnimeList";
        case 2:
            return @"Kitsu";
        case 3:
            return @"AniList";
        default:
            break;
    }
    return @"";
}

+ (int)getCurrentUserID {
    switch ([self getCurrentServiceID]) {
        case 1:
            return -1;
        case 2:
            return (int)[NSUserDefaults.standardUserDefaults integerForKey:@"kitsu-userid"];
        case 3:
            return (int)[NSUserDefaults.standardUserDefaults integerForKey:@"anilist-userid"];
        default:
            return -1;
    }
}
+ (NSString *)getCurrentUserAvatar {
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    switch ([self getCurrentServiceID]) {
        case 1:
            return @"";
        case 2:
            return [defaults valueForKey:@"kitsu-avatar"];
        case 3:
            return [defaults valueForKey:@"anilist-avatar"];
        default:
            return @"";
    }
}
@end
