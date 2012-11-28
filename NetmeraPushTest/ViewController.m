//
//  ViewController.m
//  NetmeraPushTest
//
//  Created by Serhat SARI on 9/11/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "DevicegroupsViewController.h"
#import "PushdetailViewController.h"
#import "SendpushViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

- (IBAction)register:(id)sender {
    RegisterViewController *createView = [[RegisterViewController alloc] init];
    createView.isRegister = YES;
    [self presentModalViewController:createView animated:YES];
    [createView release];
}
- (IBAction)unregister:(id)sender {
    RegisterViewController *createView = [[RegisterViewController alloc] init];
    createView.isRegister = NO;
    [self presentModalViewController:createView animated:YES];
    [createView release];
}

- (IBAction)deviceGroups:(id)sender {
    DevicegroupsViewController *createView = [[DevicegroupsViewController alloc] init];
    [self presentModalViewController:createView animated:YES];
    [createView release];
}

- (IBAction)pushdetails:(id)sender {
    PushdetailViewController *createView = [[PushdetailViewController alloc] init];
    [self presentModalViewController:createView animated:YES];
    [createView release];
}

- (IBAction)sendPush:(id)sender {
    SendpushViewController *createView = [[SendpushViewController alloc] init];
    [self presentModalViewController:createView animated:YES];
    [createView release];
}
@end
