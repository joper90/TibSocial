//
//  MSRangeGaugeViewController.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 6/20/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "MSRangeGauge.h"
#import "FVPlayerCoreDetails.h"

@interface MSRangeGaugeViewController : UIViewController
@property (nonatomic) MSRangeGauge *inclusiveGauge;
@property (nonatomic) NSArray *gauges;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *stepcompleteLabel;
@property (strong, nonatomic) IBOutlet UILabel *avgtimeLabel;

- (IBAction)updateButton:(id)sender;
- (IBAction)zeroPressed:(id)sender;
- (IBAction)sixtyPressed:(id)sender;




@end
