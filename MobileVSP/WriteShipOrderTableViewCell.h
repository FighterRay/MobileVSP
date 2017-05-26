//
//  WriteShipOrderTableViewCell.h
//  MobileVSP
//
//  Created by FighterRay on 2017/5/24.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletionTextInputBlock)();

@interface WriteShipOrderTableViewCell : UITableViewCell <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) CompletionTextInputBlock compeletionTextFieldBlock;

@end
