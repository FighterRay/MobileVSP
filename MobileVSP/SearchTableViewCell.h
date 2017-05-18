//
//  SearchTableViewCell.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/16.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *applyButton;

@end
