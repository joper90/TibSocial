//
//  FVTibbrMessage.h
//  TibSocial
//
//  Created by joe90 on 01/05/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FVTibbrMessage : NSObject
{
    NSString *message;
    BOOL        success;
    
    NSString *dataPosted;
    NSString *poster;
    NSString *tibbrMessage;
    
}

@property (readwrite, strong) NSString *message;
@property (readwrite, strong) NSString *dataPosted;
@property (readwrite, strong) NSString *poster;
@property (readwrite, strong) NSString *tibbrMessage;
@property (readwrite, nonatomic) BOOL success;

@end
