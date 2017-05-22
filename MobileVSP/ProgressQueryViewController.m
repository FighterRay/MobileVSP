//
//  ProgressQueryViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "ProgressQueryViewController.h"
#import "OrderIdTableViewCell.h"
#import "OrderStateTableViewCell.h"
#import "ProductInfoTableViewCell.h"
#import "StateButtonsTableViewCell.h"
#import "ButtonsCollectionViewCell.h"
#import "ButtonsCollectionViewLayout.h"

@interface ProgressQueryViewController ()<UITableViewDelegate,UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, ButtonsCollectionViewLayoutDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet ButtonsCollectionViewLayout *buttonsCollectionViewLayout;

@end

@implementation ProgressQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Mock the buttons array data
    NSArray *buttonsArray = @[@"取消申请", @"更改订单", @"进度查询"];//, @"取消申请", @"取消申请", @"更改订单", @"进度查询", @"取消申请"];
    self.buttonsArray = [NSMutableArray arrayWithArray:buttonsArray];
    
    // Mock the table view data
    NSArray *data = @[
                      @[@{@"orderId": @"98394857834", @"state": @"填写发货单"},
                        @{@"orderState": @"您的服务单已审核客户发货，请将商品寄回"},
                        @{@"productImageName": @"1", @"productName": @"Chanel香奈儿浓情邂逅高级淡香水粉红色", @"applyTime": @"2016-05-25 12:12:11"},
                        @{@"buttonsArray": self.buttonsArray}],
                      
                      @[@{@"orderId": @"98394857900", @"state": @"已完成"},
                        @{@"orderState": @"您的服务单已申请成功，待售后审核中"},
                        @{@"productImageName": @"2", @"productName": @"Chanel香奈儿浓情邂逅高级淡香水粉红色", @"applyTime": @"2016-05-25 12:12:11"},
                        @{@"buttonsArray": self.buttonsArray}]
                      ];
    self.data = [[NSMutableArray alloc] initWithArray: data];
  ;
    
    // Configure tableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

//    self.buttonsCollectionViewLayout.layoutDelegete = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - ButtonsCollectionViewLayout Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(ButtonsCollectionViewLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(75, 30);
}

#pragma mark - Collection Delegate

#pragma mark - CollectionView Data Source

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseIdentifier = @"buttonsCollectionCell";
    ButtonsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: cellReuseIdentifier forIndexPath:indexPath];
    
    [cell.button setTitle:self.buttonsArray[indexPath.row] forState:UIControlStateNormal];
    
    // Set radius
    [cell.button.layer setCornerRadius:2];
    cell.button.layer.masksToBounds = YES;
    
    // Set border
    [cell.button.layer setBorderColor:[UIColor grayColor].CGColor];
    [cell.button.layer setBorderWidth:1.0];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.buttonsArray count];
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return 44;
            break;
        case 1:
            return 44;
            break;
        case 2:
            return 100;
            break;
        case 3:
            return 60;
            break;
        default:
            return 44;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionData = self.data[indexPath.section];
    NSInteger row = indexPath.row;
    NSDictionary *rowData = sectionData[row];
    
    if (row == 0) {
        
        static NSString *orderIdCellReuseIdentifier = @"orderIdCell";
        OrderIdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderIdCellReuseIdentifier forIndexPath:indexPath];
        cell.orderIdLabel.text = rowData[@"orderId"];
        cell.stateLabel.text = rowData[@"state"];
        return cell;
        
    } else if (row == 1) {
        
        static NSString *orderStateCellReuseIdentifier = @"orderStateCell";
        OrderStateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderStateCellReuseIdentifier forIndexPath:indexPath];
        cell.orderStateLabel.text = rowData[@"orderState"];
        return cell;
        
    } else if (row == 2) {
        
        static NSString *productInfoCellReuseIdentifier = @"productInfoCell";
        ProductInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productInfoCellReuseIdentifier forIndexPath:indexPath];
        cell.productImageView.image = [UIImage imageNamed: rowData[@"productImageName"]];
        cell.productNameLabel.text = rowData[@"productName"];
        cell.timeLabel.text = rowData[@"applyTime"];
        
        return cell;
    } else {
        
        static NSString *stateButtonsCellReuseIdentifier = @"stateButtonCell";
        StateButtonsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stateButtonsCellReuseIdentifier forIndexPath:indexPath];
        // Config the buttons
        [cell setCollectionViewDataSourceDelegate:self];
        CGFloat space = 10.0;
        CGFloat buttonWidth = 75.0;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat sumLength = (buttonWidth + space) * self.buttonsArray.count - space;
        if (sumLength <= screenWidth) {
            CGRect rect = CGRectMake(screenWidth - sumLength, 10, sumLength, 35);
            cell.collectionView.frame = rect;
        } else {
            [cell.collectionView setContentOffset:CGPointMake( self.buttonsArray.count * (buttonWidth + space) + space, 0)];
        }

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
