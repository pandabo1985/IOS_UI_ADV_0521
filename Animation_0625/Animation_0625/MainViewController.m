//
//  MainViewController.m
//  Animation_0625
//
//  Created by pan dabo on 14-6-25.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MainViewController.h"

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

- (void)dealloc {
    [_myView release];
    [_parentView release];
    [super dealloc];
}
- (IBAction)btnAnimation:(UIButton *)sender {
    
//    [UIView beginAnimations:@"btnAnimation" context:nil];
//    [UIView setAnimationDuration:05.];
//    
//    [UIView setAnimationDelegate:self];
//    
////    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
//    
//     CGRect frame = self.view.frame;
//    frame.origin.y = 400;
//    self.myView.frame = frame;
//    [UIView commitAnimations];
    
//    [UIView animateWithDuration:0.5 animations:^{
//        CGRect frame = self.myView.frame;
//        frame.origin.y = 400;
//        self.myView.frame = frame;
//    }];
    self.myView.alpha =1;
    self.myView.transform = CGAffineTransformScale(self.view.transform, 1, 1);
    
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationRepeatCount:10];
             CGRect frame = self.myView.frame;
            frame.origin.y = 400;
             self.myView.frame = frame;
             self.myView.alpha = 0;
              self.myView.transform = CGAffineTransformScale(self.view.transform, 0.01, 0.01);
        
    }completion:^(BOOL finished){
        if (finished) {
            [UIView animateWithDuration:2 animations:^{
                CGRect frame = self.myView.frame;
                frame.origin.y -=200;
                self.myView.frame = frame;
                 self.myView.alpha =1;
                self.myView.transform = CGAffineTransformIdentity;
            }];

        }
    }];
}

-(void)endAnimation
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGRect frame = self.myView.frame;
    frame.origin.y -=200;
    self.myView.frame = frame;
    [UIView commitAnimations];
}
- (IBAction)transAction:(UIButton *)sender {
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.parentView cache:YES];
//    [UIView commitAnimations];
//block 动画
    [UIView transitionWithView:self.parentView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    }completion:NULL];
    
//    [self.parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:YES];
//    [UIView commitAnimations];
//    
//    UIViewController *uiviewCtrl = [[UIViewController alloc] init];
//    [self.navigationController pushViewController:uiviewCtrl animated:YES];
    

}
@end
