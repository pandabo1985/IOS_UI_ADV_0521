//
//  AppDelegate.m
//  NSURLData_Demo_0708
//
//  Created by pan dabo on 14-7-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "AppDelegate.h"
#import "MyDataServer.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 50, 40, 20);
    [button setTitle:@"load" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(load) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    imageView.tag = 100;
    imageView.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:imageView];
    [imageView release];
    return YES;
}

-(void)load{
    NSDictionary *params = @{@"code": @"101010300"};
    [MyDataServer getWetheaData:params block:^(id result){
//        NSLog(@"result == %@",result);
        
        UIImageView *imageView = (UIImageView *)[self.window viewWithTag:100];
        UIImage *image =[UIImage imageWithData:result];
        imageView.image =image;
    }];
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
