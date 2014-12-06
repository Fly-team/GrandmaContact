//
//  ViewController.h
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataControl.h"

@interface ViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray * dataArr;
@property (nonatomic, strong) NSMutableArray * indexArr;
@property (nonatomic, strong) NSMutableArray * sectionHeadsKeys;
@property (nonatomic, strong) NSMutableArray * sortedDataArr;

@end

