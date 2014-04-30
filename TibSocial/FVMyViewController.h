//
//  FVMyViewController.h
//  TibSocial
//
//  Created by joe90 on 30/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "FVPlayerCoreDetails.h"

@interface FVMyViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *stepcountLabel;
@property (strong, nonatomic) IBOutlet UILabel *avgtimeLabel;

@end
