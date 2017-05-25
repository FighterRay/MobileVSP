//
//  HubView.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/25.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HubView : UIView

@property (strong, nonatomic) NSString *text;

+ (instancetype)hubInView:(UIView *)view anmiated:(BOOL)animated;

@end
