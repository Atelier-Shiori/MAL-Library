//
//  AniListAuthWindow.h
//  MAL Library
//
//  Created by 小鳥遊六花 on 4/3/18.
//  Copyright © 2018 Atelier Shiori. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AniListAuthWindow : NSWindowController <WKUIDelegate,WKNavigationDelegate>
@property (strong) NSString *pin;
- (void)loadAuthorization;
@end