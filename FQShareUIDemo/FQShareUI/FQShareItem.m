//
//  FQShareItem.m
//  FQShareUIDemo
//
//  Created by apple-gaofangqiu on 2017/9/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import "FQShareItem.h"
#import <Social/Social.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h>

NSString *const  FQPlatformNameSina = @"FQPlatformNameSina";
NSString *const  FQPlatformNameQQ = @"FQPlatformNameQQ";
NSString *const  FQPlatformNameEmail = @"FQPlatformNameEmail";
NSString *const  FQPlatformNameSms = @"FQPlatformNameSms";
NSString *const  FQPlatformNameWechat = @"FQPlatformNameWechat";
NSString *const  FQPlatformNameAlipay = @"FQPlatformNameAlipay";
//NSString *const  FQPlatformNameTwitter = @"FQPlatformNameTwitter";
//NSString *const  FQPlatformNameFacebook = @"FQPlatformNameFacebook";
//NSString *const  FQPlatformNameInstagram = @"FQPlatformNameInstagram";
//NSString *const  FQPlatformNameNotes = @"FQPlatformNameNotes";
//NSString *const  FQPlatformNameReminders = @"FQPlatformNameReminders";
//NSString *const  FQPlatformNameiCloud = @"FQPlatformNameiCloud";


NSString *const  FQPlatformHandleSina = @"FQPlatformHandleSina";
NSString *const  FQPlatformHandleQQ = @"FQPlatformHandleQQ";
NSString *const  FQPlatformHandleEmail = @"FQPlatformHandleEmail";
NSString *const  FQPlatformHandleSms = @"FQPlatformHandleSms";
NSString *const  FQPlatformHandleWechat = @"FQPlatformHandleWechat";
NSString *const  FQPlatformHandleAlipay = @"FQPlatformHandleAlipay";
NSString *const  FQPlatformHandleTwitter = @"FQPlatformHandleTwitter";
NSString *const  FQPlatformHandleFacebook = @"FQPlatformHandleFacebook";
NSString *const  FQPlatformHandleInstagram = @"FQPlatformHandleInstagram";
NSString *const  FQPlatformHandleNotes = @"FQPlatformHandleNotes";
NSString *const  FQPlatformHandleReminders = @"FQPlatformHandleReminders";
NSString *const  FQPlatformHandleiCloud = @"FQPlatformHandleiCloud";

@interface FQShareItem()<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@end

@implementation FQShareItem

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title action:(shareHandle)action
{
    NSParameterAssert(title.length || image);
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _action = action;
        
        
    }
    return self;
    
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title actionName:(NSString *)actionName
{
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _action = [self actionFromString:actionName];
    }
    return self;

}

- (instancetype)initWithPlatformName:(NSString *)platformName{
    
    /******************************各种平台***********************************************/
    NSDictionary *messageDict;
    if ([platformName isEqualToString:FQPlatformNameSina]) {
        messageDict = @{@"image":@"share_sina",@"title":@"新浪微博",@"action":FQPlatformHandleSina};
    }
    if ([platformName isEqualToString:FQPlatformNameQQ]) {
        messageDict = @{@"image":@"share_qq",@"title":@"QQ",@"action":FQPlatformHandleQQ};
    }
    if ([platformName isEqualToString:FQPlatformNameEmail]) {
        messageDict = @{@"image":@"share_email",@"title":@"邮件",@"action":FQPlatformHandleEmail};
    }
    if ([platformName isEqualToString:FQPlatformNameSms]) {
        messageDict = @{@"image":@"share_sms",@"title":@"短信",@"action":FQPlatformHandleSms};
    }
    if ([platformName isEqualToString:FQPlatformNameWechat]) {
        messageDict = @{@"image":@"share_weixin",@"title":@"微信",@"action":FQPlatformHandleWechat};
    }
    if ([platformName isEqualToString:FQPlatformNameAlipay]) {
        messageDict = @{@"image":@"share_alipay",@"title":@"支付宝",@"action":FQPlatformHandleAlipay};
    }
    
    /*********************************end************************************************/
    
    self = [super init];
    if (self) {
        _title = (messageDict[@"title"] ? messageDict[@"title"] : @"");
        _image = [UIImage imageNamed:[@"FQShareUIImage.bundle" stringByAppendingPathComponent:messageDict[@"image"]]];
        _action = [self actionFromString:messageDict[@"action"]];
    }
    return self;
}

#pragma mark - 私有方法

