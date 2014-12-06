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
#import "pinyin.h"
#import "ChineseString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DataControl * data = [[DataControl alloc] init];
    _sectionHeadsKeys = [NSMutableArray array];
    _dataArr = [data getAllContacts];
    _sortedDataArr = [self getChineseStringArr:_dataArr];
    
    _indexArr = [NSMutableArray arrayWithObjects:@"a",@"b",@"c", nil];
    [_myTableView registerNib:[UINib nibWithNibName:@"LWContactTableViewCell" bundle:nil] forCellReuseIdentifier:@"ContactCell"];
    _myTableView.tableFooterView = nil;
    _myTableView.tableHeaderView = nil;
        // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark -------------------delegate--------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sortedDataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * arr = _sortedDataArr[section];
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"ContactCell";
    LWContactTableViewCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"LWContactTableViewCell" owner:self options:nil];
        cell = [nib lastObject];
    }
    NSArray * arr = _sortedDataArr[indexPath.section];
    ContactModel * contact = [(ChineseString*)arr[indexPath.row] contact];
    cell.nameLabel.text = contact.name;

    return cell;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionHeadsKeys;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sectionHeadsKeys[section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LWDetailViewController * detail = [story instantiateViewControllerWithIdentifier:@"DetailVC"];
    NSArray * arr = _sortedDataArr[indexPath.section];
    ChineseString * str = arr[indexPath.row];
    ContactModel * contact = str.contact;
    detail.contact = contact;
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
- (NSMutableArray *)getChineseStringArr:(NSMutableArray *)arrToSort {
    NSMutableArray *chineseStringsArray = [NSMutableArray array];
    for(int i = 0; i < [arrToSort count]; i++) {
        ChineseString *chineseString=[[ChineseString alloc]init];
        ContactModel * contact = _dataArr[i];
        chineseString.string = contact.name;
        chineseString.contact = contact;
        if(chineseString.string==nil){
            chineseString.string=@"";
        }
        
        if(![chineseString.string isEqualToString:@""]){
            //join the pinYin
            NSString *pinYinResult = [NSString string];
            for(int j = 0;j < chineseString.string.length; j++) {
                NSString *singlePinyinLetter = [[NSString stringWithFormat:@"%c",
                                                 pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
                
                pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
            }
            chineseString.pinYin = pinYinResult;
        } else {
            chineseString.pinYin = @"";
        }
        [chineseStringsArray addObject:chineseString];
        
    }
    
    //sort the ChineseStringArr by pinYin
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    
    
    NSMutableArray *arrayForArrays = [NSMutableArray array];
    BOOL checkValueAtIndex= NO;  //flag to check
    NSMutableArray *TempArrForGrouping = nil;
    
    for(int index = 0; index < [chineseStringsArray count]; index++)
    {
        ChineseString *chineseStr = (ChineseString *)[chineseStringsArray objectAtIndex:index];
        NSMutableString *strchar= [NSMutableString stringWithString:chineseStr.pinYin];
        NSString *sr= [strchar substringToIndex:1];
        //        NSLog(@"%@",sr);        //sr containing here the first character of each string
        if(![_sectionHeadsKeys containsObject:[sr uppercaseString]])//here I'm checking whether the character already in the selection header keys or not
        {
            [_sectionHeadsKeys addObject:[sr uppercaseString]];
            TempArrForGrouping = [[NSMutableArray alloc] initWithObjects:nil];
            checkValueAtIndex = NO;
        }
        if([_sectionHeadsKeys containsObject:[sr uppercaseString]])
        {
            [TempArrForGrouping addObject:[chineseStringsArray objectAtIndex:index]];
            if(checkValueAtIndex == NO)
            {
                [arrayForArrays addObject:TempArrForGrouping];
                checkValueAtIndex = YES;
            }
        }
    }
    return arrayForArrays;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
