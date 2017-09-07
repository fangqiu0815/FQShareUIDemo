//
//  FQShareItemCell.m
//  FQShareUIDemo
//
//  Created by apple-gaofangqiu on 2017/9/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import "FQShareItemCell.h"

NSString *const  kCellIdentifier_IFMShareItemCell = @"FQShareItemCell";

@interface FQShareItemCell ()

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIView *rightLine;

@end

@implementation FQShareItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        _titleLable = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLable];
        
        
    }
    return self;
}

- (void)layoutSubviews{
    
    _imageView.frame = CGRectMake(0, 0 ,_itemImageSize.width, _itemImageSize.height);
    
    CGPoint imageCenter = self.center;
    imageCenter.y = _imageView.frame.size.height/2 + _itemImageTopSpace;
    imageCenter.x = self.frame.size.width/2;
    _imageView.center = imageCenter;
    
    [_titleLable sizeToFit];
    CGPoint titleCenter = _imageView.center;
    titleCenter.y = imageCenter.y + _imageView.frame.size.height/2 + _iconAndTitleSpace + _titleLable.frame.size.height/2;
    _titleLable.center = titleCenter;
}

- (void)setShowBorderLine:(BOOL)showBorderLine{
    _showBorderLine = showBorderLine;
    if (_showBorderLine) {
        [self addSubview:self.bottomLine];
        [self addSubview:self.rightLine];
    }
}
- (void)setShareItem:(FQShareItem *)shareItem{
    _shareItem = shareItem;
    _imageView.image = shareItem.image;
    _titleLable.text = shareItem.title;
    [_titleLable sizeToFit];
}

- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
        _bottomLine.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
        
    }
    return _bottomLine;
}

- (UIView *)rightLine
{
    if (!_rightLine) {
        _rightLine = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width-0.5, 0, 0.5, self.frame.size.height)];
        _rightLine.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
        
    }
    return _rightLine;
}





@end
