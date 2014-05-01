//
//  FVListViewController.m
//  TibSocial
//
//  Created by joe90 on 29/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVListViewController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import "FVTibbrMessage.h"

@implementation FVListViewController

NSString *lastDateMessage;

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
    lastDateMessage = @"NIL";
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated
{
    [self loadVenues];
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
    RKObjectMapping *userInfoMapping = [RKObjectMapping mappingForClass:[FVTibbrMessage class]];
    [userInfoMapping addAttributeMappingsFromArray:@[@"message", @"worked", @"dataPosted", @"poster" , @"tibbrMessage"]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:userInfoMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/GamificationPOC/rest/lastmessage/tibco-admin"
                                                keyPath:@""
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
     RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
   
    [objectManager getObjectsAtPath:@"/GamificationPOC/rest/lastmessage/tibco-admin"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                NSLog(@"Worked?':");
                                
                               //Tibbr Logic here.
                                FVTibbrMessage *tMessage = mappingResult.array[0];
                                NSLog(@"GOT THE STRING = %@", tMessage.tibbrMessage);
                                
                                NSString *date = tMessage.dataPosted;
                                
  
                                if ([lastDateMessage isEqualToString:tMessage.dataPosted])
                                {
                                    NSLog(@"Same call as before..");
                                }else
                                {
                                    if ([date rangeOfString:@"2014"].location == NSNotFound)
                                    {
                                            //We will discard, as this is an old message.
                                            NSLog(@"---> Old message, not using");
                                    }else{
                                            
                                       NSString *title = [NSString stringWithFormat:@"New Tibbr Message"];
                                       lastDateMessage = tMessage.dataPosted;
                                            
                                            
                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:tMessage.tibbrMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                            [alert show];
                                            
                                            
                                       }
                                  }
                                
                                
                                
                                
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                NSLog(@"Rest call failed..?': %@", error);
                            }];
    
    
}


@end
