//
//  MainViewController.m
//  AVPlayer_Demo_0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>

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
//    NSString *mp3Url = @"http://play.baidu.com/?__m=mboxCtrl.playSong&__a=23473715&__o=/song/23473715||playBtn&fr=altg3||www.baidu.com#loaded";
//    NSURL *url = [NSURL fileURLWithPath:mp3Url];
//    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
//    [player play];
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"第一夫人" ofType:@"mp3"];
//    NSURL *url = [NSURL fileURLWithPath:filePath];
//    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
//    [player play];
    
    

    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playBtn:(UIButton *)sender {

//    NSString *path = [[NSBundle mainBundle] pathForResource:@"44th Street Medium" ofType:@"caf"];
    
  NSString *path = [[NSBundle mainBundle] pathForResource:@"44th Street Medium" ofType:@"caf"];
//    NSLog(@"path = %@",path);
    NSURL *url = [NSURL fileURLWithPath:path];
    
//    SystemSoundID soudID;
    
    unsigned long soudID;
    AudioServicesCreateSystemSoundID((CFURLRef)url, &soudID);
    AudioServicesPlaySystemSound(soudID);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
@end
