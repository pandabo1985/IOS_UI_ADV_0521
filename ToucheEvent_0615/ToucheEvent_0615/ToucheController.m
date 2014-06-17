//
//  ToucheController.m
//  ToucheEvent_0615
//
//  Created by pan dabo on 14-6-15.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "ToucheController.h"
#import "ToucheView.h"

@interface ToucheController ()

@end

@implementation ToucheController

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
    ToucheView *toucheView = [[ToucheView alloc] init];
     toucheView.frame = CGRectMake(80, 0, 160, 160);
    toucheView.backgroundColor =[UIColor grayColor];
    [self.view addSubview:toucheView];
   
    
    [toucheView release];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    
    [self.view addGestureRecognizer:swipGesture];
}
-(void)singleTap:(UITapGestureRecognizer *)tapGesture{
    NSLog(@"*********单击!**********");
}

-(void)doubleTap:(UITapGestureRecognizer *)doubleTap{
    NSLog(@"********双击!**********");
}

-(void)swipAction:(UISwipeGestureRecognizer *)swip{
    NSLog(@"*******清扫******");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"==touchesBegan===ToucheController====");
        [self.nextResponder touchesBegan:touches withEvent:event];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
