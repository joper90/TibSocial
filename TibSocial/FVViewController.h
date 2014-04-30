//
//  FVViewController.h
//  TibSocial
//
//  Created by joe90 on 24/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FVViewController : UIViewController

- (IBAction)loginPushed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;

@end
