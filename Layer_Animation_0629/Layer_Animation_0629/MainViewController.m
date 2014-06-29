
//
//  MainViewController.m
//  Layer_Animation_0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)transtionAction:(id)sender {
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.6;
////    animation.delegate = self;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
//    animation.type = kCATransitionPush;
//    
////    CA_EXTERN NSString * const kCATransitionFade
////    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
////    CA_EXTERN NSString * const kCATransitionMoveIn
////    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
////    CA_EXTERN NSString * const kCATransitionPush
////    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
////    CA_EXTERN NSString * const kCATransitionReveal
////    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
//    
//    [self.myView.layer addAnimation:animation forKey:@"animationkey"];
//    
//    [self.myView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
  
    
    CATransition *animation = [CATransition animation];
    animation.duration = 1;
    //    animation.delegate = self;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.type = kCATransitionPush;
    [self.navigationController.view.layer addAnimation:animation forKey:@"key"];
    
    UIViewController *viewCtrl = [[UIViewController alloc] init];
    
    [self.navigationController pushViewController:viewCtrl animated:YES];
    
}
- (void)dealloc {
    [_myView release];
    [super dealloc];
}
@end
