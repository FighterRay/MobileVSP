//
//  ApplyButton.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/17.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "ApplyButton.h"

@implementation ApplyButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Set radius
    [self.layer setCornerRadius:2];
    self.layer.masksToBounds = YES;
    
    // Set border
    [self.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.layer setBorderWidth:1.0];
}

@end
