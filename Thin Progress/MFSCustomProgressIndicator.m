//
//  MFSCustomProgressIndicator.m
//  Thin Progress
//
//  Copyright 2014 Steve McFerrin
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "MFSCustomProgressIndicator.h"


@implementation MFSCustomProgressIndicator

#define MFSCustomProgressIndicatorTickHeight 6
#define MFSCustomProgressIndicatorHeight 2.0

- (NSColor *)indicatorBackgroundColor
{
    if (_indicatorBackgroundColor == nil) {
        _indicatorBackgroundColor = [NSColor blackColor];
    }
    return _indicatorBackgroundColor;
}

- (NSColor *)indicatorForegoundColor
{
    if (_indicatorForegoundColor == nil) {
        _indicatorForegoundColor = [NSColor grayColor];
    }
    return _indicatorForegoundColor;
}

- (NSColor *)tickMarkColor
{
    if (_tickMarkColor == nil) {
        _tickMarkColor = [NSColor blackColor];
    }
    return _tickMarkColor;
}

- (CGFloat)indicatorProgress
{
    CGFloat progress;
    progress = (self.frame.size.width * self.progress);
    return progress;
}

- (void)setProgress:(CGFloat)progress
{
    if (progress > 1 || progress < 0) {
        return;
    }
    _progress = progress;
    
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{    
    [self drawProgressBackgroundInRect:dirtyRect];
    [self drawProgressForegroundInRect:dirtyRect];
    
    if (self.showsTickMark == YES) {
        [self drawProgressIndicatorTickInRect:dirtyRect];
    }
}

- (void)drawProgressIndicatorTickInRect:(NSRect)rect
{
    NSBezierPath *tickMarkIndicator = [NSBezierPath bezierPath];
    [tickMarkIndicator setLineWidth: 0.5];
    
    CGFloat tickMarkTopY    = (self.frame.size.height / 2) + (MFSCustomProgressIndicatorTickHeight / 2);
    CGFloat tickMarkBottomY = (self.frame.size.height / 2) - (MFSCustomProgressIndicatorTickHeight / 2);
    CGFloat tickMarkX = self.indicatorProgress;
    
    NSPoint startPoint = {tickMarkX , tickMarkTopY};
    NSPoint endPoint   = {tickMarkX , tickMarkBottomY};
    
    [tickMarkIndicator  moveToPoint:startPoint];
    [tickMarkIndicator lineToPoint:endPoint];
    
    [self.tickMarkColor set];
    
    [tickMarkIndicator stroke];
}

- (void)drawProgressBackgroundInRect:(NSRect)rect
{
    NSBezierPath *progressBackgroundPath = [NSBezierPath bezierPath];
    [progressBackgroundPath setLineWidth:MFSCustomProgressIndicatorHeight];
    
    NSPoint startPoint = {  0,  rect.size.height / 2 };
    NSPoint endPoint   = { rect.size.width, rect.size.height / 2 };
    
    [progressBackgroundPath  moveToPoint:startPoint];
    [progressBackgroundPath lineToPoint:endPoint];
    
    [self.indicatorBackgroundColor set];
    
    [progressBackgroundPath stroke];
}

- (void)drawProgressForegroundInRect:(NSRect)rect
{
    NSBezierPath *progressForegroundPath = [NSBezierPath bezierPath];
    [progressForegroundPath setLineWidth:MFSCustomProgressIndicatorHeight];
    
    NSPoint startPoint = {  0,  rect.size.height / 2 };
    NSPoint endPoint   = { self.indicatorProgress, rect.size.height / 2 };
    
    [progressForegroundPath  moveToPoint: startPoint];
    [progressForegroundPath lineToPoint:endPoint];
    
    [self.indicatorForegoundColor set];
    
    [progressForegroundPath stroke];
}


@end
