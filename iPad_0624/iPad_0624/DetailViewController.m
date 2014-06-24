//
//  DetailViewController.m
//  iPad_0624
//
//  Created by pan dabo on 14-6-24.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "DetailViewController.h"
#import "PopViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"详情窗口";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *leftBarItem =[[UIBarButtonItem alloc] initWithTitle:@"pop窗口" style:UIBarButtonItemStyleBordered target:self action:@selector(clickAction:)];
    self.navigationItem.leftBarButtonItem = [leftBarItem autorelease];
    
    PopViewController *popCtrl = [[PopViewController alloc] init];
    UINavigationController *navPopCtrl = [[UINavigationController alloc] initWithRootViewController:popCtrl];
    [popCtrl release];
    _popoverCtrl = [[UIPopoverController alloc] initWithContentViewController:navPopCtrl];
    _popoverCtrl.popoverContentSize = CGSizeMake(320, 600);
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"模态试图" style:UIBarButtonItemStyleBordered target:self  action:@selector(clickAction2:)];
    self.navigationItem.rightBarButtonItem = [rightBar autorelease];
    
   
    
}

-(void)clickAction2:(UIBarButtonItem *)btn{
    UIViewController *modelCtrl = [[UIViewController alloc] init];

    modelCtrl.title = @"模态窗口";
    UINavigationController *navModal = [[UINavigationController alloc] initWithRootViewController:modelCtrl];
    navModal.modalPresentationStyle = UIModalPresentationPageSheet;
    [modelCtrl release];
    [self presentViewController:navModal animated:YES completion:^{
        
    }];
    
}

-(void)clickAction:(UIBarButtonItem *)btn{
    if (self.popoverCtrl.popoverVisible) {
        [self.popoverCtrl dismissPopoverAnimated:YES];
    }else{
        [self.popoverCtrl presentPopoverFromBarButtonItem:btn permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
