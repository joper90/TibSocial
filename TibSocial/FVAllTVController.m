//
//  FVAllTVController.m
//  TibSocial
//
//  Created by joe90 on 29/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVAllTVController.h"
#import "FVAchivementsModel.h"

@implementation FVAllTVController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _achivements = [[NSArray alloc]init];
        
    [self loadVenues];
    //Lets load all the data up..
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _achivements.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSLog(@"ATTEMPTIGN TO UPDATE CELL");
    FVAchivementsModel *cellModel = [_achivements objectAtIndex:indexPath.row];
    cell.textLabel.text = cellModel.name;
    cell.detailTextLabel.text = cellModel.description;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark Load Invites

-(void)loadVenues
{
    
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://10.100.83.75:8084"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    
    
    // setup object mappings
    RKObjectMapping *allInfoMapping = [RKObjectMapping mappingForClass:[FVAchivementsModel	 class]];
    [allInfoMapping addAttributeMappingsFromArray:@[@"id" ,@"name" ,@"count" ,@"gotImg" ,@"notImg" ,@"description" ,@"guid"]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:allInfoMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/GamificationPOC/rest/achivements/tibco-admin"
                                                keyPath:@"achivements"
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    
    [objectManager getObjectsAtPath:@"/GamificationPOC/rest/achivements/tibco-admin"
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  NSLog(@"Worked?':");
                                                  
                                                  
                                                  for (int count = 0; count < mappingResult.count; count++)
                                                  {
                                                      FVAchivementsModel *model = mappingResult.array[count];
                                                      NSLog(@"Name %d", model.id);
                                                      
                                                  }
                                                  
                                                  _achivements = mappingResult.array;
                                                  [self.tableView reloadData];
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"Error?': %@", error);
                                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Cannot connect to the server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                                  [alert show];
                                              }];
    
    
    
}


@end
