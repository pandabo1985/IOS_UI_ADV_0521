//
//  AppDelegate.m
//  iPad_0624
//
//  Created by pan dabo on 14-6-24.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "AppDelegate.h"
#import "MastViewController.h"
#import "DetailViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    MastViewController *mastCtrl = [[MastViewController alloc] init];
    DetailViewController *detailCtrl = [[DetailViewController alloc] init];
    
    UINavigationController *navMastCtrl = [[UINavigationController alloc] initWithRootViewController:mastCtrl];
    UINavigationController *navDetailCtrl = [[UINavigationController alloc] initWithRootViewController:detailCtrl];
    
    UISplitViewController *splitCtrl = [[UISplitViewController alloc]init];
    splitCtrl.viewControllers = @[navMastCtrl ,navDetailCtrl];
    splitCtrl.presentsWithGesture = YES;
    splitCtrl.delegate = self;
    self.window.rootViewController = splitCtrl;
    [splitCtrl release];
    [mastCtrl release];
    [detailCtrl release];
    return YES;
}




#pragma mark UISplitViewControllerDelegate
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
    NSLog(@"隐藏");
}


- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
     NSLog(@"显示");
}


- (void)splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController{
    NSLog(@"浮动显示");
}

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation NS_AVAILABLE_IOS(5_0){
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

@end
