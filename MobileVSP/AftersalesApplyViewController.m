//
//  AftersalesApplyViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "AftersalesApplyViewController.h"
#import "ServiceTypeTableViewCell.h"
#import "PhotoCollectionViewCell.h"
#import "AddButtonCollectionViewCell.h"

#define kMainColor [UIColor colorWithRed:232/255.0 green:108/255.0 blue:82/255.0 alpha:1]

typedef NS_ENUM(NSUInteger, AftersalesApplyTableCellType) {
    AftersalesApplyTableCellTypeProductInfo =0,
    AftersalesApplyTableCellTypeServiceType = 1
};

@interface AftersalesApplyViewController () <ZRFCollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *serviceTypeScrollView;
@property (strong, nonatomic) UIView *backgroundView;
//@property (strong, nonatomic) UIImageView *showImgView;

@end

@implementation AftersalesApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSArray *buttonArray = @[@"换货", @"维修", @"退货", @"换货", @"维修", @"退货"];
    self.buttonsArray = [NSMutableArray arrayWithArray:buttonArray];
    
    NSArray *photoArray = @[];
    self.photoArray = [NSMutableArray arrayWithArray:photoArray];
    
    [self configureServiceTypeCell];
    
    self.photoPickerCollectionView.zrfDataSource = self;
}

- (void)configureServiceTypeCell {
    CGFloat buttonWidth = 75;
    CGFloat buttonHeight = 30;
    CGFloat space = 10;
    
    CGFloat sumLength = 16 + (buttonWidth + space) * [self.buttonsArray count] - space;
    if (sumLength >= [UIScreen mainScreen].bounds.size.width) {
        CGSize size = self.serviceTypeScrollView.contentSize;
        size.width = sumLength - 16;
        self.serviceTypeScrollView.contentSize = size;
    }
    
    for (int i = 0; i < [self.buttonsArray count]; i ++) {
        CGRect rect = CGRectMake(i * (buttonWidth + space), 10, buttonWidth, buttonHeight);
        UIButton *button = [[UIButton alloc] initWithFrame:rect];
        [button setTitle:self.buttonsArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor: kMainColor forState: UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageNamed:@"serviceType"] forState:UIControlStateHighlighted];
        // Set radius
        [button.layer setCornerRadius:2];
        button.layer.masksToBounds = YES;
        
        // Set border
        [button.layer setBorderColor:[UIColor grayColor].CGColor];
        [button.layer setBorderWidth:1.0];
        
        [self.serviceTypeScrollView addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ZRFCollection view data source


- (void)zrfCollectionView:(UICollectionView *)collectionView willClickAddButtonAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)zrfCollectionView:(UICollectionView *)collectionView didClickAddButtonAtIndexPath:(NSIndexPath *)indexPath {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
    self.photoPickerCollectionView.photoArray = [self.photoArray copy];
}

- (void)zrfCollectionView:(UICollectionView *)collectionView deletePhotoAtIndexPath:(NSIndexPath *)indexPath {
    [self.photoArray removeObjectAtIndex:indexPath.row];
    self.photoPickerCollectionView.photoArray = [self.photoArray copy];
    [self.photoPickerCollectionView reloadData];
    [self.tableView reloadData];
}

#pragma mark - ImagePickerController delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    [self.photoArray addObject:image];
    self.photoPickerCollectionView.photoArray = [self.photoArray mutableCopy];;
    NSLog(@"self.photoArray %@", self.photoArray);
    NSLog(@"self.collectionView.photoArray %@", self.photoPickerCollectionView.photoArray);
    [self dismissViewControllerAnimated:YES completion:^{
        [self.tableView reloadData];
        [self.photoPickerCollectionView reloadData];
    }];
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 10) {
        return 145 + [self.photoArray count]/6 * (50 + 10);
    } else if (indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 6) {
        return 96;
    } else if (indexPath.row == 0) {
        return 100;
    } else if (indexPath.row == 8) {
        return 145;
    } else {
        return 14;
    }
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ServiceTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceTypeTableViewCell" forIndexPath:indexPath];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
