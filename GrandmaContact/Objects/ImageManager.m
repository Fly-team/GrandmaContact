//
//  ImageManager.m
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "ImageManager.h"

static ImageManager * imageManager = nil;
@implementation ImageManager
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}
+(ImageManager *)sharedInstance
{
    if (!imageManager) {
        imageManager = [[super allocWithZone:NULL] init];
    }
    return imageManager;
}
-(instancetype)init
{
    if (imageManager) {
        return imageManager;
    }
    self = [super init];
    return self;
}
@end
