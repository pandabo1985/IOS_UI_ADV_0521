//
//  AppDelegate.h
//  BackGround_Task_0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSInteger num;
    UIBackgroundTaskIdentifier taskId;
}

@property (strong, nonatomic) UIWindow *window;

@end
