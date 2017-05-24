//
//  WriteShipOrderViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/24.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "WriteShipOrderViewController.h"
#import "WriteShipOrderTableViewCell.h"

@interface WriteShipOrderViewController ()<UITableViewDelegate, UITableViewDataSource>

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
    if (row == 1) {
        cell.textField.enabled = NO;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
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
