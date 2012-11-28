//
//  RegisterViewController.h
//  NetmeraPushTest
//
//  Created by Serhat SARI on 10/24/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "ViewController.h"

@interface RegisterViewController : ViewController

@property (retain, nonatomic) IBOutlet UIButton *registerButton;
@property (retain, nonatomic) IBOutlet UIButton *unregisterButton;
@property BOOL isRegister;
@property (retain, nonatomic) IBOutlet UITextField *groupsField;
- (IBAction)submit:(id)sender;
- (IBAction)unregister:(id)sender;

- (IBAction)close:(id)sender;
@end
