//
//  SearchView.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/16.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CGRect rect = self.frame;
    rect.size.height = 35;
    self.frame = rect;
    
    UIImage *img = [UIImage imageNamed:@"search"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame = CGRectMake(5, 10, 30, 30);
    [imgView.layer setCornerRadius:5];
    [imgView.layer setMasksToBounds:YES];
    self.leftView = imgView;
    self.leftViewMode = UITextFieldViewModeAlways;
}


@end
