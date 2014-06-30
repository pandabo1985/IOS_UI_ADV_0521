//
//  AppDelegate.m
//  ThreadDemo_0630
//
//  Created by pan dabo on 14-6-30.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //first
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(theadAction:) object:@"first"];
    [thread start];
    for (int j = 0; j<20; j++) {
        NSLog(@"主thread = %d",j);
    }
    
    //second
    [NSThread detachNewThreadSelector:@selector(theadAction:) toTarget:self withObject:@"second"];
    //third
    [self performSelector:@selector(theadAction:) withObject:@"third" ];
    
    //four
    NSOperationQueue *operaQueue = [[NSOperationQueue alloc] init];
    [operaQueue addOperationWithBlock:^{
        for (int k = 0; k < 10; k++) {
            NSLog(@"k = %d ,four",k);
        }
    }];
    
    //five
    NSOperationQueue *opsQueue = [[NSOperationQueue alloc] init];
    opsQueue.maxConcurrentOperationCount = 1;
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(theadAction:) object:@"five"];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(theadAction:) object:@"six"];
    op2.queuePriority = NSOperationQueuePriorityHigh;
    [opsQueue addOperation:op];
    [opsQueue addOperation:op2];
    
    //six gcd
    
    dispatch_queue_t queue = dispatch_queue_create("seven", NULL);
    dispatch_async(queue, ^{
        
        if ([NSThread isMultiThreaded]) {
            NSLog(@"is isMultiThreaded");
        }
        for (int l =0; l < 20; l++) {
            NSLog(@"l = %d === seven",l);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([NSThread isMainThread]) {
                NSLog(@"is main");
            }
        });
    });
    
    return YES;
}
-(void)theadAction:(NSString *)t
{
    for (int i =0; i< 20; i++) {
         NSLog(@"分%d===%@",i,t);
    }
    [self performSelectorOnMainThread:@selector(mainThread) withObject:self waitUntilDone:YES];//调回到主线程
}
-(void)mainThread{
    BOOL isMain = [NSThread isMainThread];
    if (isMain) {
        NSLog(@"is main");
    }else {
        NSLog(@"is not main");
    }
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
