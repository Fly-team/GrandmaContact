//
//  LWEditViewController.h
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "ContactModel.h"
@interface LWEditViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *im;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) ContactModel * contact;
@property (weak, nonatomic) IBOutlet UITableView *phoneTableView;
@property (nonatomic, strong) NSMutableArray * phoneNumberArr;//存所有的号码
@property (nonatomic, strong) DataControl * data;
@end
