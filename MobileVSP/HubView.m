//
//  HubView.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/25.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "HubView.h"

@implementation HubView

+ (instancetype)hubInView:(UIView *)view anmiated:(BOOL)animated {
    HubView *hubView = [[HubView alloc] initWithFrame:view.bounds];
    [hubView setOpaque:NO];
    
    [view addSubview:hubView];
//    [view setUserInteractionEnabled:NO];
    
    return hubView;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat boxWidth = 200;
    CGFloat boxHieght = 100;
    
    CGRect boxRect =CGRectMake((self.bounds.size.width - boxWidth) / 2,
                               (self.bounds.size.height - boxHieght) / 2,
                               boxWidth, boxHieght);
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:boxRect cornerRadius:10];
    [[UIColor colorWithWhite:0.3 alpha:0.8] setFill];
    [roundedRect fill];
    
    NSDictionary *attribs = @{NSFontAttributeName: [UIFont systemFontOfSize:16],
                         NSForegroundColorAttributeName: [UIColor whiteColor]};
    CGSize testSize = [self.text sizeWithAttributes:attribs];
    CGPoint testPoint = CGPointMake(self.center.x - (testSize.width / 2),
                                    self.center.y - (testSize.height / 2));
    [self.text drawAtPoint:testPoint withAttributes:attribs];
}

- (void)showAnimated:(BOOL)animated {
    if (animated) {
        [self setAlpha:0];
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:UIViewAnimationOptionTransitionNone animations:^{
            [self setAlpha:1];
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }
}

@end
