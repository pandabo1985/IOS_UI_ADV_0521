//
//  UIMainViewController.m
//  HMGL_Animation0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MainViewController.h"
#import "Switch3DTransition.h"
#import "HMGLTransitionManager.h"
#import "DoorsTransition.h"
#import "RotateTransition.h"
#import "BackController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"UIMainViewController" bundle:nibBundleOrNil];
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

- (void)dealloc {
    [_myView release];
    [super dealloc];
}
- (IBAction)transAnimationAction:(UIButton *)sender {
//    Switch3DTransition *switchTr = [[Switch3DTransition alloc] init];
    
   RotateTransition *switchTr = [[RotateTransition alloc] init];

    
    [[HMGLTransitionManager sharedTransitionManager] setTransition:switchTr];
    [[HMGLTransitionManager sharedTransitionManager] beginTransition:self.myView];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [[HMGLTransitionManager sharedTransitionManager] commitTransition];
}

- (IBAction)modelAction:(UIButton *)sender {
    DoorsTransition *doorTransition = [[DoorsTransition alloc] init];
    [[HMGLTransitionManager sharedTransitionManager] setTransition:doorTransition];
    
    BackController *viewCtrl = [[BackController alloc] init];
    
    
    [[HMGLTransitionManager sharedTransitionManager]presentModalViewController:viewCtrl onViewController:self ];
}
@end
