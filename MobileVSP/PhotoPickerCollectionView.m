//
//  PhotoPickerCollectionView.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/23.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "PhotoPickerCollectionView.h"
#import "AddButtonCollectionViewCell.h"
#import "PhotoCollectionViewCell.h"

@implementation PhotoPickerCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dataSource = self;
}

- (void)showPhotoAtIndex:(NSUInteger)index completion:(CompletionBlock)completion {
    CGRect screenFrame = UIScreen.mainScreen.bounds;
    self.grayBackgroundView = [[UIView alloc] initWithFrame:screenFrame];
    self.grayBackgroundView.backgroundColor = [UIColor grayColor];
    self.grayBackgroundView.alpha = 0.5;
    self.grayBackgroundView.userInteractionEnabled = YES;
    
    self.showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, screenFrame.size.width, screenFrame.size.width)];
    self.showImgView.userInteractionEnabled = YES;
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self.grayBackgroundView];
    
    self.showImgView.image = self.photoArray[index];
    [keyWindow addSubview:self.showImgView];
    
    UITapGestureRecognizer *gestureReconizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPhoto)];
    [self.grayBackgroundView addGestureRecognizer:gestureReconizer];
    
    //completion
    self.showPhotoCompletionBlock = completion;
    self.showPhotoCompletionBlock();
}

- (void)dismissPhoto {
    [self.grayBackgroundView removeFromSuperview];
    [self.showImgView removeFromSuperview];
}

#pragma mark - Collection view data source

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *photoCollectionCellReuseId = @"photoCollectionViewCell";
    static NSString *addButtonCollectionCellReuseId = @"addButtonCollectionViewCell";
    if (indexPath.row == [self.photoArray count]) {
        AddButtonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:addButtonCollectionCellReuseId forIndexPath:indexPath];
        cell.fetchPhotoBlock = ^() {
            [self.zrfDataSource zrfCollectionView:self willClickAddButtonAtIndexPath:indexPath];
            [self.zrfDataSource zrfCollectionView:self didClickAddButtonAtIndexPath:indexPath];
        };
        return cell;
    } else {
        PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCollectionCellReuseId forIndexPath:indexPath];
        cell.photoImageView.image = self.photoArray[indexPath.row];
        cell.deletePhotoBlock = ^(){
            [self.zrfDataSource zrfCollectionView:self deletePhotoAtIndexPath:indexPath];
        };
        cell.showPhotoBlock = ^() {
            [self showPhotoAtIndex:indexPath.row completion:nil];
        };
        return cell;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photoArray count] + 1;
}

@end
