//
//  FVAchivementProgress.h
//  TibSocial
//
//  Created by joe90 on 24/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FVAchivementProgress : NSObject
{
    NSString    *achivementName;
    NSString    *description;
    NSString    *achivementGUID;
    BOOL        completed;
    long        competedDate;
    
    int         progress;
    int         maxAmount;
    NSString    *img;
}

@property (readwrite, strong) NSString *achivementName;
@property (readwrite, strong) NSString *description;
@property (readwrite, strong) NSString *achivementGUID;
@property (readwrite) BOOL completed;
@property (readwrite) long completedDate;
@property (readwrite) int progress;
@property (readwrite) int maxAmount;
@property (readwrite) NSString *img;


@end
