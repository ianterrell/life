//
//  LifeAppDelegate.m
//  Life
//
//  Created by Ian Terrell on 12/2/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import "LifeAppDelegate.h"
#import "OpenGLView.h"
#import "Grid.h"

@implementation LifeAppDelegate

@synthesize window;
@synthesize glView;

-(void)play {
//  Grid *grid = [[Grid alloc] initWithRows:5 andColumns:12];
//  [grid animateCellAtRow:2 andColumn:1];
//  [grid animateCellAtRow:2 andColumn:2];
//  [grid animateCellAtRow:2 andColumn:3];
//  [grid animateCellAtRow:2 andColumn:4];
//  [grid animateCellAtRow:2 andColumn:5];
//  [grid animateCellAtRow:2 andColumn:6];
//  [grid animateCellAtRow:2 andColumn:7];
//  [grid animateCellAtRow:2 andColumn:8];
//  [grid animateCellAtRow:2 andColumn:9];
//  [grid animateCellAtRow:2 andColumn:10];
  
//  Grid *grid = [[Grid alloc] initWithRows:3 andColumns:3];
//  [grid animateCellAtRow:2 andColumn:1];
//  [grid animateCellAtRow:2 andColumn:2];
  
//  for (NSInteger i = 0; i < 10; i++) {
//    [grid log];
//    [grid evolve];
//  }
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions   
{
    [glView startAnimation];
    [self play];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [glView stopAnimation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [glView startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [glView stopAnimation];
}

- (void)dealloc
{
    [window release];
    [glView release];

    [super dealloc];
}

@end
