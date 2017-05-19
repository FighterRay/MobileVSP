//
//  StateButtonsTableViewCell.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonsCollectionViewLayout.h"

@interface StateButtonsTableViewCell : UITableViewCell<UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet ButtonsCollectionViewLayout *buttonsCollectionViewLayout;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)delegate;
- (void)setButtonsCollectionViewLayoutDelegate:(id<ButtonsCollectionViewLayoutDelegate>)delegate;

@end
