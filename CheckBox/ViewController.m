//
//  ViewController.m
//  CheckBox
//
//  Created by HeavenLi on 16/8/3.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "ViewController.h"
#import "CheckBoxLable.h"


@interface ViewController ()<CheckBoxLableDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CheckBoxLable * checkBox = [[CheckBoxLable alloc] initWithFrame:CGRectMake(20, 64, CGRectGetWidth(self.view.frame) - 40, 20) Protocol:@"<收付宝证书开发协议>" NormalTextColor:[UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00] ProtocolTextColor:[UIColor colorWithRed:0.93 green:0.29 blue:0.36 alpha:1.00]];
    checkBox.delegate = self;

    [self.view addSubview:checkBox];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma MARK CheckBoxLableDelegate
- (void)isAgreeProtocol:(BOOL)isAgree
{
    
    NSString * str;
    if (isAgree) {
        str = @"已经勾选协议";
    }else{
        str = @"还未勾选协议";
    }
    NSLog(@"%@",str);
    
}
- (void)tapProtocol
{
    NSLog(@"查看协议");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
