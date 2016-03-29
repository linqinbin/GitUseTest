//
//  AppDelegate.m
//  TestProject
//
//  Created by linqb on 16/3/1.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor whiteColor];

    [self.window makeKeyAndVisible];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    self.window.rootViewController = nav;
    return YES;

    /*
     监测网络状态
     AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
     [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
     // 使用MBProgressHUD三方库创建弹框，给出相应的提示
     MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
     hud.mode = MBProgressHUDModeText;
     switch (status) {
     case AFNetworkReachabilityStatusNotReachable:
     // 弹框提示的内容
     hud.labelText = @"世界上最遥远的距离就是没网";
     break;
     case AFNetworkReachabilityStatusReachableViaWWAN:
     hud.labelText = @"2G/3G/4G";
     break;
     case AFNetworkReachabilityStatusReachableViaWiFi:
     hud.labelText = @"WiFi在线";
     default:
     break;
     }
     dispatch_async(dispatch_get_global_queue(0, 0), ^{
     // 显示时间2s
     sleep(2);
     dispatch_async(dispatch_get_main_queue(), ^{
     // 让弹框消失
     [MBProgressHUD hideHUDForView:window animated:YES];
     });
     });
     }];
     [manager startMonitoring];
     */
}

- (void)applicationWillResignActive:(UIApplication*)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
