//
//  YJScrollButton.m
//  ScrollButton
//
//  Created by 刘永杰 on 16/6/12.
//  Copyright © 2016年 刘永杰. All rights reserved.
//

#define kButtonCount self.titleArray.count
#define kButtonWidth kScreenWidth/kButtonCount
#define kButtonHeight 48
#define kLineHeight 2

#import "YJScrollButton.h"

@interface YJScrollButton ()

@property (strong, nonatomic) UIView *lineView;

@end

@implementation YJScrollButton

- (void)p_setupViews
{
    
    for (int i = 0; i < self.titleArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * kButtonWidth, 0, kButtonWidth, kButtonHeight);
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:self.normalColor forState:UIControlStateNormal];
        [button setTitleColor:self.selectColor forState:UIControlStateSelected];
        button.tag = 100 + i;
        [self addSubview:button];
        
    }
    
    self.saveButton = (UIButton *)[self viewWithTag:100];
    self.saveButton.selected = YES;
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kButtonHeight, kButtonWidth, kLineHeight)];
    self.lineView.backgroundColor = self.selectColor;
    [self addSubview:self.lineView];
    
}

- (void)buttonAction:(UIButton *)sender
{
    if (self.saveButton != sender) {
        
        sender.selected = !sender.selected;
        self.saveButton.selected = !self.saveButton.selected;
        self.saveButton = sender;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
       
        self.lineView.frame = CGRectMake((sender.tag - 100) * kButtonWidth, kButtonHeight,kButtonWidth, kLineHeight);
        
    }];
    
    self.passButton(sender.tag - 100);
}

- (void)buttonClick:(NSInteger)buttonNumber
{
    [self buttonAction:[self viewWithTag:buttonNumber]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
