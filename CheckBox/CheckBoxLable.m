//
//  CheckBoxLable.m
//  CheckBox
//
//  Created by HeavenLi on 16/8/3.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "CheckBoxLable.h"

#define Space               5
#define LineWidth         2
#define CheckBoxColor   0.93,0.29,0.36,1.0

@interface CheckBoxLable()
{
    
    CGFloat width;
    CGFloat heigh;
    BOOL select;
    CGFloat checkBoxWidth;
    CGFloat checkBoxHight;
}

@property (nonatomic,assign) BOOL isSelect;
@property (nonatomic,strong) UILabel * protocolLable;
@end


@implementation CheckBoxLable

- (UILabel *)protocolLable
{
    if (!_protocolLable) {
        
        if (checkBoxWidth > 10 || checkBoxHight > 10) {
            checkBoxHight = 10;
            checkBoxWidth = 10;
        }
        
        _protocolLable = [[UILabel alloc] initWithFrame:CGRectMake(Space * 3 + checkBoxWidth, 0, width - (Space * 3 + checkBoxWidth), heigh)];
        _protocolLable.font = [UIFont systemFontOfSize:10];
        _protocolLable.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(protactLableTap:)];
        [_protocolLable addGestureRecognizer:tap];
    
    }
    return _protocolLable;
}


- (void)drawRect:(CGRect)rect {
    
    if (checkBoxWidth > 10 || checkBoxHight > 10) {
        checkBoxHight = 10;
        checkBoxWidth = 10;
    }
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画笔属性
    CGContextSetLineWidth(context, LineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    //先画矩形
    CGContextAddRect(context, CGRectMake(Space, Space, checkBoxWidth, checkBoxHight));
    
    if (self.isSelect) {
        //画对号
        CGContextMoveToPoint(context, Space + checkBoxWidth * 0.2, Space + checkBoxHight * 0.4);
        CGContextAddLineToPoint(context, Space + checkBoxWidth * 0.38, Space + checkBoxHight * 0.7);
        CGContextAddLineToPoint(context, Space + checkBoxWidth * 0.85 , Space + checkBoxHight * 0.26 );
    }
   
    
    CGContextSetRGBStrokeColor(context,CheckBoxColor);
    
    CGContextStrokePath(context);
    
    
}

- (id)initWithFrame:(CGRect)frame Protocol:(NSString *)text NormalTextColor:(UIColor *)normalColor ProtocolTextColor:(UIColor *)protocolColor
{
    
    self = [super initWithFrame: frame];
    
    if (self) {
        
        select = NO;
        width = frame.size.width;
        heigh = frame.size.height;
        checkBoxWidth = heigh - 2 *Space;
        checkBoxHight = heigh - 2 *Space;
        
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        
        //添加协议文字
        [self addSubview:self.protocolLable];
        NSString * protocolStr = [NSString stringWithFormat:@"已阅读 %@",text];
        NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:protocolStr];
        [attriStr addAttributes:@{NSForegroundColorAttributeName:normalColor} range:NSMakeRange(0, 3)];
        [attriStr addAttributes:@{NSForegroundColorAttributeName:protocolColor} range:NSMakeRange(4, protocolStr.length - 4)];
        self.protocolLable.attributedText = attriStr;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
    
}
#pragma MARK 用户交互

- (void)protactLableTap:(UITapGestureRecognizer *)tap
{
    [self.delegate tapProtocol];
}

- (void)tapClick:(UITapGestureRecognizer *)tap
{
    //选中
    if (select) {
        
        self.isSelect = NO;
        select = NO;
        [self.delegate isAgreeProtocol:NO];
        
    }else{
        
        self.isSelect = YES;
        select = YES;
        [self.delegate isAgreeProtocol:YES];
        
    }
   
    [self setNeedsDisplay];
}


@end
