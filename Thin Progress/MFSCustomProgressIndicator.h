//
//  MFSCustomProgressIndicator.h
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

#import <Foundation/Foundation.h>

@interface MFSCustomProgressIndicator : NSView

// Defaults to Black if not set.
@property (nonatomic, strong) NSColor *indicatorBackgroundColor;
// Defaults to Gray if not set.
@property (nonatomic, strong) NSColor *indicatorForegoundColor;

@property (nonatomic, strong) NSColor *progressColor;
@property (nonatomic, strong) NSColor *tickMarkColor;
@property (nonatomic, assign) BOOL showsTickMark;

// Progress is a float from 0 to 1 any value outside of that range will be ignored.
@property (nonatomic, assign) CGFloat progress;


@end
