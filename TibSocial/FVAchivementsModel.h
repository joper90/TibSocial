//
//  FVAchivementsModel.h
//  TibSocial
//
//  Created by joe90 on 28/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVBaseModel.h"

@interface FVAchivementsModel : FVBaseModel
{
    NSString *name;
    int count;
    NSString *notImg;
    NSString *gotImg;
    NSString *description;
    NSString *guid;
}
@property (readwrite, strong) NSString *name;
@property (readwrite, strong) NSString *notImg;
@property (readwrite, strong) NSString *gotImg;
@property (readwrite, strong) NSString *description;
@property (readwrite, strong) NSString *guid;
@property (readwrite, assign) int count;

@end
