//
//  DevicegroupsViewController.h
//  NetmeraPushTest
//
//  Created by Serhat SARI on 10/24/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "ViewController.h"

@interface DevicegroupsViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) NSArray * result;
- (IBAction)close:(id)sender;
@end
