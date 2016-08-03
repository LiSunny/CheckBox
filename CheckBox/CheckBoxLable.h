//
//  CheckBoxLable.h
//  CheckBox
//
//  Created by HeavenLi on 16/8/3.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckBoxLableDelegate <NSObject>

- (void)isAgreeProtocol:(BOOL)isAgree;

- (void)tapProtocol;

@end

@interface CheckBoxLable : UILabel

@property (nonatomic,weak) id <CheckBoxLableDelegate> delegate;

- (id)initWithFrame:(CGRect)frame Protocol:(NSString *)text NormalTextColor:(UIColor *)normalColor ProtocolTextColor:(UIColor *)protocolColor;

@end
