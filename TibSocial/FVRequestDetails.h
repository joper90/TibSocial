//
//  FVRequestDetails.h
//  TibSocial
//
//  Created by joe90 on 28/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FVRequestDetails : NSObject
{
    BOOL success;
    NSString *message;
}
@property (readwrite, assign)BOOL success;
@property (readwrite, strong)NSString *message;
@end
