//
//  MainViewController.h
//  AVAudioPlayer_Demo_0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface MainViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;
}
@property (retain, nonatomic) IBOutlet UISlider *volumeSlider;
@property (retain, nonatomic) IBOutlet UISlider *currentSider;
@property (retain, nonatomic) IBOutlet UILabel *time;

- (IBAction)volumeSliderChanged:(UISlider *)sender;

- (IBAction)currentSliderChanged:(UISlider *)sender;
- (IBAction)playPause:(UIButton *)sender;

@property (retain, nonatomic) IBOutlet UIButton *myBtn;

@end
