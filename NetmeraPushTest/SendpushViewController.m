//
//  SendpushViewController.m
//  NetmeraPushTest
//
//  Created by Serhat SARI on 10/24/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "SendpushViewController.h"
#import "Netmera/Netmera.h"
#import "Netmera/NetmeraPush.h"
#import "Netmera/NetmeraPushInfo.h"

@interface SendpushViewController ()

@end

@implementation SendpushViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)dealloc {
    [_messageField release];
    [_groupField release];
    [_channelField release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setMessageField:nil];
    [self setGroupField:nil];
    [self setChannelField:nil];
    [super viewDidUnload];
}
- (IBAction)send:(id)sender {
    
    NSString *fieldText = _groupField.text;
    NSArray *groups = nil;
    if ([fieldText isEqualToString:@""] == NO) {
        groups = [fieldText componentsSeparatedByString:@","];
    }
    
    NSString *msg = _messageField.text;
    
    NSString *channelText = _channelField.text;
    NSArray *channels = nil;
    
    BOOL isIOS = NO;
    BOOL isandroid = NO;
    
    if ([channelText isEqualToString:@""] == NO) {
        channels = [channelText componentsSeparatedByString:@","];
        for (id channel in channels) {
            if ([channel isEqualToString:@"ios"]) {
                isIOS = YES;
            }
            if ([channel isEqualToString:@"android"]) {
                isandroid = YES;
            }
        }
    }
    
    
    NetmeraPush *push = [[NetmeraPush alloc] initWithMessage:msg withDeviceGroups:groups isSendToIOS:isIOS isSendToAndroid:isandroid];
    //[iosPush sendNotificationInBackground];
    [push sendNotificationInBackgroundWithBlock:^(NSError *error, NSMutableDictionary *pushInfoDict) {
        //
        NSLog(@"pushInfoList; %@", pushInfoDict);
    }];
     
}
@end
