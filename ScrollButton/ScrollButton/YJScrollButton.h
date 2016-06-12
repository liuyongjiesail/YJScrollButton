//
//  YJScrollButton.h
//  ScrollButton
//
//  Created by 刘永杰 on 16/6/12.
//  Copyright © 2016年 刘永杰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^passButton)(NSInteger);

@interface YJScrollButton : UIView

@property (strong, nonatomic) NSMutableArray *titleArray;
@property (strong, nonatomic) NSMutableArray *imageArray;

@property (copy, nonatomic) passButton passButton;

@property (strong, nonatomic) UIColor *normalColor;   //title颜色
@property (strong, nonatomic) UIColor *selectColor;   //title选中颜色
@property (assign, nonatomic) BOOL showLine;   //是否显示底层滚动条

@property (strong, nonatomic) UIButton *saveButton;  //默认选中

- (void)buttonClick:(NSInteger)buttonNumber;
//加载视图
- (void)p_setupViews;

@end
