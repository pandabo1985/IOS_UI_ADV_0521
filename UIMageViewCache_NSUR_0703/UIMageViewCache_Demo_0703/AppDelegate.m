//
//  AppDelegate.m
//  UIMageViewCache_Demo_0703
//
//  Created by pan dabo on 14-7-3.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "MyImageView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    [imageView setImageWithURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201302/23/20130223133315_XY5dC.thumb.600_0.jpeg"]];
    [self.window addSubview:imageView];
    [imageView release];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [moreBtn setTitle:@"more image" forState:UIControlStateNormal];
    moreBtn.frame = CGRectMake(10, 110, 100, 50);
    [moreBtn addTarget:self action:@selector(loadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:moreBtn];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(10, 160, 320, 480);
    scrollView.tag = 100;
    [self.window addSubview:scrollView];
    
    return YES;
}

-(void)loadImage{
    UIScrollView *scrollView =nil;
    for (int i =0; i < 10; i++) {
        MyImageView *imageView = [[MyImageView alloc] initWithFrame:CGRectMake(10, 160+100*i, 100, 100)];
        [imageView setMyImageWithURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201302/23/20130223133315_XY5dC.thumb.600_0.jpeg"]];
       scrollView =(UIScrollView *) [self.window viewWithTag:100];
        [scrollView addSubview:imageView];
//        scrollView.frame = CGRectMake(10, 160+100*10*num, 100, 100);
//        [self.window addSubview:imageView];
        [imageView release];

    }
    

    
    num +=1;
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
