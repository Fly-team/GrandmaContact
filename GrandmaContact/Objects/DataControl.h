//
//  DataControl.h
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "SDBManager.h"
#import "ContactModel.h"

@interface DataControl : NSObject

@property (nonatomic, strong) FMDatabase *db;

//创建表
- (BOOL)createContactTable;
- (NSMutableArray*)getPhoneNumbersByContact:(ContactModel *)contact;
- (NSMutableArray*)getAllContacts;
- (void)insertContactWithContact:(ContactModel *)contact;
@end
