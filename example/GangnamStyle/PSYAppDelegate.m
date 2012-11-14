//
//  PSYAppDelegate.m
//  GangnamStyle
//
//  Created by Matthew Robinson on 14/11/12.
//  Copyright (c) 2012 Matthew Robinson. All rights reserved.
//

#import "PSYAppDelegate.h"

#import "PSYViewController.h"

@implementation PSYAppDelegate

- (void)dealloc {
    [_window release];
    [_viewController release];
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setWindow:[[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]];

    [self setViewController:[[[PSYViewController alloc] init] autorelease]];
    [[self window] setRootViewController:[self viewController]];
    [[self window] makeKeyAndVisible];

    return YES;
}

@end
