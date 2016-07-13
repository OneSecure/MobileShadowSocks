//
//  AppDelegate.m
//  MobileShadowSocks
//
//  Created by Linus Yang on 13-1-31.
//  Copyright (c) 2013 Linus Yang. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    SettingTableViewController *_tabViewController;
}

@synthesize window = _window;

- (void)dealloc
{
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _tabViewController = [[SettingTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *navController =
    [[UINavigationController alloc] initWithRootViewController:_tabViewController];
    [self.window setRootViewController:navController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [_tabViewController scannerDidGetResult:[url absoluteString] willDismiss:NO];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [_tabViewController fixProxy];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [_tabViewController updateProxy];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
