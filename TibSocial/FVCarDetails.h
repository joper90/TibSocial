//
//  FVCarDetails.h
//  TibSocial
//
//  Created by joe90 on 28/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FVCar.h"

@interface FVCarDetails : NSObject
{
    BOOL worked;
    NSMutableArray *carList;
}
@property (readwrite,assign) BOOL worked;
@property (readwrite, strong) NSMutableArray *carList;

@end
