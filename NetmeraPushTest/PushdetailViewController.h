//
//  PushdetailViewController.h
//  NetmeraPushTest
//
//  Created by Serhat SARI on 10/24/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "ViewController.h"

@interface PushdetailViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

- (IBAction)findNewToken:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *devicetokenField;
@property (retain, nonatomic) IBOutlet UILabel *tokenLabel;
@property (retain, nonatomic) NSMutableArray *result;
@property (retain, nonatomic) IBOutlet UILabel *channelLabel;
@property (retain, nonatomic) IBOutlet UILabel *registerDate;
@property (retain, nonatomic) IBOutlet UITableView *groupTable;
- (IBAction)close:(id)sender;
/*
 NSString *token;
 NSString *channel;
 NSDate *registerDate;
 NSMutableArray *deviceGroupList;
 */
@end
