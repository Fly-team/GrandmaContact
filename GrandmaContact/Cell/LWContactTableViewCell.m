//
//  LWContactTableViewCell.m
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "LWContactTableViewCell.h"

@implementation LWContactTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _im = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
    _im.backgroundColor = [UIColor redColor];
    [self addSubview:_im];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
