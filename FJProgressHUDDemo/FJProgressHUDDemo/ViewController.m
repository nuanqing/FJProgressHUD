//
//  ViewController.m
//  FJProgressHUDDemo
//
//  Created by MacBook on 2018/2/5.
//  Copyright © 2018年 nuanqing. All rights reserved.
//

#import "ViewController.h"
#import "FJProgressHUD.h"
#import "FJProgressHUDConfig.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,strong) NSMutableArray *imagesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FJProgressHUD *hud = [FJProgressHUD showLoadingIndicatorText:@"正在加载中..." toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
    }else if (indexPath.row == 1){
        FJProgressHUD *hud = [FJProgressHUD showLoadingCircleText:@"正在加载中..." toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
    }else if (indexPath.row == 2){
        FJProgressHUD *hud = [FJProgressHUD showProgressCircleText:@"当前进度..." toView:self.view];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //异步加载进度
            CGFloat progress = 0;
            
            while (progress < 1) {
                
                progress += 0.01;
                dispatch_async(dispatch_get_main_queue(), ^{
                    //回到主线程绘制
                    hud.progress = progress;
                });
                [NSThread sleepForTimeInterval:0.01];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [hud dismiss];
            });
        });
        
    }else if (indexPath.row == 3){
        [FJProgressHUD showSuccessText:@"成功" toView:self.view];
    }else if (indexPath.row == 4){
        [FJProgressHUD showFailText:@"失败" toView:self.view];
    }else if (indexPath.row == 5){
        NSArray *array = @[@"image01"];
        FJProgressHUD *hud = [FJProgressHUD showCustomText:@"加载中..." images:array toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
        
    }else if (indexPath.row == 6){
        FJProgressHUD *hud = [FJProgressHUD showCustomText:@"加载中..." images:self.imagesArray toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
    }else if (indexPath.row == 7){
        FJProgressHUD *hud = [FJProgressHUD showCustomText:@"加载中..." images:self.imagesArray width:300 height:200 toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
    }else if (indexPath.row == 8){
        [FJProgressHUD showOnlyText:@"文本信息" toView:self.view];
    }else if (indexPath.row == 9){
        FJProgressHUD *hud = [FJProgressHUD showOnlyHUDOrCustom:FJProgressHUDCustom images:self.imagesArray toView:self.view];
        
        //如果不是自定义的方式，images传nil即可(可以自己在定义一个类只显示HUD灵活使用)
        //FJProgressHUD *hud = [FJProgressHUD showOnlyHUDOrCustom:FJProgressHUDStatusFail images:nil toView:self.view];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - 懒加载

- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"LoadingIndicator",@"LoadingCircle",@"ProgressCircle",@"Success",@"Fail",@"CustomOneImage",@"CustomImages",@"CustomWidthAndHeight",@"OlnyText",@"OnlyHUDOrCustom", nil];
    }
    return _dataArray;
}

- (NSMutableArray *)imagesArray{
    if (!_imagesArray) {
        _imagesArray = [NSMutableArray array];
        for (int i = 1; i<31; i++) {
            [_imagesArray addObject:[NSString stringWithFormat:@"image%02d",i]];
        }
    }
    return _imagesArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:FJMainScreenBounds];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.estimatedRowHeight = 50;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

