//
//  LWEditViewController.m
//  GrandmaContact
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import "LWEditViewController.h"
#import "LWPhoneTableViewCell.h"
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
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * fileName = [NSString stringWithFormat:@"%@_id.jpg",_contact.name];
    NSString * filePath = [DOCUMENT_PATH stringByAppendingPathComponent:fileName];
    if ([fileManager fileExistsAtPath:filePath isDirectory:NULL]) {
        _im.image = [UIImage imageWithContentsOfFile:filePath];
    }else {
        _im.image = [UIImage imageNamed:@"contact_icon.png"];
    }
    
    _textField.text = _contact.name;
    [_phoneTableView registerNib:[UINib nibWithNibName:@"LWPhoneTableViewCell" bundle:nil] forCellReuseIdentifier:@"PhoneCell"];
    
    _data = [[DataControl alloc] init];
    _phoneNumberArr = [_data getPhoneNumbersByContact:_contact];
    // Do any additional setup after loading the view.
}
- (IBAction)selectPhoto:(UITapGestureRecognizer *)sender
{
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"提示"
                                                        delegate:self
                                               cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [sheet showInView:self.view];
}
- (IBAction)addCell:(id)sender
{
    if ([(NSString *)[_phoneNumberArr lastObject] isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"填写后才可增加!"];
        return;
    }
    
    [_phoneNumberArr addObject:@""];
    NSIndexPath * index = [NSIndexPath indexPathForRow:_phoneNumberArr.count -1 inSection:0];
    [_phoneTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationAutomatic];
    [_phoneTableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionBottom animated:YES];
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
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%d",buttonIndex);
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    switch (buttonIndex) {
        case 0:
            
            break;
        case 1:
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        case 2:
            return;
            break;
            
        default:
            break;
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = sourceType;
        picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:picker animated:YES completion:nil];
    }else {
        NSLog(@"请使用真机");
    }

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString * type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.im.image = nil;
        self.im.image = image;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark -------------tableView-----------------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _phoneNumberArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"PhoneCell";
    LWPhoneTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"LWPhoneTableViewCell" owner:self options:nil];
        cell = [nib lastObject];
    }
    cell.textField.text = _phoneNumberArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.;
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
