//
//  LWContactTableViewCell.h
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"

@interface LWContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) ContactModel * contact;
@property (nonatomic, strong) UIImageView * im;
@end
