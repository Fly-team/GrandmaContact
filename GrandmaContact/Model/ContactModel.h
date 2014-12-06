//
//  ContactModel.h
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactModel : NSObject
@property (nonatomic, copy) NSString * lastName;//上一次的名字
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * phoneNumber;

@end
