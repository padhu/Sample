//
//  WSClass.m
//  SampleAudioRecorder
//
//  Created by Padmanabhan Srinivasan on 15/06/12.
//  Copyright (c) 2012 sp@easydesignsystems.com. All rights reserved.
//

#import "WSClass.h"

@implementation WSClass

-(void) viewDidLoad
{
    [super viewDidLoad];
    NSString *urlString=[NSString stringWithFormat:@"http://ielmo.xtreemhost.com/array.php"];
    NSURL *url=[NSURL URLWithString:urlString];
    
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error;
    NSMutableArray *json=(NSMutableArray *) [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error ];
    NSLog(@"%@:", [json  objectAtIndex:0]);
    
    NSString *imageString =[NSString stringWithFormat:@"%@", [json objectAtIndex:0]];
    NSURL *urlOne=[NSURL URLWithString:imageString];
    NSData *newData = [NSData dataWithContentsOfURL:urlOne];
    UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,300, 400)];
    [imageview setImage:[UIImage imageWithData:newData]];
    [self.view addSubview:imageview];
    
}


@end
