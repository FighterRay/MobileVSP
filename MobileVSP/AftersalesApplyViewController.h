//
//  AftersalesApplyViewController.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoPickerCollectionView.h"

@interface AftersalesApplyViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *buttonsArray;
@property (strong, nonatomic) NSMutableArray *photoArray;
@property (weak, nonatomic) IBOutlet PhotoPickerCollectionView *photoPickerCollectionView;

@end
