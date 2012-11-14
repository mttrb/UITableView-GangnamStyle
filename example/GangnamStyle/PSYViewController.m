//
//  PSYViewController.m
//  GangnamStyle
//
//  Created by Matthew Robinson on 14/11/12.
//  Copyright (c) 2012 Matthew Robinson. All rights reserved.
//

#import "PSYViewController.h"

#import "UITableView+GangnamStyle.h"

@implementation PSYViewController

- (void)loadView {
    [self setTableView:[[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]
                                                    style:UITableViewStyleGangnam]];
}

@end
