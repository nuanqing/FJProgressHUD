# FJProgressHUD
HUD加载提示

>
>一款加载提示控件，可以加载动画，支持自定义
>

![效果图](https://github.com/nuanqing/FJProgressHUD/blob/master/FJProgressHUDDemo/hud.gif)

使用方法
-------
```
//加载(指示器)
 FJProgressHUD *hud = [FJProgressHUD showLoadingIndicatorText:@"正在加载中..." toView:self.view];
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 [hud dismiss];
 });
 
//加载（圆环）
 FJProgressHUD *hud = [FJProgressHUD showLoadingCircleText:@"正在加载中..." toView:self.view];
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 [hud dismiss];
 });
 
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
 
//成功
 [FJProgressHUD showSuccessText:@"成功" toView:self.view];
 
//失败
 [FJProgressHUD showFailText:@"失败" toView:self.view];
 
 //单张图片
 NSArray *array = @[@"image01"];
 FJProgressHUD *hud = [FJProgressHUD showCustomText:@"加载中..." images:array toView:self.view];
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 [hud dismiss];
 });
 
 //多张图
 FJProgressHUD *hud = [FJProgressHUD showCustomText:@"加载中..." images:self.imagesArray toView:self.view];
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 [hud dismiss];
 });
 
 //自定义
 FJProgressHUD *hud = [FJProgressHUD showCustomText:@"加载中..." images:self.imagesArray width:300 height:200 toView:self.view];
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 [hud dismiss];
 });
 
 //文本信息
 [FJProgressHUD showOnlyText:@"文本信息" toView:self.view];
 
 //只有HUD
 FJProgressHUD *hud = [FJProgressHUD showOnlyHUDOrCustom:FJProgressHUDCustom images:self.imagesArray toView:self.view];
 
 //如果不是自定义的方式，images传nil即可(可以自己在定义一个类只显示HUD灵活使用)
 //FJProgressHUD *hud = [FJProgressHUD showOnlyHUDOrCustom:FJProgressHUDStatusFail images:nil toView:self.view];
 
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 [hud dismiss];
 });
 ```
