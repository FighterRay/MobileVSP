//
//  SearchViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/16.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
#import "InfoTableViewCell.h"

@interface SearchViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Configure tableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Mock data
    NSArray *data = @[
                     @{@"orderId": @"9864168213",
                       @"time": @"2017-03-13 10:11:50",
                       @"list": @[@{@"productName": @"Chanel香奈儿浓情邂逅高级淡香水粉红色",
                                    @"number": @"1",
                                    @"productImageName": @"1"}
                                  ]
                       },
                     
                     @{@"orderId": @"9864168213",
                       @"time": @"2017-03-13 10:11:50",
                       @"list": @[@{@"productName": @"荷尔檬安岳黄柠檬新鲜水果2斤装买2送1",
                                    @"number": @"1",
                                    @"productImageName": @"2"},
                                  @{@"productName": @"Chanel香奈儿浓情邂逅高级淡香水粉红色",
                                    @"number": @"1",
                                    @"productImageName": @"3"},
                                  @{@"productName": @"Chanel香奈儿浓情邂逅高级淡香水粉红色",
                                    @"number": @"1",
                                    @"productImageName": @"1"}
                                  ]
                       }
                     ];
    
    self.data = [[NSMutableArray alloc] initWithArray:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return 66;
            break;
        case 1:
            return 90;
        default:
            return 90;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[section][@"list"] count] + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *sectionData = self.data[indexPath.section];
    
    if (indexPath.row == 0) {
        
        static NSString *infoCellReuseIdentifier = @"InfoTableViewCell";
        InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellReuseIdentifier forIndexPath:indexPath];

        cell.orderIdLabel.text = sectionData[@"orderId"];
        cell.timeLabel.text = sectionData[@"time"];
        return cell;
        
    } else {
        
        NSDictionary *rowData = sectionData[@"list"][indexPath.row - 1];
        static NSString *searchCellReuseIdentifier = @"SearchTableViewCell";
        SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellReuseIdentifier forIndexPath:indexPath];
        cell.productImageView.image = [UIImage imageNamed:rowData[@"productImageName"]];
        cell.productNameLabel.text = rowData[@"productName"];
        cell.numberLabel.text = rowData[@"number"];
        return cell;
    }
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
