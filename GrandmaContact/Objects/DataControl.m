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
    temp = [self.db executeUpdate:@"create table contactlist (lastName text,name text,phoneNumber text)"];
    return temp;
}
-(NSMutableArray *)getPhoneNumbersByContact:(ContactModel *)contact
{
    NSMutableArray * arr = [NSMutableArray array];
    NSString * tempstring = [self.db stringForQuery:@"select phoneNumber from contactlist where lastName = ?",contact.lastName];
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
        contact.lastName = [re stringForColumn:@"lastName"];
        contact.name = [re stringForColumn:@"name"];
        contact.phoneNumber = [re stringForColumn:@"phoneNumber"];
        [arr addObject:contact];
    }
    return arr;
}
-(void)insertContactWithContact:(ContactModel *)contact
{
    NSString * tempstring = [self.db stringForQuery:@"select lastName from contactlist where lastName = ?",contact.lastName];
    
    if (tempstring && ![tempstring isEqualToString:@""])
    {
        [_db executeUpdate:@"delete from contactlist where lastName = ?",contact.lastName];
    }
    
    [self.db executeUpdate:@"insert into contactlist(lastName,name,phoneNumber) values (?,?,?)",contact.name,contact.name,contact.phoneNumber];
}
@end
