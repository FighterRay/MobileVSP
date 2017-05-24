//
//  DeliveryCompanyPickerViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/24.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "DeliveryCompanyPickerViewController.h"
#import "DeliveryCompanyPickerCollectionViewCell.h"

@interface DeliveryCompanyPickerViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation DeliveryCompanyPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *data = @[@"圆通快递", @"邮政EMS", @"顺丰快递", @"韵达快递",
                      @"申通快递", @"全峰快递", @"天天快递", @"中通快递",
                      @"优速快递", @"德邦快递", @"国通快递", @"权益快递",
                      @"苏通快递", @"青岛快递", @"如风达", @"其他"];
    self.data = [NSMutableArray arrayWithArray:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *pickerCollectionCellReuseId = @"pickerCollectionViewCell";
    DeliveryCompanyPickerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pickerCollectionCellReuseId forIndexPath:indexPath];
    // Set radius
    [cell.pickerButton.layer setCornerRadius:2];
    cell.pickerButton.layer.masksToBounds = YES;
    
    // Set border
    [cell.pickerButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [cell.pickerButton.layer setBorderWidth:1.0];
    
    [cell.pickerButton setTitle: self.data[indexPath.row] forState: UIControlStateNormal];

    return cell;
}

#pragma mark - UICollectionView Delegate

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
