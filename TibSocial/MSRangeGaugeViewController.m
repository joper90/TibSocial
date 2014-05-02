//
//  MSRangeGaugeViewController.m
//  SimpleGauge
//
//  Created by Mike Sabatini on 6/20/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import "MSRangeGaugeViewController.h"

@interface MSRangeGaugeViewController ()

@end

@implementation MSRangeGaugeViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadVenues];
    self.inclusiveGauge = [[MSRangeGauge alloc] initWithFrame:CGRectMake(45, 200, 230, 150)];
    self.inclusiveGauge.minValue = 0;
    self.inclusiveGauge.maxValue = 60;
    self.inclusiveGauge.upperRangeValue = 40;
    self.inclusiveGauge.lowerRangeValue = 20;
    self.inclusiveGauge.value = 0;
    
    self.inclusiveGauge.backgroundArcFillColor = [UIColor colorWithRed:.8 green:.2 blue:.2 alpha:1];
    self.inclusiveGauge.backgroundArcStrokeColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.inclusiveGauge.rangeFillColor = [UIColor colorWithRed:0 green:.90 blue:0 alpha:1];
    
    //self.inclusiveGauge.rangeFillColor = [UIColor colorWithRed:0 green:.76 blue:0 alpha:1];
    [self.view addSubview:self.inclusiveGauge];

    
    self.gauges = @[self.inclusiveGauge];
    
    
    //[self.inclusiveGauge setValue:_inclusiveGauge.value+30 animated:YES];
}

#pragma mark Load User Achivements

-(void)loadVenues
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://10.100.83.75:8084"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    
    
    // setup object mappings
    RKObjectMapping *userInfoMapping = [RKObjectMapping mappingForClass:[FVPlayerCoreDetails class]];
    [userInfoMapping addAttributeMappingsFromArray:@[@"name", @"guid", @"stepCount", @"avgTimePerStep" , @"newUser"]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:userInfoMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/GamificationPOC/rest/userdetails/tibco-admin"
                                                keyPath:@""
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    NSDictionary *prams = @{@"userGuid" : @"tibco-admin" , @"supplyImages" : @"true"};
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    
    [objectManager getObjectsAtPath:@"/GamificationPOC/rest/userdetails/tibco-admin"
                         parameters:prams
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                NSLog(@"Worked?':");
                                
                                FVPlayerCoreDetails *details = mappingResult.array[0];
                                _usernameLabel.text = details.name;
                                _stepcompleteLabel.text = [NSString stringWithFormat:@"%d",details.stepCount];
                                _avgtimeLabel.text = [NSString stringWithFormat:@"%d",details.avgTimePerStep];
                                

                                [self.inclusiveGauge setValue:details.avgTimePerStep animated:YES];
                                
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                NSLog(@"Rest call failed..?': %@", error);
                            }];
    
    
}

- (IBAction)updateButton:(id)sender {
    NSLog(@"Update called..");
    [self loadVenues];
    
}

- (IBAction)zeroPressed:(id)sender
{
    [self.inclusiveGauge setValue:0 animated:YES];
}

- (IBAction)sixtyPressed:(id)sender
{
    [self.inclusiveGauge setValue:60 animated:YES];
}
@end
