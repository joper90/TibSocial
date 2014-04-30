//
//  FVAchivements.h
//  TibSocial
//
//  Created by joe90 on 28/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVRequestDetails.h"

@interface FVAchivements : FVRequestDetails
{
    NSMutableArray *achivements;
}
@property (readwrite, strong) NSMutableArray *achivements;
@end
