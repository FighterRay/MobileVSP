//
//  UICollectionView+IndexPathInTableView.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/25.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "UICollectionView+IndexPathInTableView.h"

static NSString *indexPathInTableViewKey = @"indexPathInTableViewKey";

@implementation UICollectionView (IndexPathInTableView)

- (void)setIndexPathInTableView:(NSIndexPath *)indexPathInTableView {
    objc_setAssociatedObject(self, &indexPathInTableViewKey, indexPathInTableView, OBJC_ASSOCIATION_RETAIN);
}

- (NSIndexPath *)indexPathInTableView {
    return objc_getAssociatedObject(self, &indexPathInTableViewKey);
}

@end
