//
//  DataControl.m
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "DataControl.h"

@implementation DataControl
-(instancetype)init
{
    if (self = [super init]) {
        _db = [SDBManager defaultDBManager].dataBase;
        [self createContactTable];
    }
    return self;
}
-(BOOL)createContactTable
{
    if ([self.db tableExists:@"contactlist"]) {
        return YES;
    }
    BOOL temp = NO;
    temp = [self.db executeUpdate:@"create table contactlist (name text,iconName text,phonenumber text)"];
    return temp;
}
-(NSMutableArray *)getPhoneNumbersByContact:(ContactModel *)contact
{
    NSMutableArray * arr = [NSMutableArray array];
    NSString * tempstring = [self.db stringForQuery:@"select phonenumber from contactlist where name = ?",contact.name];
    if (tempstring && ![tempstring isEqualToString:@""]) {
        if ([tempstring containsString:@"/"]) {
            NSArray * tempArr = [tempstring componentsSeparatedByString:@"/"];
            for (NSString * str in tempArr) {
                [arr addObject:str];
            }
        }else {
            [arr addObject:tempstring];
        }
    }
    
    
    return arr;
}
-(NSMutableArray *)getAllContacts
{
    FMResultSet *re = [self.db executeQuery:@"select * from contactlist"];
    NSMutableArray * arr = [NSMutableArray array];
    while ([re next]) {
        ContactModel * contact = [[ContactModel alloc] init];
        contact.name = [re stringForColumn:@"name"];
        contact.iconName = [re stringForColumn:@"iconName"];
        contact.phoneNumber = [re stringForColumn:@"phonenumber"];
        [arr addObject:contact];
    }
    return arr;
}
@end
