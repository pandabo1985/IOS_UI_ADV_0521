//
//  AppDelegate.m
//  ASIDownloadFile_Demo_0713
//
//  Created by pan dabo on 14-7-13.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "AppDelegate.h"
#import "ASIHTTPRequest.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    UIButton *downloadBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [downloadBtn addTarget:self action:@selector(downloadFile)forControlEvents:UIControlEventTouchUpInside];
    downloadBtn.frame = CGRectMake(150, 30, 80, 80);
    [downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
    [self.window addSubview:downloadBtn];
 
                                                 

    
    return YES;
}
-(void)downloadFile{
    
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:(UIProgressViewStyleBar)];
    progressView.frame = CGRectMake(50, 100, 200, 200);
    [self.window addSubview:progressView];
    [progressView addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    
    NSString *urlString = @"http://cdn.baidupcs.com/file/2e64b03e17d92eba1b8396a67325f8d4?xcode=555abc37011233605e9acbca5b37bbab6bcccaf90e8058ad&fid=2600775877-250528-858979596761399&time=1405210118&sign=FDTAXER-DCb740ccc5511e5e8fedcff06b081203-MNVUlHH7PlUns9unX7GnYo1iaOs%3D&to=cb&fm=N,B,U,nc&sta_dx=11&sta_cs=31&sta_ft=dmg&sta_ct=5&newver=1&expires=1405210718&rt=sh&r=427343751&logid=1968182007&sh=1&vuk=2536758490&fn=thunder_dl2.4.0.1356_Beta.dmg";
    NSString *document = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName = [urlString lastPathComponent];
    NSString *path = [document stringByAppendingPathComponent:fileName];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setHeadersReceivedBlock:^(NSDictionary *requestHeard){
        NSLog(@"requestHeard== %@",requestHeard);
    }];
    [request setDownloadDestinationPath:path];
    request.downloadProgressDelegate = progressView;
    [request startAsynchronous];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@",change);
    
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
