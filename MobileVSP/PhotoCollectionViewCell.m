//
//  PhotoCollectionViewCell.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/22.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *photoGestureReconizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPhoto)];
    [self.photoImageView addGestureRecognizer:photoGestureReconizer];
    
    // Set border
    [self.photoImageView.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.photoImageView.layer setBorderWidth:1.0];
}

- (IBAction)deletePhoto:(id)sender {
    self.deletePhotoBlock();
}

- (void)tapPhoto {
    self.showPhotoBlock();
}

@end
