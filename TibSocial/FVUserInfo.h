//
//  FVUserInfo.h
//  TibSocial
//
//  Created by joe90 on 24/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FVPlayerCoreDetails.h"
#import "FVAchivementProgress.h"

@interface FVUserInfo : FVPlayerCoreDetails
{
    NSMutableArray *hardAchivements;
    NSMutableArray *softAchivements;
}

@property (readwrite, strong) NSMutableArray *hardAchivements;
@property (readwrite, strong) NSMutableArray *softAchivements;


@end
