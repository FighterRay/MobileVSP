//
//  AddButtonCollectionViewCell.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/22.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FetchPhotoBlock)();

@interface AddButtonCollectionViewCell : UICollectionViewCell

@property (copy, nonatomic) FetchPhotoBlock fetchPhotoBlock;

@end
