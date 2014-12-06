//
//  LWDetailViewController.m
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "LWDetailViewController.h"
#import "LWEditViewController.h"
#import "Header.h"
@interface LWDetailViewController ()

@end

@implementation LWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    _nameLabel.text = _contact.name;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * fileName = [NSString stringWithFormat:@"%@_id.jpg",_contact.name];
    NSString * filePath = [DOCUMENT_PATH stringByAppendingPathComponent:fileName];
    if ([fileManager fileExistsAtPath:filePath isDirectory:NULL]) {
        _im.image = [UIImage imageWithContentsOfFile:filePath];
    }else {
        _im.image = [UIImage imageNamed:@"contact_icon.png"];
    }
    // Do any additional setup after loading the view.
}
- (void)editAction
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LWEditViewController * edit = [story instantiateViewControllerWithIdentifier:@"EditVC"];
    edit.contact = self.contact;
    [self.navigationController pushViewController:edit animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
