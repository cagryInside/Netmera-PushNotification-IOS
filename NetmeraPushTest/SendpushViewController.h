//
//  SendpushViewController.h
//  NetmeraPushTest
//
//  Created by Serhat SARI on 10/24/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "ViewController.h"

@interface SendpushViewController : ViewController
- (IBAction)close:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *messageField;
@property (retain, nonatomic) IBOutlet UITextField *groupField;
@property (retain, nonatomic) IBOutlet UITextField *channelField;
- (IBAction)send:(id)sender;

@end
