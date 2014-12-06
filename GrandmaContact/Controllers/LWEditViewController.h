//
//  LWEditViewController.h
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"
@interface LWEditViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *im;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) ContactModel * contact;
@end