//字符串转 Block
- (shareHandle)actionFromString:(NSString *)handleName{
    
    shareHandle handle = ^(FQShareItem *item){
        NSString *tipPlatform;
        if ([handleName isEqualToString:FQPlatformHandleEmail]) {
            [self sendmailTO:@""];
            return ;
        }
        if ([handleName isEqualToString:FQPlatformHandleSms]) {
            [self sendMessageTO:@""];
            return ;
        }
        /******************************各种平台***********************************************/
        NSString *platformID;
        if ([handleName isEqualToString:FQPlatformHandleSina]) {
            platformID = @"com.apple.share.SinaWeibo.post";
            tipPlatform = @"新浪微博";
        }
        if ([handleName isEqualToString:FQPlatformHandleQQ]) {
            platformID = @"com.tencent.mqq.ShareExtension";
            tipPlatform = @"QQ";
        }
        if ([handleName isEqualToString:FQPlatformHandleWechat]) {
            platformID = @"com.tencent.xin.sharetimeline";
            tipPlatform = @"微信";
        }
        if ([handleName isEqualToString:FQPlatformHandleAlipay]) {
            platformID = @"com.alipay.iphoneclient.ExtensionSchemeShare";
            tipPlatform = @"支付宝";
        }
        if ([handleName isEqualToString:FQPlatformHandleTwitter]) {
            platformID = @"com.apple.share.Twitter.post";
            tipPlatform = @"推特";
        }
        if ([handleName isEqualToString:FQPlatformHandleFacebook]) {
            platformID = @"com.apple.share.Facebook.post";
            tipPlatform = @"脸书";
        }
        if ([handleName isEqualToString:FQPlatformHandleInstagram]) {
            platformID = @"com.burbn.instagram.shareextension";
            tipPlatform = @"instagram";
        }
        if ([handleName isEqualToString:FQPlatformHandleNotes]) {
            platformID = @"com.apple.mobilenotes.SharingExtension";
            tipPlatform = @"备忘录";
        }
        if ([handleName isEqualToString:FQPlatformHandleReminders]) {
            platformID = @"com.apple.reminders.RemindersEditorExtension";
            tipPlatform = @"提醒事项";
        }
        if ([handleName isEqualToString:FQPlatformHandleiCloud]) {
            platformID = @"com.apple.mobileslideshow.StreamShareService";
            tipPlatform = @"iCloud";
        }
        
        /********************************end*************************************************/
        
        NSString *UNLoginTip = [NSString stringWithFormat:@"没有配置%@相关的帐号",tipPlatform];
        NSString *UNInstallTip = [NSString stringWithFormat:@"没有安装%@",tipPlatform];
        
        SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:platformID];
        if (composeVc == nil){
            ALERT_MSG(@"提示",UNInstallTip,_presentVC);
            return;
        }
        if (![SLComposeViewController isAvailableForServiceType:platformID]) {
            ALERT_MSG(@"提示",UNLoginTip,_presentVC);
            return;
        }
        if (_shareText) [composeVc setInitialText:_shareText];
        if (_shareImage) [composeVc addImage:_shareImage];
        if (_shareUrl) [composeVc addURL:_shareUrl];
        
        [_presentVC presentViewController:composeVc animated:YES completion:nil];
        composeVc.completionHandler = ^(SLComposeViewControllerResult result){
            if (result == SLComposeViewControllerResultCancelled) {
                NSLog(@"点击了取消");
            } else {
                NSLog(@"点击了发送");
            }
        };
        
    };
    return handle;
}

- (void)sendmailTO:(NSString *)email
{
    if (![MFMailComposeViewController canSendMail]) {
        ALERT_MSG(@"提示",@"手机未设置邮箱",_presentVC);
        return;
    }
    
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    [controller setToRecipients:@[email]];
    if (_shareText) {
        [controller setSubject:_shareText];
    }
    if (_shareUrl) {
        [controller setMessageBody:[NSString stringWithFormat:@"%@",_shareUrl] isHTML:YES];
    }
    if (_shareImage) {
        NSData *imageData = UIImagePNGRepresentation(_shareImage);
        [controller addAttachmentData:imageData mimeType:@"image/png" fileName:@"图片.png"];
    }
    
    [controller setMailComposeDelegate:self];
    
    [_presentVC presentViewController:controller animated:YES completion:nil];
}
- (void)sendMessageTO:(NSString *)phoneNum{
    
    if(![MFMessageComposeViewController canSendText] ){
        ALERT_MSG(@"提示",@"设备不能发短信",_presentVC);
        return;
    }
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    [controller setRecipients:@[phoneNum]];
    NSString *bodySting = @"";
    if (_shareText) [bodySting stringByAppendingString:_shareText];
    if (_shareUrl) [bodySting stringByAppendingString:[NSString stringWithFormat:@"%@",_shareUrl]];
    controller.messageComposeDelegate =self;
    
    [_presentVC presentViewController:controller animated:YES completion:nil];;
    
}

#pragma mark - 邮件、短息代理方法

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [_presentVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [_presentVC dismissViewControllerAnimated:YES completion:nil];
}
























@end
