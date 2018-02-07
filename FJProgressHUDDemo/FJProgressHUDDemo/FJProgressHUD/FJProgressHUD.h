//
//  FJProgressHUD.h
//  FJProgressHUDDemo
//
//  Created by MacBook on 2018/2/5.
//  Copyright © 2018年 nuanqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJProgressHUD;

typedef NS_ENUM(NSUInteger, FJProgressHUDShowType) {
    FJProgressHUDLoadingIndicator = 0,//加载(指示器)
    FJProgressHUDLoadingCircle = 1,//加载（圆环）
    FJProgressHUDProgressCircle = 2,//进度(圆饼)
    FJProgressHUDStatusSuccess = 3,//状态(成功)
    FJProgressHUDStatusFail = 4//状态(失败)
};

typedef NS_ENUM(NSUInteger, FJProgressHUDModeType) {
    FJProgressHUDModeHud = 0,//显示所有
    FJProgressHUDModeOnlyText = 1,//只显示文本
    FJProgressHUDModeOnlyHud = 2,//不显示文本
    FJProgressHUDModeCustom =3 //自定义
};

typedef NS_ENUM(NSUInteger, FJProgressHUDAnimationType) {
    FJProgressHUDAnimationNormal = 0,//普通效果
    FJProgressHUDAnimationSpring = 1//弹簧效果
};

typedef NS_ENUM(NSInteger, FJProgressHUDStyleType) {
    FJProgressHUDStyleDark = 0,//背景颜色Dark
    FJProgressHUDStyleLight = 1//背景颜色Light
};

typedef NS_ENUM(NSInteger, FJProgressHUDMaskType) {
    FJProgressHUDMaskTypeNone = 0,//没有遮罩
    FJProgressHUDMaskTypeClear = 1,//透明遮罩
    FJProgressHUDMaskTypeGray = 2//灰色遮罩
};


@interface FJProgressHUD : UIView

@property (nonatomic,assign) FJProgressHUDShowType showType;

@property (nonatomic,assign) FJProgressHUDModeType modeType;

@property (nonatomic,assign) FJProgressHUDAnimationType animationType;

@property (nonatomic,assign) FJProgressHUDStyleType styleType;

@property (nonatomic,assign) FJProgressHUDMaskType maskType;

@property (nonatomic,copy) NSString *text;

@property (nonatomic,copy) NSArray *images;

@property (nonatomic,assign) CGFloat progress;

//结束时间
@property (nonatomic,assign) CGFloat dissmissTime;

#pragma mark - init

+(instancetype)progressHUD;

#pragma mark - show

+ (FJProgressHUD *)showLoadingIndicatorText:(NSString *)text toView:(UIView *)view;

+ (FJProgressHUD *)showLoadingCircleText:(NSString *)text toView:(UIView *)view;

+ (FJProgressHUD *)showProgressCircleText:(NSString *)text toView:(UIView *)view;

+ (void)showSuccessText:(NSString *)text toView:(UIView *)view;

+ (void)showFailText:(NSString *)text toView:(UIView *)view;

+ (FJProgressHUD *)showCustomText:(NSString *)text images:(NSArray *)iamges width:(CGFloat)width height:(CGFloat)height toView:(UIView *)view;

+(void)showOnlyText:(NSString *)text toView:(UIView *)view;

- (void)setCustomText:(NSString *)text images:(NSArray *)iamges width:(CGFloat)width height:(CGFloat)height;


- (void)showToView:(UIView *)view;

#pragma mark - dismiss

- (void)dismiss;

@end
