//
//  MainViewController.m
//  AVAudioPlayer_Demo_0629
//
//  Created by pan dabo on 14-6-29.
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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"第一夫人" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
     audioPlayer.delegate = self;
    [audioPlayer prepareToPlay];
   
//    if ([audioPlayer play]) {
//        NSLog(@"开始播放音乐!");
//    }
    _volumeSlider.minimumValue = 0;
    _volumeSlider.maximumValue = 1;
    
    _currentSider.minimumValue = 0;
    _currentSider.maximumValue = audioPlayer.duration;
    _time.text = [NSString stringWithFormat:@"%f",audioPlayer.duration];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    
}

-(void)timeAction:(NSTimer *)timer{
    NSString *currentTime = [NSString stringWithFormat:@"%.0f:%.0d",audioPlayer.currentTime/60,((int)audioPlayer.currentTime % 60)];
    _time.text =currentTime;
    _currentSider.value = audioPlayer.currentTime;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_volumeSlider release];
    [_currentSider release];
    [_time release];
    
    [_myBtn release];
    [super dealloc];
}
- (IBAction)volumeSliderChanged:(UISlider *)sender {
    audioPlayer.volume = sender.value;
}

- (IBAction)currentSliderChanged:(UISlider *)sender {
    audioPlayer.currentTime = sender.value;
}

- (IBAction)playPause:(UIButton *)sender {
    BOOL playing = audioPlayer.playing;
    if (playing) {
        [_myBtn setTitle:@"播放" forState:UIControlStateNormal];
        [audioPlayer pause];
        
    }else{
        [audioPlayer play];
        [_myBtn setTitle:@"暂停" forState:UIControlStateNormal];
    }
}

#pragma mark AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
  
    [_myBtn setTitle:@"播放" forState:UIControlStateNormal];
  
    NSLog(@"播放结束");
}
@end
