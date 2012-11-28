//
//  RegisterViewController.m
//  NetmeraPushTest
//
//  Created by Serhat SARI on 10/24/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "RegisterViewController.h"
#import "Netmera/Netmera.h"
#import "DataManager.h"
#import "Netmera/NetmeraDeviceDetail.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize isRegister;

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
    if (isRegister) {
        _unregisterButton.hidden = YES;
    }else{
        _registerButton.hidden = YES;
    }
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    
    NSString *fieldText = _groupsField.text;
    NSArray *groups = nil;
    if ([fieldText isEqualToString:@""] == NO) {
        groups = [fieldText componentsSeparatedByString:@","];
    }
    
    NSMutableArray *mgroups = [[NSMutableArray alloc] init];
    for (id group in groups) {
        [mgroups addObject:group];
    }
    
    DataManager *dataManager = [DataManager getInstance];
    NetmeraDeviceDetail *detail = [[NetmeraDeviceDetail alloc] init];
    if ([mgroups count] > 0) {
        [detail setDeviceGroupList:mgroups];
    }

    [detail setToken:dataManager.devicetoken];
    [NetmeraPushService registerWithNetmeraDeviceDetail:detail];
    
}

- (IBAction)unregister:(id)sender {
    NSString *fieldText = _groupsField.text;
    NSArray *groups = nil;
    if ([fieldText isEqualToString:@""] == NO) {
        groups = [fieldText componentsSeparatedByString:@","];
    }
    
    NSMutableArray *mgroups = [[NSMutableArray alloc] init];
    for (id group in groups) {
        [mgroups addObject:group];
    }
    
    DataManager *dataManager = [DataManager getInstance];
    NetmeraDeviceDetail *detail = [[NetmeraDeviceDetail alloc] init];
    if ([mgroups count] > 0) {
        [detail setDeviceGroupList:mgroups];
    }
    
    [detail setToken:dataManager.devicetoken];
    [NetmeraPushService unRegisterWithNetmeraDeviceDetail:detail];
}

- (IBAction)close:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)dealloc {
    [_groupsField release];
    [_registerButton release];
    [_unregisterButton release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setGroupsField:nil];
    [self setRegisterButton:nil];
    [self setUnregisterButton:nil];
    [super viewDidUnload];
}
@end
