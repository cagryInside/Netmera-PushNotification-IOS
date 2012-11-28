//
//  AppDelegate.m
//  NetmeraPushTest
//
//  Created by Serhat SARI on 9/11/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "Netmera/Netmera.h"
#import "DataManager.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NetmeraClient initWithApiKey:@"WVhCd1ZYSnNQV2gwZEhBbE0wRWxNa1lsTWtZME5qYzRORE0xTkM1dVpYUnRaWEpoTG1OdmJTVXpRVGd3SlRKR2JXOWlhVzFsY21FbE1rWm5ZV1JuWlhRbE1rWm9iMjFsTG5odGJDWnViVk5wZEdWVmNtdzlhSFIwY0NVelFTVXlSaVV5UmpRMk56ZzBNelUwTG01bGRHMWxjbUV1WTI5dEpUTkJPREFtYlc5a2RXeGxTV1E5T0RNeE9DWmhjSEJKWkQwME5qYzRORE0xTkNadWJWUmxiWEJzWVhSbFBXMXZZbWwwWlcxd2JHRjBaU1p2ZDI1bGNrbGtQV05oWjNKcFkyVjBhVzQ0T1Naa2IyMWhhVzQ5Ym1WMGJXVnlZUzVqYjIwbWJtMVRhWFJsUFRRMk56ZzBNelUwSm05M2JtVnlVbTlzWlZSNWNHVTlNU1oyYVdWM1pYSlNiMnhsVkhsd1pUMHhKblpwWlhkbGNrbGtQV05oWjNKcFkyVjBhVzQ0T1NZ"];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes: UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    DataManager *dataManager = [DataManager getInstance];
    //dataManager.devicetoken = @"<02ebfd7a ac20641b f9cce758 e4438336 31e2a517 8a9655fc 1ab3815c fc19bb19>";//[deviceToken description];//
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *token = [NSString stringWithFormat:@"%@",deviceToken];
    NSLog(@"Device Token =  %@" ,token);
    //[NetmeraPushService registerInBackgroundWithToken:token];
    DataManager *dataManager = [DataManager getInstance];
    dataManager.devicetoken = [deviceToken description];//@"<02ebfd7a ac20641b f9cce758 e4438336 31e2a517 8a9655fc 1ab3815c fc19bb19>";//
    //[NetmeraPushService unRegisterInBackgroundWithToken:token];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        NSString *cancelTitle = @"Close";
        NSString *showTitle = @"Show";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Some title"
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:cancelTitle
                                                  otherButtonTitles:showTitle, nil];
        [alertView show];
        [alertView release];
    } else {
        //Do stuff that you would do if the application was not active
    }
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
    // Do something
    NSString *str = [NSString stringWithFormat: @"Error: %@", err];
    DataManager *dataManager = [DataManager getInstance];
    //dataManager.devicetoken = @"<02ebfd7a ac20641b f9cce758 e4438336 31e2a517 8a9655fc 1ab3815c fc19bb19>";//[deviceToken description];

    NSLog(@"%@" ,str);
    
}


@end
