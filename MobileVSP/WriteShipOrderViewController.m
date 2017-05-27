//
//  WriteShipOrderViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/24.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "WriteShipOrderViewController.h"
#import "WriteShipOrderTableViewCell.h"
#import "HubView.h"
#import "DeliveryCompanyPickerViewController.h"

@interface WriteShipOrderViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) HubView *hubView;
@property (strong, nonatomic) NSMutableString *companyName;
@property (strong, nonatomic) NSMutableString *cost;

@end

@implementation WriteShipOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Mock data
    NSArray *data = @[@{@"name": @"快递单号", @"textFieldPlaceholder": @"请输入快递单号"},
                      @{@"name": @"快递公司", @"textFieldPlaceholder": @"请选择快递公司"},
                      @{@"name": @"快递费用", @"textFieldPlaceholder": @"请输入快递费用"}
                      ];
    self.data = [[NSMutableArray alloc] initWithArray:data];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat hieght = (self.tableView.frame.size.height - 64) / 3;
    return hieght;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        [self showDeliveryCompanyPickerViewController];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    WriteShipOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WriteShipOrderTableViewCell" forIndexPath:indexPath];
    cell.nameLabel.text = self.data[row][@"name"];
    cell.textField.placeholder = self.data[row][@"textFieldPlaceholder"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (row == 0) {
        cell.compeletionTextFieldBlock = ^{
            
        };
    }
    if (row == 1) {
        cell.textField.enabled = NO;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textField.text = self.companyName;
    } else if (row == 2) {
        cell.compeletionTextFieldBlock = ^{
            [self.tableView reloadData];
        };
        self.cost = [cell.textField.text mutableCopy];
    }
    
    return cell;
}

- (IBAction)submit:(id)sender {
    
    if (![self.cost isEqualToString:@""] && ![self isPureInt:self.cost]) {
        self.hubView = [HubView hubInView:self.navigationController.view anmiated:YES];
        self.hubView.text = @"快递费用格式填写\n不正确且为正整数";
        
        [self performSelector:@selector(removeHubView) withObject:nil afterDelay:1.0];
    }

}

- (void)removeHubView {
    [self.hubView setHidden:YES];
}

- (void)showDeliveryCompanyPickerViewController {
    [self performSegueWithIdentifier:@"showDeliveryCompanyPickerViewController" sender:nil];
}

- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showDeliveryCompanyPickerViewController"]) {
        DeliveryCompanyPickerViewController *vc = (DeliveryCompanyPickerViewController *)[segue destinationViewController];
        vc.submitButton = ^(NSString *companyName) {
            self.companyName = [companyName mutableCopy];
            [self.tableView reloadData];
        };
    }
}

@end
