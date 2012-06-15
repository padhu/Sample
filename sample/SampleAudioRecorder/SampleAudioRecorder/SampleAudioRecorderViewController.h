//
//  SampleAudioRecorderViewController.h
//  SampleAudioRecorder
//
//  Created by Padmanabhan Srinivasan on 23/05/12.
//  Copyright (c) 2012 sp@easydesignsystems.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class AVAudioPlayer;
@class AVAudioRecorder;


@interface SampleAudioRecorderViewController : UIViewController

{
    AVAudioRecorder *AudioRecorder;
    AVAudioPlayer *AudioPlayer;
    
}

- (IBAction)RecordButton:(id)sender forEvent:(UIEvent *)event;
- (IBAction)StopButton:(id)sender forEvent:(UIEvent *)event;
- (IBAction)PlayButton:(id)sender forEvent:(UIEvent *)event;

- (IBAction)SendButtonClick:(UIButton *)sender forEvent:(UIEvent *)event;

@end

