//
//  XWShareItemButton.m
//  zhangshangPacket
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import "XWShareItemButton.h"
#define XNWidth_Scale        [UIScreen mainScreen].bounds.size.width/375.0f
#define XNFont(font)         [UIFont systemFontOfSize:(font)]

@implementation XWShareItemButton

+ (instancetype)shareButton{
    
    return [self buttonWithType:UIButtonTypeCustom];
}

- (UIEdgeInsets)imageEdgeInsets{
    
    return UIEdgeInsetsMake(0,
                            15*XNWidth_Scale,
                            30*XNWidth_Scale,
                            15*XNWidth_Scale);
}

- (instancetype)initWithFrame:(CGRect)frame
                    ImageName:(NSString *)imageName
                     imageTag:(NSInteger)imageTAG
                        title:(NSString *)title
                    titleFont:(CGFloat)titleFont
                   titleColor:(UIColor *)titleColor

{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpShareButtonImageName:imageName
                               imageTag:imageTAG
                                  title:title
                              titleFont:titleFont
                             titleColor:titleColor];
    }
    return self;
}

- (void)setUpShareButtonImageName:(NSString *)imageName
                         imageTag:(NSInteger)imageTAG
                            title:(NSString *)title
                        titleFont:(CGFloat)titleFont
                       titleColor:(UIColor *)titleColor
{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2.5,0,self.yj_width-5,self.yj_width-5)];
    imageView.tag = imageTAG;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:imageName];
    [self addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, self.yj_width, 10)];
    label.textColor = titleColor;
    label.text = title;
    label.font = XNFont(titleFont);
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
}

@end
