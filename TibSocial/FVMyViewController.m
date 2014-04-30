//
//  FVMyViewController.m
//  TibSocial
//
//  Created by joe90 on 30/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVMyViewController.h"
@interface FVMyViewController ()

@end

@implementation FVMyViewController

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

    [self loadVenues];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
                                                  _stepcountLabel.text = [NSString stringWithFormat:@"%d",details.stepCount];
                                                  _avgtimeLabel.text = [NSString stringWithFormat:@"%d",details.avgTimePerStep];
                                                  
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"Rest call failed..?': %@", error);
                                              }];
    
    
}
@end
