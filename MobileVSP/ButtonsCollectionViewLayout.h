//
//  ButtonsCollectionViewLayout.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/19.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonsCollectionViewLayout;

@protocol ButtonsCollectionViewLayoutDelegate <NSObject>

@required
- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(ButtonsCollectionViewLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ButtonsCollectionViewLayout : UICollectionViewLayout

@property (weak, nonatomic) id<ButtonsCollectionViewLayoutDelegate>layoutDelegete;

@end
