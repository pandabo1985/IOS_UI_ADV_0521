//
//  MainViewController.m
//  Block_Demo_0619
//
//  Created by pan dabo on 14-6-19.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MainViewController.h"

typedef int(^myBlockNew)(int);

@interface MainViewController ()

-(void)testBlock:(int(^)(int)) myBlock;
-(void)fuck:(int)a;

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
    
    int(^myBlock)(int);
    
    myBlock = ^(int a){
        NSLog(@"a=%d",a);
        return a+10;
    };
    
    myBlock(10);
    
    myBlockNew new = ^(int b){
        NSLog(@"b =%d",b);
        return b+10;
    };
    [self testBlockNew:new];
    
    //------------局部变量
    int number = 20;
    __block int number_block = 30;
    myBlockNew my = ^(int b){
        NSLog(@"number = %d",number);
        number_block = 40;
        NSLog(@"number_block = %d",number_block);
        //        number = 3;错误的
        
        return b+number;
    };
    number = 100;
    NSLog(@"number = %d",number);
    NSLog(@"number_block = %d",number_block);
    [self testBlockNew:my];
    NSLog(@"number_block = %d",number_block);
    
}

-(void)fuck:(int)a
{
    NSLog(@"fuck a = %d",a);
}

-(void)testBlockNew:(myBlockNew)new{
    NSLog(@"new");
    new(20 );
}
-(void)testBlock:(int(^)(int)) myBlock{
    NSLog(@"test");
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
