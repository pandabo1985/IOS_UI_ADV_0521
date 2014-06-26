//
//  MainViewController.h
//  Animation_0625
//
//  Created by pan dabo on 14-6-25.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *myView;
- (IBAction)btnAnimation:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UIView *parentView;
- (IBAction)transAction:(UIButton *)sender;

@end
