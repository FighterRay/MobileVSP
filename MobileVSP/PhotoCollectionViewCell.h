//
//  PhotoCollectionViewCell.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/22.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DeletePhotoBlock)();
typedef void(^ShowPhotoBlock)();

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (copy, nonatomic) DeletePhotoBlock deletePhotoBlock;
@property (copy, nonatomic) ShowPhotoBlock showPhotoBlock;

@end
