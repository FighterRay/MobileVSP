//
//  WriteShipOrderViewController.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/24.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteShipOrderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *hintsLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) NSMutableArray *data;

@end
