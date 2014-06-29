//
//  UIMainViewController.h
//  HMGL_Animation0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *myView;
- (IBAction)transAnimationAction:(UIButton *)sender;
- (IBAction)modelAction:(UIButton *)sender;

@end
