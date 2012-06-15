//
//  WalkieTalkieSettingsClass.m
//  SampleAudioRecorder
//
//  Created by Padmanabhan Srinivasan on 05/06/12.
//  Copyright (c) 2012 sp@easydesignsystems.com. All rights reserved.
//



#import "WalkieTalkieSettingsClass.h"

@interface WalkieTalkieSettingsClass ()

@end

@implementation WalkieTalkieSettingsClass

@synthesize pickerView;
@synthesize SoundSettingsArray;
@synthesize currentpath;
@synthesize FilteredFiles;
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    @try 
    {
        SoundSettingsArray = [[NSMutableArray alloc] init];
   
        /*
        NSString *soundFilePath  = [[NSBundle mainBundle]  pathForResource:@"my-sound" ofType:@"wav"];
        CFURLRef SoundURL = (__bridge CFURLRef ) [NSURL fileURLWithPath:soundFilePath];
        AudioServicesCreateSystemSoundID(SoundURL, &Sounds[0]);
         */
                
        NSString *BundleRoot = [[NSBundle mainBundle] bundlePath];
        NSFileManager *FileMgr =[NSFileManager defaultManager];
        
        
       
        currentpath = [FileMgr currentDirectoryPath];
        
        NSLog (@"Current directory is %@", currentpath);
        
        if ([FileMgr changeCurrentDirectoryPath: @"/Users/Padmanabhansrinivasan/Downloads"] == NO)
            NSLog (@"Cannot change directory.");
        
        currentpath = [FileMgr currentDirectoryPath];
            
        NSArray *FileList =[FileMgr contentsOfDirectoryAtPath:currentpath error:nil];
        
        NSPredicate *Fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.caf'"];
        FilteredFiles=[FileList filteredArrayUsingPredicate:Fltr];
        
        int count;
        int i;
        count = [FilteredFiles count];
        
        for (i = 0; i < count-1; i++)
            [SoundSettingsArray addObject:[FilteredFiles objectAtIndex: i]];
      
        /*
        NSSound *systemSound = [[NSSound alloc] initWithContentsOfFile:@"/System/Library/Components/CoreAudio.component/Contents/Resources/SystemSounds/finder/move\ to\ trash.aif" byReference:YES];
        if (systemSound) {
            [systemSound play];
        }  
        
        /System/Library/Components/CoreAudio.component/Contents/Resources/CoreAudioAUUI.bundle/Contents/Resources
        */
        
        [pickerView selectRow:1 inComponent:0 animated:NO];
        
        
    }
    
    @catch (NSException *exception) 
    {
        NSLog (@"%@", exception);

    }
}

- (void)viewDidUnload {
    [self setPickerView:nil];
    [super viewDidUnload];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

{
    return 1;    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    // mlabel.text= [SoundSettingsArray objectAtIndex:row];
    
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

{
    @try 
    {
        return [SoundSettingsArray count];
    }
    @catch (NSException *exception) 
    {
       // [MasterObject MsgBox:exception];
    }
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

{
    @try 
    {
        return [SoundSettingsArray objectAtIndex:row];
    }
    @catch (NSException *exception) 
    {
       // [MasterObject MsgBox:exception];   
    }
} 

- (IBAction)PlayButtonClick:(UIButton *)sender forEvent:(UIEvent *)event 
{
    
    //[pickerView selectedRowInComponent:1];
    
    @try {
    
    //NSString *filepath = [currentpath stringByAppendingPathComponent:[FilteredFiles objectAtIndex:0]];
    NSString *filepath = [currentpath stringByAppendingPathComponent:[SoundSettingsArray objectAtIndex:[pickerView selectedRowInComponent:0]]];
    NSURL *fileurl =[NSURL fileURLWithPath:filepath];
    
    AVAudioPlayer *AudioPlayer;
    
    NSError *error;
    AudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileurl error:&error];
    
    if(error)
        NSLog(@"error:%@", error);
    else 
        {
           [AudioPlayer prepareToPlay];
           [AudioPlayer play];
          }
    }
    
    @catch (NSException *exception) {
        NSLog (@"%@", exception);
    }
    

}
@end
