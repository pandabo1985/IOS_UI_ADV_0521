//
//  MainViewController.m
//  MPMoviePlayerDemo_0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MainViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(play:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   NSString *urlStr = @"";
    NSURL *url = [NSURL URLWithString:urlStr];
    MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    moviePlayer.view.frame = CGRectMake(0, 0, 320, 200);
    moviePlayer.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:moviePlayer.view];
    [moviePlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
