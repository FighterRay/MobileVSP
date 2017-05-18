//
//  ProductInfoTableViewCell.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
