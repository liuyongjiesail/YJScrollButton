//
//  YJScrollViewController.m
//  ScrollButton
//
//  Created by 刘永杰 on 16/6/12.
//  Copyright © 2016年 刘永杰. All rights reserved.
//

#import "YJScrollViewController.h"
#import "YJScrollButton.h"

#define kScrollButtonHeight 50

@interface YJScrollViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) YJScrollButton *scrollButton;
@property (strong, nonatomic) UIScrollView *backScrollView;

@end

@implementation YJScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubViews];

}

- (void)setupSubViews
{
    //按钮
    self.scrollButton = [[YJScrollButton alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScrollButtonHeight)];
//    self.scrollButton.backgroundColor = [UIColor lightGrayColor];
    self.scrollButton.titleArray = @[@"于", @"滢", @"heheda"].mutableCopy;
    self.scrollButton.normalColor = [UIColor blackColor];
    self.scrollButton.selectColor = [UIColor redColor];
    //属性设置完毕以后，加载子视图
    [self.scrollButton p_setupViews];
    [self.view addSubview:self.scrollButton];
    
    //底层控制滑动
    self.backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + kScrollButtonHeight, kScreenWidth, kScreenHeight - 64 - kScrollButtonHeight)];
    self.backScrollView.contentSize = CGSizeMake(kScreenWidth * self.scrollButton.titleArray.count, kScreenHeight - 65 - 50);
    self.backScrollView.pagingEnabled = YES;
    self.backScrollView.delegate = self;
    [self.view addSubview:self.backScrollView];
    
    //循环创建tableview
    for (int i = 0; i < self.scrollButton.titleArray.count; i++) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight - 64 - kScrollButtonHeight)];
        tableView.backgroundColor = [UIColor colorWithRed:arc4random() % 255/255.0 green:arc4random() % 255/ 255.0 blue:arc4random() % 255/255.0 alpha:1];
        tableView.tag = 200 + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.backScrollView addSubview:tableView];
    }
    
    __weak typeof(self) weakSelf = self;
    //点击按钮切换tableview
    self.scrollButton.passButton = ^(NSInteger number){
        
        weakSelf.backScrollView.contentOffset = CGPointMake(kScreenWidth * number, 0);
    };
}

//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
//cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
//底层scrollview滑动代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger number = scrollView.contentOffset.x / kScreenWidth;
    
    [self.scrollButton buttonClick:number + 100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
