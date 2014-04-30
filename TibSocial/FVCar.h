//
//  FVCar.h
//  TibSocial
//
//  Created by joe90 on 28/04/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FVCar : NSObject
{
    NSString *name;
    int engineSize;
}
@property(readwrite,strong)NSString *name;
@property(readwrite,assign)int engineSize;
@end
