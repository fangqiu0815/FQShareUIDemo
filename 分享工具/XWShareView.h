//
//  XWShareView.h
//  zhangshangPacket
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ShareType) {
    ShareTypeSocial = 0, //社交分享
    ShareTypeSysterm     //系统
};

typedef void(^ShareResultBlock)(ShareType type,BOOL isSuccess);
@interface XWShareView : UIView
/**
 *  分享
 *
 *  @param content     @{@"text":@"",@"image":@[],@"url":@""}
 *  @param resultBlock 结果
 */
+ (void)showShareViewWithPublishContent:(id)content
                                 Result:(ShareResultBlock)resultBlock;
/**
 *  分享
 *
 *  @param content     @{@"text":@"",@"image":@[],@"url":@""}
 *  @param resultBlock 结果
 */
- (void)initPublishContent:(id)content
                    Result:(ShareResultBlock)resultBlock;

@property (nonatomic, strong) UIButton *cancleBtn;


@end
