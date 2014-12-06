//
//  LWDetailViewController.h
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataControl.h"

@interface LWDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITableView *phoneTableView;
@property (weak, nonatomic) IBOutlet UIImageView *im;

@property (nonatomic, strong) ContactModel * contact;
@end
