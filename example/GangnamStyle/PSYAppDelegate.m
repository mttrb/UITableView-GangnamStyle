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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[PSYViewController alloc] init];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
