//
//  SampleAudioRecorderViewController.m
//  SampleAudioRecorder
//
//  Created by Padmanabhan Srinivasan on 23/05/12.
//  Copyright (c) 2012 sp@easydesignsystems.com. All rights reserved.
//

#import "SampleAudioRecorderViewController.h"


@interface SampleAudioRecorderViewController ()

@end

@implementation SampleAudioRecorderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,  YES);
    NSString *documentDirectorypath = [paths objectAtIndex:0];
    NSString *filepath = [documentDirectorypath stringByAppendingPathComponent:@"Myrecording.caf"];
    NSURL *fileurl =[NSURL fileURLWithPath:filepath];
    
    NSError *error =nil;
    AudioRecorder = [[AVAudioRecorder alloc] initWithURL:fileurl settings:nil error:&error];
    
    if (error)
        NSLog(@"error:%@", error);
    else {
        [AudioRecorder  prepareToRecord];
        
    }
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)RecordButton:(id)sender forEvent:(UIEvent *)event {
    
    [AudioRecorder record];
    
}

- (IBAction)StopButton:(id)sender forEvent:(UIEvent *)event {
    [AudioRecorder stop];
}

- (IBAction)PlayButton:(id)sender forEvent:(UIEvent *)event {
    NSError *error;
    AudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:AudioRecorder.url error:&error];
    
    if(error)
        NSLog(@"error:%@", error);
    else 
    {
        [AudioPlayer prepareToPlay];
        [AudioPlayer play];
    }
    
}

- (IBAction)SendButtonClick:(UIButton *)sender forEvent:(UIEvent *)event 
{
    
}





@end
