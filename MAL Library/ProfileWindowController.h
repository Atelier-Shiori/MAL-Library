//
//  ProfileWindowController.h
//  Shukofukurou
//
//  Created by 桐間紗路 on 2017/10/07.
//  Copyright © 2017年 MAL Updater OS X Group. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <PXSourceList/PXSourceList.h>

@interface ProfileWindowController : NSWindowController <PXSourceListDataSource, PXSourceListDelegate, NSSplitViewDelegate, NSWindowDelegate>
@property (strong) IBOutlet NSView *mainview;
@property (strong) IBOutlet PXSourceList *sourceList;
- (void)setAppearance;
- (void)generateSourceList;
- (void)loadProfileWithUsername:(NSString *)username;
- (void)resetprofilewindow;
@end
