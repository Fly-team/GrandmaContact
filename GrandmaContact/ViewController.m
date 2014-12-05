//
//  ViewController.m
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "ViewController.h"
#import "LWContactTableViewCell.h"
#import "LWAddContactViewController.h"
#import "LWDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray arrayWithObjects:@"aaa",@"bbb",@"ccc", nil];
    _indexArr = [NSMutableArray arrayWithObjects:@"a",@"b",@"c", nil];
    [_myTableView registerNib:[UINib nibWithNibName:@"LWContactTableViewCell" bundle:nil] forCellReuseIdentifier:@"ContactCell"];
        // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark -------------------delegate--------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"ContactCell";
    LWContactTableViewCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"LWContactTableViewCell" owner:self options:nil];
        cell = [nib lastObject];
    }
    cell.nameLabel.text = _dataArr[indexPath.row];

    return cell;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _indexArr;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LWDetailViewController * detail = [story instantiateViewControllerWithIdentifier:@"DetailVC"];
    [self.navigationController pushViewController:detail animated:YES];
}
- (IBAction)addContact:(id)sender {
}
- (IBAction)refreshAllContacts:(id)sender {
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
