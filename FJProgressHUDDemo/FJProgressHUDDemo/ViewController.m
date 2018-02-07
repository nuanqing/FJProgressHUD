//
//  ViewController.m
//  FJProgressHUDDemo
//
//  Created by MacBook on 2018/2/5.
//  Copyright © 2018年 nuanqing. All rights reserved.
//

#import "ViewController.h"
#import "FJProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FJProgressHUD *hud = [FJProgressHUD progressHUD];
    hud.text = @"正在加载....";
    hud.animationType = FJProgressHUDAnimationSpring;
    hud.styleType = FJProgressHUDStyleLight;
    hud.maskType = FJProgressHUDMaskTypeClear;
    hud.showType = FJProgressHUDProgressCircle;
    [hud showToView:self.view];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGFloat progress = 0;
        
        while (progress < 1) {
            
            progress += 0.01;
            dispatch_async(dispatch_get_main_queue(), ^{
                //refresh progress-value on main thread
                hud.progress = progress;
            });
            [NSThread sleepForTimeInterval:0.01];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [hud dismiss];
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
