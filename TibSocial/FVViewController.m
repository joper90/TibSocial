//
//  FVViewController.m
//  TibSocial
//
//  Created by joe90 on 24/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVViewController.h"
#import "FVAchivementsModel.h"
#import <RestKit/RestKit.h>

@interface FVViewController ()

@end

@implementation FVViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //[self configureRestKit];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//- (IBAction)pushButton:(id)sender
//{
//    //[self loadVenues];
//    NSMutableArray *ret = [_callOut loadVenues];
//    NSLog(@"Count : %d", ret.count);
//    _showInfo.text=@"name";
//    
//}
- (IBAction)loginPushed:(id)sender
{
    //Check to see if we can login. hard coded at the momemt.
    if ([_userName.text  isEqualToString: USER_NAME])
    {
        NSLog(@"username is correct");
        if ([_password.text isEqualToString:PASSWORD])
        {
            NSLog(@"password is correct");
            
            //All worked.. so lets move to the next page.
            
            [self performSegueWithIdentifier:@"myListSeg" sender:self];
            
            return;
            
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Incorrect username or password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}
@end










/*
- (void)configureRestKit
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://localhost:8080"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // setup object mappings
    RKObjectMapping *userInfoMapping = [RKObjectMapping mappingForClass:[FVCar class]];
    [userInfoMapping addAttributeMappingsFromArray:@[@"name", @"engineSize"]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:userInfoMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/FUNKVOODOO-RESTTEST/rest/helloWorldREST/skoda"
                                                keyPath:@"car"
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
}

- (void)loadVenues
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/FUNKVOODOO-RESTTEST/rest/helloWorldREST/skoda"
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  NSLog(@"Worked?':");
                                                  NSLog(@"%@",mappingResult.array[0]);
                                                  FVCar *car = mappingResult.array[0];
                                                  NSLog(@"name: %@",car.name);
                                                  
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"What do you mean by 'there is no coffee?': %@", error);
                                              }];
}
*/

