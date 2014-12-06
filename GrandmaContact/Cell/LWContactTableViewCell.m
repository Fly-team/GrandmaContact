//
//  LWContactTableViewCell.m
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "LWContactTableViewCell.h"
#import "Header.h"
@implementation LWContactTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _im = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
    [self addSubview:_im];
}
-(void)layoutSubviews
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * fileName = [NSString stringWithFormat:@"%@_id.jpg",_contact.name];
    NSString * filePath = [DOCUMENT_PATH stringByAppendingPathComponent:fileName];
    if ([fileManager fileExistsAtPath:filePath isDirectory:NULL]) {
        _im.image = [UIImage imageWithContentsOfFile:filePath];
    }else {
        _im.image = [UIImage imageNamed:@"contact_icon.png"];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
