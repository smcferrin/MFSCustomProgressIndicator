//
//  MFSAppDelegate.m
//  Thin Progress
//
//  Created by Steve McFerrin on 5/24/14.
//  Copyright (c) 2014 Macflite. All rights reserved.
//

#import "MFSAppDelegate.h"

@implementation MFSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)updateProgressIndicator:(id)sender {
    
    NSSlider *slider = sender;
    self.progressIndicator.progress = slider.floatValue;
}

@end
