//
//  StateButtonsTableViewCell.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "StateButtonsTableViewCell.h"

@implementation StateButtonsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置UICollectionView为横向滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    flowLayout.minimumLineSpacing = 5;
    flowLayout.itemSize = CGSizeMake(75, 30);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 10);
    
    self.collectionView.collectionViewLayout = flowLayout;
    
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)delegate {
    self.collectionView.dataSource = delegate;
    self.collectionView.delegate = delegate;
    [self.collectionView reloadData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
