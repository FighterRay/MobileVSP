//
//  StateButtonsTableViewCell.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StateButtonsTableViewCell : UITableViewCell<UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)delegate;

@end
