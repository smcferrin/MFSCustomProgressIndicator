//
//  MFSAppDelegate.h
//  Thin Progress
//
//  Created by Steve McFerrin on 5/24/14.
//  Copyright (c) 2014 Macflite. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MFSCustomProgressIndicator.h"


@interface MFSAppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSSlider *valueSlider;
@property (weak) IBOutlet MFSCustomProgressIndicator *progressIndicator;

@property (assign) IBOutlet NSWindow *window;

@end
