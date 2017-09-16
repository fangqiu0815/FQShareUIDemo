//
//  ViewController.m
//  FQShareUIDemo
//
//  Created by apple-gaofangqiu on 2017/9/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import "ViewController.h"
#import "FQShareView.h"
#import "ZYShareView.h"


@interface ViewController ()

@property(nonatomic, strong) NSMutableArray *shareArray;
@property(nonatomic, strong) NSMutableArray *functionArray;

@end

@implementation ViewController



- (IBAction)touchClick2:(id)sender {
    
    __weak typeof(self) weakself = self;
    
    // 创建代表每个按钮的模型
    ZYShareItem *item0 = [ZYShareItem itemWithTitle:@"发送给朋友"
                                               icon:@"Action_Share"
                                            handler:^{ [weakself itemAction:@"点击了发送给朋友"]; }];
    
    ZYShareItem *item1 = [ZYShareItem itemWithTitle:@"分享到朋友圈"
                                               icon:@"Action_Moments"
                                            handler:^{ [weakself itemAction:@"点击了分享到朋友圈"]; }];
    
    ZYShareItem *item2 = [ZYShareItem itemWithTitle:@"收藏"
                                               icon:@"Action_MyFavAdd"
                                            handler:^{ [weakself itemAction:@"点击了收藏"]; }];
    
    ZYShareItem *item3 = [ZYShareItem itemWithTitle:@"QQ空间"
                                               icon:@"Action_qzone"
                                            handler:^{ [weakself itemAction:@"点击了QQ空间"]; }];
    
    ZYShareItem *item4 = [ZYShareItem itemWithTitle:@"QQ"
                                               icon:@"AS_QQ"
                                            handler:^{ [weakself itemAction:@"点击了QQ"]; }];
    
    ZYShareItem *item5 = [ZYShareItem itemWithTitle:@"Facebook"
                                               icon:@"Action_facebook"
                                            handler:^{ [weakself itemAction:@"点击了Facebook"]; }];
    
    ZYShareItem *item6 = [ZYShareItem itemWithTitle:@"查看公众号"
                                               icon:@"Action_Verified"
                                            handler:^{ [weakself itemAction:@"点击了查看公众号"]; }];
    
    ZYShareItem *item7 = [ZYShareItem itemWithTitle:@"复制链接"
                                               icon:@"Action_Copy"
                                            handler:^{ [weakself itemAction:@"点击了复制链接"]; }];
    
    ZYShareItem *item8 = [ZYShareItem itemWithTitle:@"调整字体"
                                               icon:@"Action_Font"
                                            handler:^{ [weakself itemAction:@"点击了调整字体"]; }];
    
    ZYShareItem *item9 = [ZYShareItem itemWithTitle:@"刷新"
                                               icon:@"Action_Refresh"
                                            handler:^{ [weakself itemAction:@"点击了刷新"]; }];
    
    NSArray *shareItemsArray = @[item0, item1, item2, item3, item4, item5];
    NSArray *functionItemsArray = @[item6, item7, item8, item9];
    
    // 创建shareView
    ZYShareView *shareView = [ZYShareView shareViewWithShareItems:shareItemsArray
                                                    functionItems:functionItemsArray];
    // 弹出shareView
    [shareView show];

    
}

#pragma mark -

- (void)itemAction:(NSString *)title
{
    NSLog(@"%@", title);
}


- (NSMutableArray *)shareArray{
    if (!_shareArray) {
        _shareArray = [NSMutableArray array];
        
        [_shareArray addObject:FQPlatformNameSms];
        [_shareArray addObject:FQPlatformNameEmail];
        [_shareArray addObject:FQPlatformNameSina];
        [_shareArray addObject:FQPlatformNameWechat];
        [_shareArray addObject:FQPlatformNameQQ];
        [_shareArray addObject:FQPlatformNameAlipay];
    }
    return _shareArray;
}
- (NSMutableArray *)functionArray{
    if (!_functionArray) {
        _functionArray = [NSMutableArray array];
        [_functionArray addObject:[[FQShareItem alloc] initWithImage:[UIImage imageNamed:@"function_collection"] title:@"收藏" action:^(FQShareItem *item) {
            ALERT_MSG(@"提示",@"点击了收藏",self);
        }]];
        [_functionArray addObject:[[FQShareItem alloc] initWithImage:[UIImage imageNamed:@"function_copy"] title:@"复制" action:^(FQShareItem *item) {
            ALERT_MSG(@"提示",@"点击了复制",self);
        }]];
        [_functionArray addObject:[[FQShareItem alloc] initWithImage:[UIImage imageNamed:@"function_expose"] title:@"举报" action:^(FQShareItem *item) {
            ALERT_MSG(@"提示",@"点击了举报",self);
        }]];
        [_functionArray addObject:[[FQShareItem alloc] initWithImage:[UIImage imageNamed:@"function_font"] title:@"调整字体" action:^(FQShareItem *item) {
            ALERT_MSG(@"提示",@"点击了调整字体",self);
        }]];
        [_functionArray addObject:[[FQShareItem alloc] initWithImage:[UIImage imageNamed:@"function_link"] title:@"复制链接" action:^(FQShareItem *item) {
            ALERT_MSG(@"提示",@"点击了复制链接",self);
        }]];
        [_functionArray addObject:[[FQShareItem alloc] initWithImage:[UIImage imageNamed:@"function_refresh"] title:@"刷新" action:^(FQShareItem *item) {
            ALERT_MSG(@"提示",@"点击了刷新",self);
        }]];
    }
    return _functionArray;
}

- (IBAction)touchClick:(id)sender {
    
    FQShareView *shareView = [[FQShareView alloc] initWithShareItems:self.shareArray functionItems:self.functionArray itemSize:CGSizeMake(80,100)];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headerView.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, headerView.frame.size.width, 15)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:51/255.0 green:68/255.0 blue:79/255.0 alpha:1.0];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"我是头部可以自定义的View";
    [headerView addSubview:label];
    
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    footerView.backgroundColor = [UIColor clearColor];
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, headerView.frame.size.width, 15)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:5/255.0 green:27/255.0 blue:40/255.0 alpha:1.0];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:18];
    label.text = @"我是底部可以自定义的View";
    [footerView addSubview:label];
    
    shareView.headerView = headerView;
    shareView.footerView = footerView;
    shareView = [self addShareContent:shareView];
    [shareView showFromControlle:self];
    
    
}

//添加分享的内容
- (FQShareView *)addShareContent:(FQShareView *)shareView{
    [shareView addText:@"分享测试"];
    [shareView addURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [shareView addImage:[UIImage imageNamed:@"share_alipay"]];
    
    return shareView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
