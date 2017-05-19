//
//  ButtonsCollectionViewLayout.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/19.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "ButtonsCollectionViewLayout.h"

@interface ButtonsCollectionViewLayout ()

@property (assign, nonatomic) CGFloat leftY;
@property (assign, nonatomic) CGFloat rightY;
@property (assign, nonatomic) NSInteger cellCount;
@property (assign, nonatomic) CGFloat itemWidth;
@property (assign, nonatomic) CGFloat itemHieght;
@property (assign, nonatomic) CGFloat space;

@end

@implementation ButtonsCollectionViewLayout

-(void)prepareLayout {
    [super prepareLayout];
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
    self.space = 10;
    self.itemWidth = 75;
    self.itemHieght = 45;
}

-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.cellCount * (self.itemWidth + self.space) - self.space, self.itemHieght);
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    self.leftY = self.space;
    self.rightY = self.space;
    
    NSMutableArray *attributes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = [self.layoutDelegete collectionView:self.collectionView collectionViewLayout:self sizeOfItemAtIndexPath:indexPath];
    self.itemWidth = itemSize.width;
    self.itemHieght = itemSize.height;
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(self.space, self.leftY, self.itemWidth, self.itemHieght);
    self.leftY += self.itemWidth + self.space;
    
    return attributes;
}

@end
