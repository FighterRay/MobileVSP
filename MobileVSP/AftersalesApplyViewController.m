//
//  AftersalesApplyViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "AftersalesApplyViewController.h"
#import "ServiceTypeTableViewCell.h"

#define kMainColor [UIColor colorWithRed:232/255.0 green:108/255.0 blue:82/255.0 alpha:1]

typedef NS_ENUM(NSUInteger, AftersalesApplyTableCellType) {
    AftersalesApplyTableCellTypeProductInfo =0,
    AftersalesApplyTableCellTypeServiceType = 1
};

@interface AftersalesApplyViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *serviceTypeScrollView;

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
    
    [self configureServiceTypeCell];
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
