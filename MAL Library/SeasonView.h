//
//  SeasonView.h
//  Shukofukurou
//
//  Created by 天々座理世 on 2017/03/29.
//  Copyright © 2017-2018 MAL Updater OS X Group and Moy IT Solutions. All rights reserved. Licensed under 3-clause BSD License
//

#import <Cocoa/Cocoa.h>

@class MainWindow;

@interface SeasonView : NSViewController <NSTableViewDelegate>
@property (strong) IBOutlet MainWindow *mw;
@property (strong) IBOutlet NSTableView *seasontableview;
@property (strong) IBOutlet NSArrayController *seasonarraycontroller;
@property (strong) IBOutlet NSToolbarItem *addtitleitem;

- (void)performreload:(bool)refresh completion:(void (^)(bool success)) completionHandler;
- (IBAction)seasondoubleclick:(id)sender;
- (IBAction)yearchange:(id)sender;
- (IBAction)seasonchange:(id)sender;
- (void)populateyearpopup;
- (void)populateseasonpopups;
@end
