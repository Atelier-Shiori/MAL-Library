//
//  AtarashiiAPIListFormatKitsu.h
//  Shukofukurou
//
//  Created by 桐間紗路 on 2017/12/18.
//  Copyright © 2017年 MAL Updater OS X Group. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KitsuListRetriever;

@interface AtarashiiAPIListFormatKitsu: NSObject
+ (NSDictionary *)KitsutoAtarashiiAnimeList: (KitsuListRetriever *)retriever;
+ (NSDictionary *)KitsutoAtarashiiMangaList: (KitsuListRetriever *)retriever;
+ (NSDictionary *)KitsuAnimeInfotoAtarashii:(NSDictionary *)data;
+ (NSDictionary *)KitsuMangaInfotoAtarashii:(NSDictionary *)data;
+ (NSArray *)KitsuAnimeSearchtoAtarashii:(NSDictionary *)data;
+ (NSArray *)KitsuMangaSearchtoAtarashii:(NSDictionary *)data;
+ (NSArray *)KitsuReactionstoAtarashii:(NSDictionary *)data withType:(int)type;
+ (NSDictionary *)KitsuUsertoAtarashii:(NSDictionary *)userinfo;
+ (NSArray *)generateIDArrayWithType:(int)type withIdArray:(NSArray *)idarray;
@end
