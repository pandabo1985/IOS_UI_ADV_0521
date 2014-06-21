//
//  DetailViewController.m
//  Block_Demo_0619
//
//  Created by pan dabo on 14-6-21.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "DetailViewController.h"
#import "BlockBtn.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    self.view.backgroundColor = [UIColor grayColor];
    
    __block UIViewController *ctrl = self;//解决循环引用
    BlockBtn *detail = [[BlockBtn alloc] initWithFrame:CGRectMake(320/2-100/2, 100, 100, 100)];
    [detail setBackgroundColor:[UIColor blueColor]];
    [detail setTitle:@"back" forState:UIControlStateNormal];
    [detail setBlock:^(BlockBtn *btn){
        [ctrl dismissModalViewControllerAnimated:YES];
    }];
    [self.view addSubview:detail];
    [detail release];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(320/2, 50, 50, 50)];
    backBtn.backgroundColor = [UIColor greenColor];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(dissDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    [backBtn release];
}

-(void)dissDetail{
    NSLog(@"====dissDetail======");
    [self dismissModalViewControllerAnimated:YES];
     NSLog(@"detailCtrl = %d",[self retainCount]);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [super dealloc];
    NSLog(@"dealloc == detail");
}

@end
