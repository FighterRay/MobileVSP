//
//  PhotoPickerCollectionView.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/23.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZRFCollectionViewDelegate <NSObject>


- (void)zrfCollectionView:(UICollectionView *)collectionView willClickAddButtonAtIndexPath:(NSIndexPath *)indexPath;
- (void)zrfCollectionView:(UICollectionView *)collectionView didClickAddButtonAtIndexPath:(NSIndexPath *)indexPath;
- (void)zrfCollectionView:(UICollectionView *)collectionView deletePhotoAtIndexPath:(NSIndexPath *)indexPath;

@end

typedef void(^PickBlock)();
typedef void(^CompletionBlock)();

@interface PhotoPickerCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *photoArray;

@property (assign, nonatomic) CompletionBlock deleteCompletionBlock;
@property (assign, nonatomic) CompletionBlock showPhotoCompletionBlock;
@property (strong, nonatomic) UIImageView *showImgView;
@property (strong, nonatomic) UIView *grayBackgroundView;

@property (weak, nonatomic) id<ZRFCollectionViewDelegate> zrfDataSource;

- (void)showPhotoAtIndex:(NSUInteger)index completion:(CompletionBlock)completion;

@end
