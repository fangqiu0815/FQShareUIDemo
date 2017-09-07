//
//  FQShareItem.h
//  FQShareUIDemo
//
//  Created by apple-gaofangqiu on 2017/9/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

/** 弹窗的信息 */
#define  ALERT_MSG(TITLE,MESSAGE,CONTROLLER) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:TITLE message:MESSAGE preferredStyle:UIAlertControllerStyleAlert];\
[alertController addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:nil]];\
[CONTROLLER presentViewController:alertController animated:YES completion:nil];

/** 自定义颜色 */
#define CUSTOMCOLOR(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@class FQShareItem;
typedef void (^__nullable shareHandle)(FQShareItem *item);


//预制的分享平台
extern NSString *const  FQPlatformNameSina;// 新浪微博
extern NSString *const  FQPlatformNameQQ;//QQ
extern NSString *const  FQPlatformNameEmail;//邮箱
extern NSString *const  FQPlatformNameSms;//短信
extern NSString *const  FQPlatformNameWechat;//微信
extern NSString *const  FQPlatformNameAlipay;//支付宝

/******************************没有图片、待补充***********************************************/
//extern NSString *const  FQPlatformNameTwitter;//推特
//extern NSString *const  FQPlatformNameFacebook;//脸书
//extern NSString *const  FQPlatformNameInstagram;//instagram
//extern NSString *const  FQPlatformNameNotes;//备忘录
//extern NSString *const  FQPlatformNameReminders;//提醒事项
//extern NSString *const  FQPlatformNameiCloud;//iCloud


//预制的分享事件
extern NSString *const  FQPlatformHandleSina;// 新浪微博
extern NSString *const  FQPlatformHandleQQ;//QQ
extern NSString *const  FQPlatformHandleEmail;//邮箱
extern NSString *const  FQPlatformHandleSms;//短信
extern NSString *const  FQPlatformHandleWechat;//微信
extern NSString *const  FQPlatformHandleAlipay;//支付宝
extern NSString *const  FQPlatformHandleTwitter;//推特
extern NSString *const  FQPlatformHandleFacebook;//脸书
extern NSString *const  FQPlatformHandleInstagram;//instagram
extern NSString *const  FQPlatformHandleNotes;//备忘录
extern NSString *const  FQPlatformHandleReminders;//提醒事项
extern NSString *const  FQPlatformHandleiCloud;//iCloud



@interface FQShareItem : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, weak) UIViewController *presentVC;
@property (nonatomic, copy) shareHandle action;
@property (nullable, nonatomic, strong) NSString *shareText;
@property (nullable, nonatomic, strong) UIImage *shareImage;
@property (nullable, nonatomic, strong) NSURL *shareUrl;


- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                       action:(shareHandle)action;

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                   actionName:(NSString *)actionName;

- (instancetype)initWithPlatformName:(NSString *)platformName;


@end


NS_ASSUME_NONNULL_END
