//
//  PushdetailViewController.m
//  NetmeraPushTest
//
//  Created by Serhat SARI on 10/24/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "PushdetailViewController.h"
#import "Netmera/Netmera.h"
#import "DataManager.h"

@interface PushdetailViewController ()

@end

@implementation PushdetailViewController
@synthesize result;

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
    DataManager *dataManager = [DataManager getInstance];
    [self setDetailWithToken:dataManager.devicetoken];
}

-(void)setDetailWithToken:(NSString *)token{
    NetmeraDeviceDetail *detail = [NetmeraDeviceDetail getDeviceDetailWithToken:token withError:nil];
    
    if (result != nil && [result count] > 0) {
        [result removeAllObjects];
    }
    result = detail.deviceGroupList;

    _tokenLabel.text = [NSString stringWithFormat:@"Token: %@", detail.token];
    _channelLabel.text = [NSString stringWithFormat:@"Channel: %@", detail.channel];
    _registerDate.text = [NSString stringWithFormat:@"Register Date: %@", detail.registerDate];
    [_groupTable reloadData];
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
    [_tokenLabel release];
    [_channelLabel release];
    [_registerDate release];
    [_groupTable release];
    [_devicetokenField release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTokenLabel:nil];
    [self setChannelLabel:nil];
    [self setRegisterDate:nil];
    [self setGroupTable:nil];
    [self setDevicetokenField:nil];
    [super viewDidUnload];
}
- (IBAction)findNewToken:(id)sender {
    [self setDetailWithToken:_devicetokenField.text];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier=@"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [result objectAtIndex:indexPath.row];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [result count];
}
@end
