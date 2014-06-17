//
//  RootViewController.m
//  ScrollViewPropertyDemo_0617
//
//  Created by pan dabo on 14-6-17.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
   scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.contentSize = CGSizeMake(320, 460);
//    scrollView.bounces = NO;
//    scrollView.pagingEnabled = YES;
//    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//    [scrollView flashScrollIndicators];
//    scrollView.contentInset = UIEdgeInsetsMake(0, 50, 0, 0);
    scrollView.minimumZoomScale = 0.5;
//    scrollView.bouncesZoom =NO;
    scrollView.maximumZoomScale = 2;
    [self.view addSubview:scrollView];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    imageView.image = [UIImage imageNamed:@"1.JPG"];
    [scrollView addSubview:imageView];
    
   
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(320, 200, 320, 40)];
//    label.backgroundColor = [UIColor yellowColor];
//    label.text = @"学习scrollview";
//    [scrollView addSubview:label];
//    [label release];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setFrame:CGRectMake(320/2-140/2, 350, 140, 40)];
//    button.backgroundColor = [UIColor grayColor];
//    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
}
-(void)test{
    [scrollView setContentOffset:CGPointMake(320, 0) animated:YES];
}


#pragma mark -scrollView Delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"scrollViewWillBeginZooming");
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"scrollViewDidEndZooming");
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidZoom");
}
-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
    
}
-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScrollToTop");
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

-(void)dealloc{
    [super dealloc];
    [scrollView release];
    [imageView release];
}
@end
