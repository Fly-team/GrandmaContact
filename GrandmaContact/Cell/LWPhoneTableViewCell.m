//
//  LWPhoneTableViewCell.m
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "LWPhoneTableViewCell.h"

@implementation LWPhoneTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)doneAction:(UITextField *)sender
{
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithInteger:self.tag], @"cellTag",
                          _textField.text,@"textStr", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changePhoneNumber" object:nil userInfo:dic];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
