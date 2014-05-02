//
//  FVViewController.m
//  TibSocial
//
//  Created by joe90 on 24/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVViewController.h"
#import "FVAchivementsModel.h"
#import <UIKit/UIKit.h>
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
    _userName.text = [_userName.text lowercaseString];
    
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




