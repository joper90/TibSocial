//
//  FVPlayerCoreDetails.h
//  TibSocial
//
//  Created by joe90 on 24/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FVRequestDetails.h"

@interface FVPlayerCoreDetails : FVRequestDetails
{
    NSString *name;
    NSString *guid;
    int stepCount;
    int avgTimePerStep;
    BOOL newUser;
}

@property (readwrite, strong) NSString *name;
@property (readwrite, strong) NSString *guid;
@property (readwrite, assign)int stepCount;
@property (readwrite, assign)int avgTimePerStep;
@property (readwrite, assign)BOOL newUser;


@end
