//
//  LWEditViewController.m
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "LWEditViewController.h"

@interface LWEditViewController ()

@end

@implementation LWEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * lefttItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(saveOrCancelAction:)];
    lefttItem.tag = 0;
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveOrCancelAction:)];
    rightItem.tag = 1;
    self.navigationItem.leftBarButtonItem = lefttItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    // Do any additional setup after loading the view.
}
- (void)saveOrCancelAction:(UIBarButtonItem *)item
{
    switch (item.tag) {
        case 0://取消
            
            break;
            
        case 1://保存
            
            break;
            
        default:
            break;
    }
    [self.navigationController popViewControllerAnimated:NO];
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
