//
//  SearchViewController.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/16.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;

@end
