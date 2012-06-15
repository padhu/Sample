//
//  WalkieTalkieSettingsClass.h
//  SampleAudioRecorder
//
//  Created by Padmanabhan Srinivasan on 05/06/12.
//  Copyright (c) 2012 sp@easydesignsystems.com. All rights reserved.
//



#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/audioservices.h>
#import <AVFoundation/AVFoundation.h>

@class AVAudioPlayer;
@class AVAudioRecorder;

@interface WalkieTalkieSettingsClass: UIViewController  
<UIPickerViewDelegate, UIPickerViewDataSource>
{
    SystemSoundID  Sounds[10];
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property NSMutableArray *SoundSettingsArray;
@property NSString  *currentpath;
@property NSArray *FilteredFiles;

- (IBAction)PlayButtonClick:(UIButton *)sender forEvent:(UIEvent *)event;


@end


